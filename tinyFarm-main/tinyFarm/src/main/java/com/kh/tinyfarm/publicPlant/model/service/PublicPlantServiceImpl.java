package com.kh.tinyfarm.publicPlant.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.publicPlant.model.dao.PublicPlantDao;
import com.kh.tinyfarm.publicPlant.model.vo.PlantComment;

@Service
public class PublicPlantServiceImpl implements PublicPlantService{
	
	@Autowired
	private PublicPlantDao publicPlantDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//식물 의견 추가
	@Override
	public int insertCommentToPlant(PlantComment pc) {
		
		return publicPlantDao.insertCommentToPlant(sqlSession,pc);
	}
	
	//식물 의견 리스트 가져오기
	@Override
	public ArrayList<PlantComment> selectComment(HashMap map) {
		// TODO Auto-generated method stub
		return publicPlantDao.selectComment(sqlSession,map);
	}
	
	//식물 의견 테이블 내 해당 식물에 적힌 댓글 개수 가져오기
	@Override
	public int getCommentCount(int cntntsNo) {
		// TODO Auto-generated method stub
		return publicPlantDao.getCommentCount(sqlSession,cntntsNo);
	}
	
	//식물 의견 수정
	@Override
	public int updateComment(PlantComment pc) {
		
		return publicPlantDao.updateComment(sqlSession,pc);
	}
	
	//식물 의견 삭제
	@Override
	public int deleteComment(int ctpNo) {
		
		return publicPlantDao.deleteComment(sqlSession,ctpNo);
	}

}
