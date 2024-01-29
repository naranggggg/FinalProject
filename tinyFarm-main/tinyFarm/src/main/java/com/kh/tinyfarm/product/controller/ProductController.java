package com.kh.tinyfarm.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tinyfarm.common.model.vo.Attachment;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.product.model.service.ProductService;
import com.kh.tinyfarm.product.model.vo.Category;
import com.kh.tinyfarm.product.model.vo.Like;
import com.kh.tinyfarm.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productservice;
	
	//상품 리스트
	@GetMapping("plist.bo")
	public String selectProductList(@RequestParam(value="currentPage",defaultValue="1") int currentPage,
									Model model,String category, String keyword){

		int maxPage; // 가장 마지막 페이징바
		int startPage; // 페이징바 시작수
		int endPage; //페이징바 끝수
		
		HashMap<String, String> map = new HashMap<>();
	    map.put("keyword", keyword);
	    map.put("category", category);
		
		//페이징 처리된 전체 상품 조회
		int listCount = productservice.listCount(map);
		
		int productLimit = 9;
		int pageLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, productLimit);
		
		ArrayList<Product> list = productservice.selectList(pi,map);
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "product/ProductListView";
	}
	
	
	//상품 상세조회
	@GetMapping("pdetail.bo")
	public String selectProduct(int pno, Model model, HttpSession session) {
		
		int result = productservice.increaseCount(pno);
				
		if(result>0) {
			
			//오렌지에 대한 모든 정보
			Product p = productservice.selectProduct(pno);
			
			int userNo = 0;
			
			if((Member) session.getAttribute("loginUser") != null) {
				
				userNo = ((Member) session.getAttribute("loginUser")).getUserNo();
				
				System.out.println("userNo " + userNo);
			}
			
			Product product = new Product();
			product.setProductNo(pno);
			product.setUserNo(userNo);
			
			int likeResult = productservice.selectLikeYn(product);
			
			
			System.out.println(p);
			
			model.addAttribute("p",p);
			model.addAttribute("likeNo", likeResult);
			
			
		}else {
			model.addAttribute("errorMsg", "게시글 조회 실패");
			return "product/ProductListView";
		}

			return "product/ProductDetailView";
	}
	
	
	//카테고리 조회
	@GetMapping("pinsert.bo")
	public String productEnrollForm(Model model){
		
		ArrayList <Category> clist = productservice.selectCategoryList();
		
		model.addAttribute("clist",clist);
		
		return "product/ProductEnrollForm";
	}
	
	//상품 등록
	@PostMapping("pinsert.bo")
	public String insertProduct(Product p, Model model, MultipartFile upfile, HttpSession session) {

		int presult = productservice.insertProduct(p);
		int aresult = 0;
		
		System.out.println("등록p : "+p);
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			Attachment a = new Attachment();
			
			String changeName = saveFile(upfile,session);
			
			a.setOriginName(upfile.getOriginalFilename());
			a.setChangeName(changeName);
			a.setFilePath("resources/uploadFiles/");
			
			aresult = productservice.insertAttachment(a);
			
			System.out.println("등록pr : "+presult);
			System.out.println("등록ar : "+aresult);
			System.out.println("등록a : "+a);
			
		}
			
		
			if((presult*aresult)>0) { 
				
				session.setAttribute("alertMsg", "게시글 등록 성공"); 
				return "redirect:plist.bo"; 
				
				}else { 
					session.setAttribute("alertMsg", "게시글 등록 실패");
					return "product/ProductListView"; 
			}
	}
	

		
		//파일명 수정 모듈
		public String saveFile(MultipartFile upfile
							  ,HttpSession session) {
			//파일명 수정하기 
			//1. 원본파일명 추출 
			String originName = upfile.getOriginalFilename(); 
			
			//2. 시간 추출하기 (년월일시분초) - util.Date 
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			//3. 뒤에 붙일 랜덤값 5자리 추출하기 
			int ranNum = (int)(Math.random()*90000+10000);
			
			//4.원본파일명에서 확장자 추출하기 test.txt - 뒤에서부터 . 을찾고 그 뒤로 잘라내기 .txt 
			String ext = originName.substring(originName.lastIndexOf("."));
			
			//5. 2,3,4 이어붙여서 변경이름 만들기(업로드이름)
			String changeName = currentTime+ranNum+ext;
			
			//6.저장시킬 실질적인 물리적 경로 추출하기 
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			//7. 경로와 수정파일명으로 파일 업로드 하기(경로+파일명) 파일객체를 생성한뒤 해당 파일 객체를 업로드시킨다.
			try {
				upfile.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return changeName;
		}
		
	//수정하기
	@GetMapping("pupdate.bo")
	public String productUpdateForm(int pno, Model model) {
		
		Product p = productservice.selectProduct(pno);
		
		ArrayList <Category> clist = productservice.selectCategoryList();
	
		model.addAttribute("p",p);
		model.addAttribute("clist",clist);

		return "product/ProductUpdateForm";
	}
	
	
	@PostMapping("pupdate.bo")
	public String updateProduct(Product p, MultipartFile reUpFile, Model model, HttpSession session) {
		
		int presult = productservice.updateProduct(p);
		int aresult = 0;
		
		System.out.println("pr0 : "+presult);
		System.out.println("ar0 : "+aresult);
		System.out.println("p : "+p);
		
		//게시글에 이미 첨부파일이 있는 경우 or 없는 경우
		//파일이 담겨 넘어왔다면(새로운 첨부파일이 있는 경우)
		if(!reUpFile.getOriginalFilename().equals("")) {
			
			System.out.println("reUpFile : "+reUpFile);
			
			Attachment a = new Attachment();
			
			System.out.println("a : "+a);
			
			String changeName = saveFile(reUpFile, session);
			
			//기존에 파일이 있다면
			if(!p.getChangeName().equals("")) {
				
				System.out.println("p : "+p);
			
				//new File 객체로 해당 경로에 있는 파일(업로드되어있던)을 delete 메소드로 지우기
				new File(session.getServletContext().getRealPath(p.getChangeName())).delete();
			}
			
			//attachment 객체에 originName과 changeName을 담기
			
			a.setOriginName(reUpFile.getOriginalFilename());
			a.setChangeName(changeName);
			a.setFilePath("resources/uploadFiles/");
			a.setRefNo(p.getProductNo());
			
			aresult = productservice.updateAttachment(a);
			
			System.out.println("pr : "+presult);
			System.out.println("ar : "+aresult);
			System.out.println("a : "+a);
		} 
		
		//전달된 파일이 있다면 세팅이 되었을테니 해당 정보 포함하여 데이터베이스에 전달하기
		//update - DML
		
		
		if((presult+aresult)>0) {//수정 성공
			
			System.out.println("pr2 : "+presult);
			System.out.println("ar2 : "+aresult);
			
			session.setAttribute("alertMsg","게시글 수정 성공");
			
			System.out.println("수정성공");
			
			return "redirect:pdetail.bo?pno="+p.getProductNo();
			
		}else {
			session.setAttribute("alertMsg","게시글 수정 실패");
			return "product/ProductListView";
		}
		 
	}
	
	//상품 삭제
	@RequestMapping("pdelete.bo")
	public String deleteProduct(int pno, String filePath, HttpSession session) {
		
		int result = productservice.deleteProduct(pno);
		
		if(result>0) {
			
//			File f = new File(session.getServletContext().getRealPath(filePath));
//					f.delete();
					
			session.setAttribute("alertMsg", "상품 삭제 성공");
			
		}else {
			session.setAttribute("alertMsg", "상품 삭제 실패");
		}
		
		return "redirect:plist.bo";
		
	}
	
	//상품 주문
	@RequestMapping("porder.bo")
	public String orderProduct(int pno, Model model) {
		
		Product selectProduct = productservice.selectProduct(pno);

		model.addAttribute("p", selectProduct);

		return "product/ProductOrderForm";
	}
	
	//상품 좋아요 등록
	@ResponseBody
	@RequestMapping(value = "likeInsert.bo")
	public int insertLike(@RequestParam int pno, HttpSession session) {
		
		Like like = new Like();

		like.setProductNo(pno);
		like.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		
		int p = productservice.insertLike(like);
		
		return p;
	}
	
	//상품 좋아요 해제
	@ResponseBody
	@RequestMapping(value = "likeRemove.bo")
	public int removeLike(@RequestParam int pno, HttpSession session) {
		
		Like like = new Like();

		like.setProductNo(pno);
		like.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		
		int p = productservice.removeLike(like);
		
		
		return p;
	}


}

	
	
	


