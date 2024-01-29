package com.kh.tinyfarm.publicPlant.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.publicPlant.model.vo.PlantComment;

@Repository
public class PublicPlantDao {
	
	
	//식물 의견 추가
	public int insertCommentToPlant(SqlSessionTemplate sqlSession, PlantComment pc) {
		
		return sqlSession.insert("plantMapper.insertCommentToPlant", pc);
	}
	
	//식물 의견 리스트 가져오기
	public ArrayList<PlantComment> selectComment(SqlSessionTemplate sqlSession, HashMap map) {
		int limit = (int) map.get("limit");
		int offset = ((int)map.get("currentPage") -1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		int cntntsNo = (int)map.get("cntntsNo");
	
		return (ArrayList)sqlSession.selectList("plantMapper.selectComment", cntntsNo,rowBounds);
	}
	
	//식물 의견 테이블 내 해당 식물에 적힌 댓글 개수 가져오기
	public int getCommentCount(SqlSessionTemplate sqlSession, int cntntsNo) {
		
		return sqlSession.selectOne("plantMapper.getCommentCount",cntntsNo);
	}
	
	//식물 의견 수정
	public int updateComment(SqlSessionTemplate sqlSession, PlantComment pc) {
		
		return sqlSession.update("plantMapper.updateComment", pc);
	}
	
	//식물 의견 삭제
	public int deleteComment(SqlSessionTemplate sqlSession, int ctpNo) {
		return sqlSession.delete("plantMapper.deleteComment", ctpNo);
	}

	

}
