package com.kh.tinyfarm.notice.controller;

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
import com.kh.tinyfarm.notice.model.service.NoticeService;
import com.kh.tinyfarm.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 리스트 불러오기
	@RequestMapping("noticeList.no")
	public String noticeList(@RequestParam(value = "currentPage",defaultValue = "1")int currentPage
							,@RequestParam(value = "sText",defaultValue = "")String sText
							,@RequestParam(value = "sType",defaultValue = "제목")String sType
							 ,Model model) {
		if(sText.equals("")) { //sText(검색어)가 비어있다면 그냥 리스트 불러오기
			
			int listCount = noticeService.getListCount();
			int pageLimit = 10;
			int boardLimit = 10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			//공지 리스트
			ArrayList<Notice> list = noticeService.selectNoticeList(pi);
			//중요 분류만 가져오는 리스트 (페이징 처리 없이 헤더에 있는대로 넣을 생각이기 떄문에 pi 넣지 않음
			ArrayList<Notice> impoList = noticeService.selectImpoNoticeList();
			
			model.addAttribute("list", list);
			model.addAttribute("impoList", impoList);
			model.addAttribute("pi", pi);
			return "notice/noticeList";
		}else {
			HashMap<String,String> map = new HashMap<>();
			map.put("sText", sText);
			map.put("sType", sType);
			//검색어 개수
			int listCount = noticeService.getSearchCount(map);
			int pageLimit = 10;
			int boardLimit = 10;
			System.out.println(sType);
			System.out.println(listCount);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			System.out.println(pi);
			map.put("boardLimit",String.valueOf(boardLimit));
			map.put("currentPage",String.valueOf(currentPage));
			//검색한 공지 리스트
			ArrayList<Notice> list = noticeService.selectSearchList(map);
			
			//중요 분류만 가져오는 리스트 (페이징 처리 없이 헤더에 있는대로 넣을 생각이기 떄문에 pi 넣지 않음
			ArrayList<Notice> impoList = noticeService.selectImpoNoticeList();
			
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("impoList", impoList);
			model.addAttribute("sText", sText);
			model.addAttribute("sType", sType);
			return "notice/noticeList";
		}
	}
	//공지사항 작성 뷰로 이동
	@RequestMapping("goInsertNotice.no")
	public String goInsertNotice() {
		return "notice/noticeInsert";
	}
	
	//공지사항 추가
	@PostMapping("insertNotice.no")
	public String insertNotice(HttpSession session,Notice no) {
		int result = noticeService.insertNotice(no);
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항 작성 완료");
			return "redirect:noticeList.no";
		} else {
			session.setAttribute("alertMsg", "공지사항 작성 실패");
			return "notice/noticeInsert";
		}
	}
	//상세보기
	@RequestMapping("detailNotice.no")
	public String detailNotice(int noticeNo,Model model,HttpSession session) {
		//조회수 증가
		int result = noticeService.countUp(noticeNo);
		if(result > 0) {
			Notice notice = noticeService.detailNotice(noticeNo);
			model.addAttribute("notice", notice);
			return "notice/noticeDetail";	
		} else {
			session.setAttribute("alertMsg","상세보기 실패");
			return "redirect:/noticeList.no";	
		}
	}
	
	//업데이트 뷰로 가는 메소드
	@GetMapping("updateNotice.no")
	public String goUpdateNotice(int noticeNo,Model model) {
		Notice notice = noticeService.detailNotice(noticeNo);
		
		model.addAttribute("notice", notice);
		return "notice/noticeUpdate";
	}
	
	//공지사항 수정하는 메소드
	@PostMapping("updateNotice.no")
	public String updateNotice(Notice no,HttpSession session) {
		int result = noticeService.updateNotice(no);
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항 수정이 완료되었습니다");
			return "redirect:/noticeList.no";
		}else {
			return "common/errorPage";
		}
	}
	
	//삭제
	@PostMapping("deleteNotice.no")
	public String deleteNotice(int noticeNo,HttpSession session) {
		int result = noticeService.deleteNotice(noticeNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항 삭제가 완료되었습니다");
			return "redirect:/noticeList.no";
		}else {
			return "common/errorPage";
		}

	}
}
