package com.kh.tinyfarm.follow.model.service;

import com.kh.tinyfarm.follow.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;

public interface FollowService {

	//팔로우 걸기
	int insertFollow(Follow fw);

	//팔로우 취소
	int deleteFollow(Follow fw);

	//게시판 팔로우 여부 확인
	int selectFollow(Follow fw);
	
	//모달창 팔로우 여부 확인
	int followCheck(Follow f);
	
	//필로우 유저 정보
	Member selectFollowingInfo(String followingId);
	
	Member selectFollowerInfo(String followingId);
	

}
