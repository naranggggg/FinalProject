package com.kh.tinyfarm.follow.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tinyfarm.diary.model.vo.Diary;
import com.kh.tinyfarm.follow.model.service.FollowService;
import com.kh.tinyfarm.follow.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	//게시판 팔로우 걸기
		@RequestMapping("insertFollow.fw")
		public String insertFollow(int boardNo,Follow fw) {
			
			int result =followService.insertFollow(fw);
			
			if(result>0) {	
				return "redirect:detail.bo?boardNo="+boardNo;
			}else {
			
				return "common/errorPage";
			}
		}
	
	//게시판 팔로우 취소하기
	@RequestMapping("deleteFollow.fw")
	public String deleteFollow(int boardNo,Follow fw) {
		//System.out.println("fw :"+fw);
	
		int result =followService.deleteFollow(fw);
		//System.out.println(result);
		
		if(result>0) {	
		
			return "redirect:detail.bo?boardNo="+boardNo;
		}else {
			
			return "common/errorPage";
		}
	}
	
	
	//회원정보 모달창
	//팔로우 확인
	@ResponseBody
	@RequestMapping("followChk.me")
	public String followCheck(int userNo,String followingId) {
		
		Follow f = new Follow();
		f.setUserNo(userNo);
		f.setFollowingId(followingId);
		
		int result = followService.followCheck(f);
		
		if(result==1) {
			return "YY";
		}else {
			return "NN";
		}
	}
	//팔로우
	@RequestMapping("follow.me")
	public String followUser(String followingId,HttpSession session, HttpServletRequest request) {
		//로그인 유저 정보
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		Follow fw = new Follow();
		fw.setUserNo(userNo);
		fw.setFollowingId(followingId);
		
		//이전페이지
		String before = (String)request.getHeader("Referer");
		
		int result = followService.insertFollow(fw);
		
		if(result>0) {	
			session.setAttribute("alertMsg", "팔로우 완료!");
		}else {
			session.setAttribute("alertMsg", "팔로우 실패. 다시 확인해주세요.");
		}
		//이전페이지(보고있던 페이지)로 리턴
		return "redirect:"+before;
		
	}
	
	//언팔로우
	@PostMapping("unfollow.me")
	public String unfollowUser(String followingId,HttpSession session, HttpServletRequest request) {
		
		//로그인 유저 정보
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		Follow fw = new Follow();
		fw.setUserNo(userNo);
		fw.setFollowingId(followingId);
		
		//이전페이지
		String before = (String)request.getHeader("Referer");
		
		int result = followService.deleteFollow(fw);
		//언팔 결과 확인 후 활동내역 페이지 유지
		if(result>0) {
			session.setAttribute("alertMsg", "팔로우 취소가 완료되었습니다.");
		}else {
			session.setAttribute("alertMsg", "다시 시도해주세요.");
		}
		//이전페이지(보고있던 페이지)로 리턴
		return "redirect:"+before;
	}
	
	//팔로우 모달창 정보
	@ResponseBody
	@PostMapping(value = "getFollowingInfo.me", produces = "application/json; charset=UTF-8")
	public Member getFollowingInfo(String followingId) {
		Member m = followService.selectFollowingInfo(followingId); //팔로우 한 유저 아이디 정보 가져오기
		return m;
	}
	
	//존재하지 않는 회원 목록에서 삭제
	@PostMapping("deleteNonUser.me")
	public String deleteNonUser(String followingId,HttpSession session, HttpServletRequest request) {
		
		//로그인 유저 회원정보
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		Follow f = new Follow();
		f.setUserNo(userNo);
		f.setFollowingId(followingId);
		int result = followService.deleteFollow(f);
		
		if(result>0) {
			session.setAttribute("alertMsg", "삭제 완료");
		}else {
			session.setAttribute("alertMsg", "다시 시도해주세요.");
		}
		
		//이전페이지
		String before = (String)request.getHeader("Referer");
		
		//이전페이지(보고있던 페이지)로 리턴
		return "redirect:"+before;
	}
		
}
