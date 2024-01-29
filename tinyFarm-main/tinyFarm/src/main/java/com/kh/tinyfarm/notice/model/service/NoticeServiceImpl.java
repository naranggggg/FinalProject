package com.kh.tinyfarm.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.notice.model.dao.NoticeDao;
import com.kh.tinyfarm.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	//공지사항 개수 세기
	@Override
	public int getListCount() {
		return noticeDao.getListCount(sqlSession);
	}
	//공지사항 리스트 가져오기
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {	
		return noticeDao.selectNoticeList(sqlSession,pi);
	}
	
	//공지사항 작성
	@Override
	public int insertNotice(Notice no) {
		
		return noticeDao.insertNotice(sqlSession,no);
	}
	//분류가 중요인 공지만 가져오기
	@Override
	public ArrayList<Notice> selectImpoNoticeList() {
		
		return noticeDao.selectImpoNoticeList(sqlSession);
	}
	
	//상세보기
	@Override
	public Notice detailNotice(int noticeNo) {		
		return noticeDao.detailNotice(sqlSession,noticeNo);
	}
	//삭제
	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeDao.deleteNotice(sqlSession,noticeNo);
	}
	
	//수정
	@Override
	public int updateNotice(Notice no) {
		// TODO Auto-generated method stub
		return noticeDao.updateNotice(sqlSession,no);
	}
	//조회수 증가
	@Override
	public int countUp(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeDao.countUp(sqlSession,noticeNo);
	}
	
	//검색어 개수 세기
	@Override
	public int getSearchCount(HashMap map) {
		// TODO Auto-generated method stub
		return noticeDao.getSearchCount(sqlSession,map);
	}
	//검색 리스트
	@Override
	public ArrayList<Notice> selectSearchList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return noticeDao.selectSearchList(sqlSession,map);
	}
}
