package com.kh.tinyfarm.qna.model.dao;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.qna.model.vo.Qna;

@Repository
public class QnaDao {

	//사용자 QNA 등록
	public int qnaEnroll(Qna qna, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("qnaMapper.qnaEnroll", qna);
	}

	
	//QNA 총 개수
	public int qnaListCount(SqlSessionTemplate sqlSession, HashMap<String, Integer> qMap) {
		return sqlSession.selectOne("qnaMapper.qnaListCount", qMap);
	}

	//QNA 글 목록
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Integer> qMap) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaList", qMap, rowBounds);
	}
	
	
	//사용자 QNA 글 목록(USER)
	public ArrayList<Qna> selectMyQnaList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Integer> qMap) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectMyQnaList", qMap, rowBounds);
	}

	

	//QNA 상세 조회
	public Qna selectQnaDetail(SqlSessionTemplate sqlSession, int qnaNo) {
		
		return sqlSession.selectOne("qnaMapper.selectQnaDetail", qnaNo);
	}


	//QNA 답변 등록
	public int qnaAnswerEnroll(Qna qnaAnswer, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("qnaMapper.qnaAnswerEnroll", qnaAnswer);
	}


	//QNA 답변 수정
	public int qnaAnswerUpdate(Qna updateAnswer, SqlSessionTemplate sqlSession) {
		return sqlSession.update("qnaMapper.qnaAnswerUpdate", updateAnswer);
	}

	//선택한 QNA 삭제
	public int chkQnaDelete(ArrayList<Integer> list, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("qnaMapper.chkQnaDelete", list);
	}
	
	
	//사용자 QNA 수정
	public int myQnaUpdate(Qna updateQna, SqlSessionTemplate sqlSession) {
		return sqlSession.update("qnaMapper.myQnaUpdate", updateQna);
	}

	//사용자 QNA 삭제
	public int myQnaDelete(int qnaNo, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("qnaMapper.myQnaDelete", qnaNo);
	}






}
