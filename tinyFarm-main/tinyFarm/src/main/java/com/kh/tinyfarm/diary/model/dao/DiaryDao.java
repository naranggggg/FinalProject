package com.kh.tinyfarm.diary.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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




@Repository
public class DiaryDao {

	//회원정보 수정
	public int updateMember(SqlSession sqlSession,Member m) {
		return sqlSession.update("diaryMapper.updateMember", m);
	}
	//비밀번호 변경
	public int updatePwd(SqlSession sqlSession,Member m) {
		
		return sqlSession.update("diaryMapper.updatePwd", m);
	}
	//회원탈퇴
	public int deleteMember(SqlSession sqlSession,String userId) {
		return sqlSession.update("diaryMapper.deleteMember",userId);
	}
	
	//내 게시글개수
	public int boardListCount(SqlSession sqlSession,String userId) {
		return sqlSession.selectOne("diaryMapper.boardListCount",userId);
	}
	
	//내 댓글개수
	public int replyListCount(SqlSession sqlSession,String userId) {
		return sqlSession.selectOne("diaryMapper.replyListCount",userId);
	}
	
	//팔로잉수
	public int fwingListCount(SqlSession sqlSession,String userId) {
		return sqlSession.selectOne("diaryMapper.fwingListCount",userId);
	}
	
	//팔로워수
	public int fwerListCount(SqlSession sqlSession,String userId) {
		return sqlSession.selectOne("diaryMapper.fwerListCount",userId);
	}
	
	//내 게시글 목록
	public ArrayList<Board> myBoardList(SqlSession sqlSession,String userId,PageInfo bPi) {
		
		int limit = bPi.getPageLimit();
		int offset = (bPi.getCurrentPage() - 1) * limit;

		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("diaryMapper.myBoardList",userId,rowbounds);
	}

	//내 댓글 목록
	public ArrayList<BoardReply> myReplyList(SqlSession sqlSession,String userId,PageInfo rPi) {
		
		int limit = rPi.getPageLimit();
		int offset = (rPi.getCurrentPage() - 1) * limit;

		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("diaryMapper.myReplyList",userId,rowbounds);
	}

	//팔로잉 목록
	public ArrayList<Follow> myFollowingList(SqlSession sqlSession,String userId,PageInfo fiPi) {
		
		int limit = fiPi.getPageLimit();
		int offset = (fiPi.getCurrentPage() - 1) * limit;

		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("diaryMapper.myFollowingList",userId,rowbounds);
	}

	//팔로워 목록
	public ArrayList<Member> myFollowerList(SqlSession sqlSession,String userId,PageInfo fwPi) {
		int limit = fwPi.getPageLimit();
		int offset = (fwPi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("diaryMapper.myFollowerList",userId,rowbounds);
	}
	
	//일지작성
	public int insertDiary(SqlSession sqlSession,Diary d) {
		return sqlSession.insert("diaryMapper.insertDiary",d);
	}
	//일지 목록 불러오기
	public ArrayList<Diary> selectDiaryList(SqlSession sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("diaryMapper.selectDiaryList", userNo);
	}
	//일지 번호추출
	public Diary selectDiary(SqlSession sqlSession, Diary d) {
		return sqlSession.selectOne("diaryMapper.selectDiary",d);
	}
	//해당 번호의 일지 불러오기
	public Diary viewDiary(SqlSession sqlSession,int diaryNo) {
		return sqlSession.selectOne("diaryMapper.viewDiary",diaryNo);
	}
	//일지 존재여부
	public int existDiary(SqlSession sqlSession, Diary d) {
		return sqlSession.selectOne("diaryMapper.existDiary",d);
	}
	//일지 삭제
	public int deleteDiary(SqlSession sqlSession, int diaryNo) {
		return sqlSession.delete("diaryMapper.deleteDiary",diaryNo);
	}
	//카테고리 이름뽑기
	public DiaryCategory selectCategory(SqlSession sqlSession, String cNo) {
		return sqlSession.selectOne("diaryMapper.selectCategory",cNo);
	}
	//일지수정
	public int updateDiary(SqlSession sqlSession, Diary d) {
		return sqlSession.update("diaryMapper.updateDiary", d);
	}
	//일지개수
	public int diaryListCount(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("diaryMapper.diaryListCount",userNo);
	}
	//등급 새싹으로 변경
	public int gradeShoot(SqlSession sqlSession, int userNo) {
		return sqlSession.update("diaryMapper.gradeShoot", userNo);
	}
	//등급 잎새로 변경
	public int gradeLeaf(SqlSession sqlSession, int userNo) {
		return sqlSession.update("diaryMapper.gradeLeaf", userNo);
	}
	//등급 열매로 변경
	public int gradeFruit(SqlSession sqlSession, int userNo) {
		return sqlSession.update("diaryMapper.gradeFruit", userNo);
	}
	//등급 씨앗으로 변경
	public int gradeSeed(SqlSession sqlSession, int userNo) {
		return sqlSession.update("diaryMapper.gradeSeed", userNo);
	}
	//구매내역 카운트
	public int orderListCount(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("diaryMapper.orderCount",userNo);
	}
	//구매목록
	public ArrayList<Payments> myOrderList(SqlSession sqlSession, int userNo, PageInfo oPi) {
		int limit = oPi.getPageLimit();
		int offset = (oPi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("diaryMapper.myOrderList",userNo,rowbounds);
	}
	//판매내역 카운트
	public int sellListCount(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("diaryMapper.sellCount",userNo);
	}
	//판매목록
	public ArrayList<Product> mySellList(SqlSession sqlSession, int userNo, PageInfo sPi) {
		int limit = sPi.getPageLimit();
		int offset = (sPi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("diaryMapper.mySellList",userNo,rowbounds);
	}
	//주문날짜 검색 카운트
	public int searchDateOrderCount(SqlSession sqlSession, Payments pm) {
		return sqlSession.selectOne("diaryMapper.searchDateOrderCount",pm);
	}
	
	//주문날짜 검색 리스트
	public ArrayList searchOrderList(SqlSession sqlSession, Payments pm,  PageInfo soPi) {
		int limit = soPi.getPageLimit();
		int offset = (soPi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("diaryMapper.searchOrderList",pm,rowbounds);
	}
	
	//판매날짜 검색 카운트
	public int searchDateSellCount(SqlSession sqlSession, Product p) {
		return sqlSession.selectOne("diaryMapper.searchDateSellCount",p);
	}
	
	//판매날짜 검색 리스트
	public ArrayList searchSellList(SqlSession sqlSession, Product p,  PageInfo ssPi) {
		int limit = ssPi.getPageLimit();
		int offset = (ssPi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("diaryMapper.searchSellList",p,rowbounds);
	}
	//카카오 로그인 유저정보 조회
	public Member selectMember(SqlSession sqlSession, String userId) {
		return sqlSession.selectOne("diaryMapper.selectMember",userId);
	}
	//찜내역 수
	public int wishCount(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("diaryMapper.wishCount",userNo);
	}
	//찜내역
	public ArrayList<Product> selectWish(SqlSession sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("diaryMapper.selectWish",userNo);
	}
	//영농일지 좋아요 정보
		public DiaryLike selectLike(SqlSession sqlSession, DiaryLike dl) {
			return sqlSession.selectOne("diaryMapper.selectLike",dl);
		}
		//영농일지 좋아요 수
		public int countLike(SqlSession sqlSession, Integer diaryNo) {
			return sqlSession.selectOne("diaryMapper.countLike", diaryNo);
		}
		//영농일지 작성자 정보
		public Member selectDiaryWriter(SqlSession sqlSession, int userNo) {
			return sqlSession.selectOne("diaryMapper.selectDiaryWriter",userNo);
		}
		//영농일지 좋아요수 증가
		public int LikeCount(SqlSession sqlSession, DiaryLike dLike) {
			return sqlSession.insert("diaryMapper.LikeCount",dLike);
		}
		
		//영농일지 종아요 취소
		public int unLikeCount(SqlSession sqlSession, DiaryLike dLike) {
			return sqlSession.delete("diaryMapper.unLikeCount",dLike);
		}

}
