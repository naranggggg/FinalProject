package com.kh.tinyfarm.board.model.service;

import java.util.ArrayList;

import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardLike;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.board.model.vo.BoardReport;
import com.kh.tinyfarm.board.model.vo.ReplyReport;
import com.kh.tinyfarm.common.model.vo.PageInfo;

public interface BoardService {

	
	
	
	//게시글리스트
	ArrayList<Board> selectBoardList();

	//게시글 상세보기 전 조회수 증가 메소드
	int boardIncreaseCount(int boardNo);
	
	//게시글 상세보기
	Board boardDetail(int boardNo);

	//게시글 등록
	int insertBoard(Board b);

	//게시글 수정
	int boardUpdate(Board boardInfo);

	//게시글 삭제
	int boardDelete(int boardNo);

	//댓글 리스트 조회
	ArrayList<BoardReply> boardReplyList(int boardNo);

	//댓글 작성
	int insertReply(BoardReply br);

	//댓글 수정
	int updateReply(BoardReply br);

	//댓글 삭제
	int deleteReply(int replyNo);

	
	//좋아요한 리스트찾기
	ArrayList<BoardLike> findLike(BoardLike br);
	
	//좋아요 하면 카운트 증가
	int likeIncreaseCount(BoardLike bl);
	
	//좋아요 하기
	int doLike(BoardLike bl);

	//좋아요 취소하면 카운트 감소
	int likeDecreaseCount(BoardLike bl);

	//좋아요 취소
	int cancelLike(BoardLike bl);

	//게시글 신고하기
	int boardReport(BoardReport bp);
	
	//댓글 신고하기
	int replyReport(ReplyReport rp);

	//게시글 검색
	ArrayList<Board> searchBoardList(Board b);

	
}
