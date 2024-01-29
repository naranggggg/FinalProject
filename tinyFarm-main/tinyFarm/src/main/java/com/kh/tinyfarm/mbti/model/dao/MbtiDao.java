package com.kh.tinyfarm.mbti.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.mbti.model.vo.InGardenMbti;

@Repository
public class MbtiDao {

	public ArrayList<InGardenMbti> selectCntntsNo(SqlSessionTemplate sqlSession, InGardenMbti igm) {
		
		return (ArrayList)sqlSession.selectList("mbtiMapper.selectCntntsNo", igm);
	}

}
