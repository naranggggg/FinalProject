package com.kh.tinyfarm.diary.model.service;


import java.util.ArrayList;

import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.diary.model.vo.Diary;
import com.kh.tinyfarm.diary.model.vo.DiaryCategory;
import com.kh.tinyfarm.diary.model.vo.DiaryLike;
import com.kh.tinyfarm.follow.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.product.model.vo.Payments;
import com.kh.tinyfarm.product.model.vo.Product;

public interface DiaryService {
	
	//회원정보
	int updateMember(Member m);

	int updatePwd(Member m);

	int deleteMember(String userId);

	//활동내역
	int boardListCount(String userId);

	int replyListCount(String userId);

	int fwingListCount(String userId);

	int fwerListCount(String userId);

	ArrayList<Board> myBoardList(String userId, PageInfo bPi);

	ArrayList<BoardReply> myReplyList(String userId, PageInfo rPi);

	ArrayList<Follow> myFollowingList(String userId, PageInfo fiPi);

	ArrayList<Member> myFollowerList(String userId, PageInfo fwPi);

	Member selectMember(String userId);
	
	//영농일지
	int insertDiary(Diary d);

	ArrayList<Diary> selectDiaryList(int userNo);

	Diary selectDiary(Diary d);

	Diary viewDiary(int diaryNo);

	int existDiary(Diary d);

	int deleteDiary(int diaryNo);

	DiaryCategory selectCategory(String cNo);

	int updateDiary(Diary d);

	int diaryListCount(int userNo);
	
	//회원등급
	int gradeSeed(int userNo);

	int gradeShoot(int userNo);

	int gradeLeaf(int userNo);

	int gradeFruit(int userNo);

	//거래내역
	//구매
	int orderListCount(int userNo);

	ArrayList<Payments> myOrderList(int userNo, PageInfo oPi);
	
	//구매검색
	int searchDateOrderCount(Payments pm);
	
	ArrayList<Payments> searchOrderList(Payments pm,PageInfo soPi);
	
	//판매
	int sellListCount(int userNo);

	ArrayList<Product> mySellList(int userNo, PageInfo ssPi);
	
	//판매검색
	int searchDateSellCount(Product p);
	
	ArrayList<Product> searchSellList(Product p,PageInfo ssPi);

	//찜목록
	ArrayList<Product> selectWish(int userNo);
	
	//영농일지 좋아요 정보
	DiaryLike selectLike(DiaryLike dl);
		
	//좋아요 수
	int countLike(Integer diaryNo);
	
	//좋아요 수 증가
	int LikeCount(DiaryLike dLike);
	
	//좋아요 취소
	int unLikeCount(DiaryLike dLike);
	
	//일지 작성자 정보
	Member selectDiaryWriter(int userNo);

}
