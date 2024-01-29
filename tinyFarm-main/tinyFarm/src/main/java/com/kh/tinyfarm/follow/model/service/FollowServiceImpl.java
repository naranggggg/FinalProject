package com.kh.tinyfarm.follow.model.service;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.follow.model.dao.FollowDao;
import com.kh.tinyfarm.follow.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;

@Service
public class FollowServiceImpl implements FollowService{
	
	@Autowired
	private FollowDao followDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	
	@Override
	public int insertFollow(Follow fw) {
		
		return followDao.insertFollow(sqlSession,fw);
	}


	@Override
	public int deleteFollow(Follow fw) {
		
		return followDao.deleteFollow(sqlSession,fw);
	}


	@Override
	public int selectFollow(Follow fw) {
		
		return followDao.selectFollow(sqlSession,fw);
	}
	
	//팔로우 여부 확인
	@Override
	public int followCheck(Follow f) {
		return followDao.followCheck(sqlSession,f);
	}
	
	//팔로잉 정보
	@Override
	public Member selectFollowingInfo(String followingId) {
		return followDao.selectFollowInfo(sqlSession,followingId);
	}
	//팔로워 정보
	@Override
	public Member selectFollowerInfo(String followingId) {
		return followDao.selectFollowInfo(sqlSession,followingId);
	}


}
