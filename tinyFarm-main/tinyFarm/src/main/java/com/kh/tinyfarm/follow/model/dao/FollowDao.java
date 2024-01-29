package com.kh.tinyfarm.follow.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.follow.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;


@Repository
public class FollowDao {

	//팔로우 걸기
	public int insertFollow(SqlSessionTemplate sqlSession, Follow fw) {
		return sqlSession.insert("followMapper.insertFollow", fw);
	}
	
	//팔로우 취소
	public int deleteFollow(SqlSessionTemplate sqlSession, Follow fw) {
		return sqlSession.delete("followMapper.deleteFollow", fw);
	}
	
	//게시글 팔로우 여부 확인
	public int selectFollow(SqlSessionTemplate sqlSession, Follow fw) {
		return sqlSession.selectOne("followMapper.selectFollow", fw);
	}
	
	//회원정보 모달(지수)
	//팔로우 여부 확인
	public int followCheck(SqlSession sqlSession, Follow f) {
		return sqlSession.selectOne("followMapper.followCheck",f);
	}
	
	//팔로우 유저 정보
	public Member selectFollowInfo(SqlSession sqlSession, String followingId) {
		return sqlSession.selectOne("memberMapper.loginMember",followingId);
	}

}
