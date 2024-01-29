package com.kh.tinyfarm.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.board.model.vo.BoardReport;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.vo.Member;

public interface AdminService {

//	//신고 게시글 개수
//	int boardReportListCount();

	//신고 게시글 목록
	ArrayList<BoardReport> selectReportList(PageInfo pi, HashMap<String,String> map);

	
	//신고 게시글 일괄변경
	int reportStatus(Map<String, Object> map);

	
	//메인 통계(4)
	int selectStaticCount(String tableName, String selectRange, String whereRange);

	
	//회원 가입 비율
	int memberStaticCount(String category);

	
	//신고 게시글 개수
	int reportListCount(HashMap<String, String> map);


	HashMap<String, Object> reportDetailInfo(int replyNo);




}
