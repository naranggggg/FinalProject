package com.kh.tinyfarm.qna.model.service;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.qna.model.dao.QnaDao;
import com.kh.tinyfarm.qna.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService {

	
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	//사용자 QNA 등록
	@Override
	public int qnaEnroll(Qna qna) {
		return qnaDao.qnaEnroll(qna, sqlSession);
	}
	
	//QNA 총 개수
	@Override
	public int qnaListCount(HashMap<String, Integer> qMap) {
		return qnaDao.qnaListCount(sqlSession, qMap);
	}

	
	//###########################################################
	//QNA 글 목록
	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi, HashMap<String, Integer> qMap) {
		return qnaDao.selectQnaList(sqlSession, pi, qMap);
	}
	
	//사용자 QNA 글 목록
	@Override
	public ArrayList<Qna> selectMyQnaList(PageInfo pi, HashMap<String, Integer> qMap) {
		return qnaDao.selectMyQnaList(sqlSession, pi, qMap);
	}
	//###########################################################

	
	//QNA 상세 조회
	@Override
	public Qna selectQnaDetail(int qno) {
		return qnaDao.selectQnaDetail(sqlSession, qno);
	}

	
	//QNA 답변 등록
	@Override
	public int qnaAnswerEnroll(Qna qnaAnswer) {
		return qnaDao.qnaAnswerEnroll(qnaAnswer, sqlSession);
	}

	
	//QNA 답변 수정
	@Override
	public int qnaAnswerUpdate(Qna updateAnswer) {
		return qnaDao.qnaAnswerUpdate(updateAnswer, sqlSession);
	}

	
	//관리자 QNA 삭제
	@Override
	public int chkQnaDelete(ArrayList<Integer> qnaList) {
		return qnaDao.chkQnaDelete(qnaList, sqlSession);
	}
	
	
	
	
	
	//사용자 QNA 수정 
	@Override
	public int myQnaUpdate(Qna updateQna) {
		return qnaDao.myQnaUpdate(updateQna, sqlSession);
	}

	
	//사용자 QNA 삭제
	@Override
	public int myQnaDelete(int qnaNo) {
		return qnaDao.myQnaDelete(qnaNo, sqlSession);
	}

	
	

	
	

}
