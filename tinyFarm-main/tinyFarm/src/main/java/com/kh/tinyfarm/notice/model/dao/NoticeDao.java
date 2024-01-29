package com.kh.tinyfarm.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
	//공지사항 개수 세기
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}
	
	//공지사항 리스트 가져오기
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}
	//공지사항 작성
	public int insertNotice(SqlSessionTemplate sqlSession, Notice no) {
		return sqlSession.insert("noticeMapper.insertNotice", no);
	}
	//중요 공지만 가져오기
	public ArrayList<Notice> selectImpoNoticeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectImpoNoticeList", sqlSession);
	}
	
	//상세보기
	public Notice detailNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.detailNotice", noticeNo);
	}
	
	
	
	//삭제
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	//수정
	public int updateNotice(SqlSessionTemplate sqlSession, Notice no) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateNotice", no);
	}

	//조회수 증가
	public int countUp(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.countUp", noticeNo);
	}
	
	
	//검색된 공지사항 개수 세기
	public int getSearchCount(SqlSessionTemplate sqlSession, HashMap map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.getSearchCount", map);
	}
	
	//검색 리스트 
	public ArrayList<Notice> selectSearchList(SqlSessionTemplate sqlSession,HashMap<String, String> map) {
		int boardLimit = Integer.parseInt(map.get("boardLimit"));
		int currentPage = Integer.parseInt(map.get("currentPage"));
		int limit = boardLimit;
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.selectSearchList", map, rowBounds);
		
	}
	
}
