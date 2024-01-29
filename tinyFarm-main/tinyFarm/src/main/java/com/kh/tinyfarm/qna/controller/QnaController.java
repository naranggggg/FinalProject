package com.kh.tinyfarm.qna.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.qna.model.service.QnaService;
import com.kh.tinyfarm.qna.model.vo.Qna;

@Controller
public class QnaController {

	
		@Autowired
		private QnaService qnaService;
		
		
		//사용자 QNA 등록 페이지
		@GetMapping("/qnaForm.qa")
		public String qnaForm() {
			return "qna/qnaForm";
		}
		
		
		//사용자 QNA 입력
		@PostMapping("/qnaEnroll.qa")
		public String qnaEnroll(Qna qna, Model model, HttpSession session) {
			
			System.out.println(qna);
			
			int result = qnaService.qnaEnroll(qna);
			
			if(result > 0) {
	        	session.setAttribute("alertMsg", "문의사항이 등록되었습니다.");
			}else {
				session.setAttribute("alertMsg", "등록 오류!");
			}
			
			return "redirect:qnaList.qa";
			
		}
		
		
		//사용자 QNA 목록
		@GetMapping("/qnaList.qa")
		public String selectMyQnaList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, @RequestParam(value="showPeriod", defaultValue="1") int showPeriod, Model model, HttpSession session) {
			
			Member m = null;
			
			if((Member) session.getAttribute("loginUser") != null) {
				m = (Member) session.getAttribute("loginUser");
				
			}else {
				session.setAttribute("alertMsg", "로그인을 해주세요.");
				return "redirect:loginGo.me";
			}

			int userNo = m.getUserNo();
			
			HashMap<String, Integer> qMap = new HashMap<String, Integer>();
			qMap.put("userNo", userNo);
			qMap.put("showPeriod", showPeriod);
			
			
			
			
			// 전체 게시글 개수(listCount) - selectListCount() 메소드 명
			int qnaListCount = qnaService.qnaListCount(qMap);
	
			// 한 페이지에서 보여줘야 하는 게시글 개수(boardLimit)
			int boardLimit = 5;
			// 페이징 바 개수(pageLimit)
			int pageLimit = 5;
	
			PageInfo pi = Pagination.getPageInfo(qnaListCount, currentPage, pageLimit, boardLimit);
	
			
			ArrayList<Qna> qList = qnaService.selectMyQnaList(pi, qMap);
			
			model.addAttribute("qList", qList);
			model.addAttribute("pi", pi);
			model.addAttribute("period", showPeriod);
	
			return "qna/qnaList";
		}

		
		
		//사용자 QNA 수정 Form
		@PostMapping("/qnaUpdateForm.qa")
		public String myQnaUpdate(int qnaNo, Model model) {
			
			Qna qna = qnaService.selectQnaDetail(qnaNo);
			
			model.addAttribute("qna", qna);
			
			return "qna/qnaUpdateForm";
			
		}
		
		
		//사용자 QNA 수정
		@PostMapping("/qnaUpdate.qa")
		public String qnaUpdate(Qna updateQna, Model model, HttpSession session) {
			
			int result = qnaService.myQnaUpdate(updateQna);
	
			if(result > 0) {
	        	session.setAttribute("alertMsg", "문의사항 수정 완료하였습니다.");
			}else {
				session.setAttribute("alertMsg", "수정 실패!");
			}
			
			return "redirect:qnaList.qa";
		}
		
		
		//사용자 QNA 삭제
		@PostMapping("/qnaDelete.qa")
		public String myQnaDelete(int qnaNo, Model model, HttpSession session) {
			
			int result = qnaService.myQnaDelete(qnaNo);
			
			if(result > 0) {
	        	session.setAttribute("alertMsg", "문의사항을 삭제하였습니다.");
			}else {
				session.setAttribute("alertMsg", "삭제 실패!");
			}
			
			return "redirect:qnaList.qa";
		}
	
		
	}
