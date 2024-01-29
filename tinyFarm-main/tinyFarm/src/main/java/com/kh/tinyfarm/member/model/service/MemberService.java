package com.kh.tinyfarm.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.vo.Member;

public interface MemberService {

	//로그인 메소드
	Member loginMember(Member m);
	
	//회원가입 메소드
	int insertMember(Member m);
	
	//아이디 중복체크 메소드
	int checkId(String checkId);

	//이메일발송
	public void sendEmail(Member vo, String div, String plainPassword) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, Member vo) throws Exception;

	
	//admin - 회원 목록 (회원수)
	int memberListCount(String searchId);

	//admin - 회원 목록
	ArrayList<Member> selectMemberList(PageInfo pi, String searchId);

	
	//admin - 회원활동 일괄중지
	int memberStatus(Map<String, Object> map);

	
	//아이디 찾기
	String findId(Member member);

	
	//admin - 회원정보 상세 조회
	Member selectMemberDetailInfo(int userNo);

	
	//admin - 회원상태 업데이트
	int memberStatusUpdate(Member m);
	

	
	//카카오 로그인
	String insertKakaoUserInfo(String userId, String userName, String originName, String changeName);
	

	
	
}