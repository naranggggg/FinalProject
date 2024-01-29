package com.kh.tinyfarm.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.admin.model.dao.AdminDao;
import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.board.model.vo.BoardReport;
import com.kh.tinyfarm.common.model.vo.PageInfo;

@Service
public class AdminServiceImpl implements AdminService{
	
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	// ================================================
	//	BoardReport
	
	//신고 게시글 개수
//	@Override
//	public int boardReportListCount() {
//		return adminDao.boardReportListCount(sqlSession);
//	}
	
	@Override
	public int reportListCount(HashMap<String, String> map) {
		return adminDao.reportListCount(sqlSession, map);
	}
	
	
	//신고 게시글 목록
	@Override
	public ArrayList<BoardReport> selectReportList(PageInfo pi, HashMap<String,String> map) {
		return adminDao.selectReportList(sqlSession, pi, map);
	}

	
	//신고게시글 일괄변경하기
	@Override
	public int reportStatus(Map<String, Object> map) {
		return adminDao.reportStatus(sqlSession, map);
	}
	
	
	//
	@Override
	public HashMap<String, Object> reportDetailInfo(int replyNo) {
		
		
		HashMap<String, Object> bMap = new HashMap<String, Object>();
		
		Board reportBoardDetailInfo = adminDao.reportBoardDetailInfo(sqlSession, replyNo);
		BoardReply reportReplyDetailInfo = adminDao.reportReplyDetailInfo(sqlSession, replyNo);
		
		bMap.put("boardObj", reportBoardDetailInfo);
		bMap.put("boardReplyObj", reportReplyDetailInfo);
		
		return bMap;
		
	}
	
	
	
	// ================================================
	
	//Today 통계
	@Override
	public int selectStaticCount(String tableName, String selectRange, String whereRange) {
		return adminDao.selectStaticCount(sqlSession, tableName, selectRange, whereRange);
	}

	
	//소셜회원 가입수
	@Override
	public int memberStaticCount(String category) {
		return adminDao.memberStaticCount(sqlSession, category);
	}




	
	
	

}
