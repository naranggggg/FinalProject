package com.kh.tinyfarm.common.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionSuspensionNotSupportedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tinyfarm.common.model.service.BookService;
import com.kh.tinyfarm.common.model.vo.Book;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;
import com.kh.tinyfarm.member.model.service.MemberService;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.qna.model.vo.Qna;

@Controller
public class BookRecomController {
 
	@Autowired
	private BookService bookService;

	//책 추천 메인페이지
	@RequestMapping("bookMain.re")
	public String selectBookList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
								 @RequestParam(value="orderByStandard", defaultValue="byEnrolldate") String orderByStandard,	//정
								 @RequestParam(value="showBookCount", defaultValue="6") int showBookCount,						//보여지는 개수
							 	 @RequestParam(value="bookCategory", defaultValue="all") String bookCategory,					//책 카테고리(where)
								 Model model) {
			
		
			System.out.println("bookCategory: " + bookCategory);
		
		
			HashMap<String, String> bookMap = new HashMap<>();
			bookMap.put("orderByStandard", orderByStandard);
			bookMap.put("showBookCount", String.valueOf(showBookCount));
			bookMap.put("bookCategory", bookCategory);
			
			
			// 전체 게시글 개수(listCount) - selectListCount() 메소드 명
			int bookListCount = bookService.bookListCount(bookMap);
			
			// 한 페이지에서 보여줘야 하는 게시글 개수(boardLimit)
			int boardLimit = showBookCount;
			// 페이징 바 개수(pageLimit)
			int pageLimit = 5;
			
			PageInfo pi = Pagination.getPageInfo(bookListCount, currentPage, pageLimit, boardLimit);
			
			// 페이징 처리된 게시글 목록 조회해서 boardListView에 보여주기
			ArrayList<Book> bookList = bookService.selectBookList(pi, bookMap);
			
			
			model.addAttribute("bookList", bookList);
			model.addAttribute("pi", pi);
			model.addAttribute("bookMap", bookMap);
			
	       return "book/bookMain";  
	   }
	
	
	
	//책 등록 페이지
	@RequestMapping("bookInsert.re")
	public String bookInsert() {
		return "book/bookInsert";  
	}
	
	
	
	// 책등록 페이지
	@PostMapping("insert.re")
	public String insertBook(Book b, MultipartFile upfile, HttpSession session) {
		
//		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
//		m.setUserPwd(encPwd);

		if (!upfile.getOriginalFilename().equals("")) {
			String BookChangeName = saveFile(upfile, session);
			b.setBookOriginName(upfile.getOriginalFilename());
			b.setBookChangeName("resources/uploadFiles/book/" + BookChangeName);
		} else {
			// 파일이 업로드되지 않았거나 null인 경우
			b.setBookOriginName("bookImage.jpg");
			b.setBookChangeName("resources/uploadFiles/book/bookImage.jpg");
		}

		int result = bookService.insertBook(b);

		// 여기에 추가적인 로직이나 결과에 대한 처리를 추가할 수 있습니다.
		if (result > 0) {
			session.setAttribute("alertMsg", "도서 등록 완료");
			return "redirect:/bookList.ad";
		} else {
			session.setAttribute("alertMsg", "도서 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
	// 파일명 수정 모듈
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String BookOriginName = upfile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = BookOriginName.substring(BookOriginName.lastIndexOf("."));

		String BookChangeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/book/");

		try {
			upfile.transferTo(new File(savePath + BookChangeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return BookChangeName;
	}

	

	//책 상세조회
	@GetMapping("bookDetail.re")
	public String bookDetail(int bookNo, Model model) {
		
		int result = bookService.increaseCount(bookNo);
		System.out.println("책 조회수 1 증가: " + result);
		
		Book book = null;
		
		if(result > 0) {
			book = bookService.bookDetail(bookNo);
		}

		model.addAttribute("book", book);
		
		return "book/bookDetail";
		
	}
	
	
	//book 업데이트
	@GetMapping("bookUpdate.re")
	public String bookUpdate(int bookNo, Model model) {
		
		Book book = bookService.bookDetail(bookNo);
		model.addAttribute("book", book);

		return "book/bookUpdate";
	}
	
	
	
	@PostMapping("bookUpdate.re")
	public String bookUpdate(Book book, MultipartFile upfile, HttpSession session) {
		
		System.out.println(book);
		System.out.println(upfile.getOriginalFilename());
		
		//기존 책 정보
		Book oldBook = bookService.bookDetail(book.getBookNo());
		
		System.out.println("옛날 책정보: " + oldBook);
		
		
		//파일이 바뀌었을 때
		if (!upfile.getOriginalFilename().equals("")) {
			
			String bookChangeName = saveFile(upfile, session);
			book.setBookOriginName(upfile.getOriginalFilename());
			book.setBookChangeName("resources/uploadFiles/book/" + bookChangeName);
			
			if(!oldBook.getBookChangeName().equals("")) {
			
				//new File 객체로 해당 경로에 있는 파일(업로드되어있던)을 delete 메소드로 지우기
				new File(session.getServletContext().getRealPath(oldBook.getBookChangeName())).delete();
			}
			
		}else {
			//안 바뀜
			book.setBookOriginName(oldBook.getBookOriginName());
			book.setBookChangeName(oldBook.getBookChangeName());
		}
		
		System.out.println(book);
		
		int result = bookService.bookUpdate(book);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "도서 정보 수정이 완료되었습니다.");
		}else {
			session.setAttribute("alertMsg", "도서 정보 수정에 실패하였습니다.");
		}
		
		
		return "redirect:bookDetail.re?bookNo=" + book.getBookNo();
	}
	

	
	
	@PostMapping("bookDelete.re")
	public String bookDelete(int bookNo, @RequestParam(value="type", defaultValue="") String adminBook, HttpSession session) {
		
		int result = bookService.bookDelete(bookNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "도서 정보 삭제가 완료되었습니다.");
		}else {
			session.setAttribute("alertMsg", "오류가 발생하였습니다.");
		}
		
		if(adminBook.equals("")) {
			return "redirect:bookMain.re";
		}
		
		return "redirect:bookList.ad";
	}
	
	
}
