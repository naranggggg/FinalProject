package com.kh.tinyfarm.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.board.model.vo.BoardReport;
import com.kh.tinyfarm.common.model.vo.PageInfo;

@Repository
public class AdminDao {

	// 신고글 개수
	public int reportListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		int result = sqlSession.selectOne("adminMapper.reportListCount", map);

		System.out.println("********* 게시글 개수 " + result);
		
		return result;
	}

	
	// 신고 게시글 목록
	public ArrayList<BoardReport> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String,String> map) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(map.get("type").equals("board")) {
			return (ArrayList) sqlSession.selectList("adminMapper.selectBoardReportList", map, rowBounds);
		}else {
			return (ArrayList) sqlSession.selectList("adminMapper.selectReplyReportList", map, rowBounds);
		}
		
	}


	//신고글 상태변경
	public int reportStatus(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		if(String.valueOf(map.get("status")).equals("revoke")) {
			return sqlSession.update("adminMapper.revokeReport", map);
		}else {
			return sqlSession.update("adminMapper.deleteReport", map);
		}
		
	}

	

	//main 오늘의 통계
	public int selectStaticCount(SqlSessionTemplate sqlSession, String tableName, String selectRange, String whereRange) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("tableName", tableName);
		map.put("selectRange", selectRange);
		map.put("whereRange", whereRange);
		return sqlSession.selectOne("adminMapper.selectStaticCount", map);
	}

	
	//소셜회원 가입수
	public int memberStaticCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("adminMapper.memberStaticCount", category);
	}


	
	//신고 댓글 상세내역 조회
	public Board reportBoardDetailInfo(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.selectOne("adminMapper.reportBoardDetailInfo", replyNo);
	}
	
	public BoardReply reportReplyDetailInfo(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.selectOne("adminMapper.reportReplyDetailInfo", replyNo);
	}


	
}
