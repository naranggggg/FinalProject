package com.kh.tinyfarm.mbti.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.mbti.model.dao.MbtiDao;
import com.kh.tinyfarm.mbti.model.vo.InGardenMbti;

@Service
public class MbtiServiceImpl implements MbtiService{

	@Autowired
	private MbtiDao mbtiDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<InGardenMbti> selectCntntsNo(InGardenMbti igm) {
	
		return mbtiDao.selectCntntsNo(sqlSession,igm);
	}

}
