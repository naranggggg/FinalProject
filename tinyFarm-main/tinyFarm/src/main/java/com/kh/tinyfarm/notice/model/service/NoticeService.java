package com.kh.tinyfarm.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.notice.model.vo.Notice;

public interface NoticeService {
	
	//공지사항 개수 세기
	int getListCount();
	
	
	//공지사항 리스트 가져오기
	ArrayList<Notice> selectNoticeList(PageInfo pi);

	//공지사항 작성
	int insertNotice(Notice no);

	//분류가 중요인 공지만 가져오기
	ArrayList<Notice> selectImpoNoticeList();

	//상세보기
	Notice detailNotice(int noticeNo);
	
	//삭제
	int deleteNotice(int noticeNo);
	
	//수정
	int updateNotice(Notice no);

	//조회수 증가
	int countUp(int noticeNo);

	//검색어 개수 세기
	int getSearchCount(HashMap map);

	//검색 리스트
	ArrayList<Notice> selectSearchList(HashMap<String, String> map);

}
