package com.kh.tinyfarm.qna.model.service;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.qna.model.vo.Qna;


public interface QnaService {

	//사용자 QNA 등록
	int qnaEnroll(Qna qna);

	//QNA 총 개수
	int qnaListCount(HashMap<String, Integer> qMap);

	
	//##################################################
	//QNA 글 목록
	ArrayList<Qna> selectQnaList(PageInfo pi, HashMap<String, Integer> qMap);

	//QNA 글 목록(USER)
	ArrayList<Qna> selectMyQnaList(PageInfo pi, HashMap<String, Integer> qMap);
	//##################################################

	
	
	//QNA 상세 조회
	Qna selectQnaDetail(int qno);

	
	//QNA 답변 등록
	int qnaAnswerEnroll(Qna qnaAnswer);

	
	//QNA 답변 수정
	int qnaAnswerUpdate(Qna updateAnswer);

	
	//사용자 QNA 수정
	int myQnaUpdate(Qna updateQna);

	
	
	//사용자 QNA 수정
	int myQnaDelete(int qnaNo);


	//사용자 QNA 삭제
	int chkQnaDelete(ArrayList<Integer> qnaList);

}
