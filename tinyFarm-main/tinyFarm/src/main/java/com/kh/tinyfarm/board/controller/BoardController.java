package com.kh.tinyfarm.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tinyfarm.board.model.service.BoardService;
import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardLike;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.board.model.vo.BoardReport;
import com.kh.tinyfarm.board.model.vo.ReplyReport;
import com.kh.tinyfarm.follow.model.service.FollowService;
import com.kh.tinyfarm.follow.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;


@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private FollowService followService;
	
	
	@RequestMapping("moveList.bo")
	public String moveList() {
		return "board/boardList";
	}
	
	@ResponseBody
	@RequestMapping(value="list.bo",produces = "application/json; charset=UTF-8")
	public ArrayList<Board>selectBoardList(){
			
		ArrayList<Board> blist=boardService.selectBoardList();
		
		return blist;
	}
	
	
	@RequestMapping("detail.bo")
	public String boardDetail(int boardNo,Model model,HttpSession session) {
		
		int result = boardService.boardIncreaseCount(boardNo);
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo =loginUser.getUserNo();
		
		if(result>0) {
			Board boardInfo = boardService.boardDetail(boardNo);
			model.addAttribute("boardInfo", boardInfo);
			Follow fw = new Follow();
			fw.setBoardNo(boardNo);
			fw.setUserNo(userNo);
			int isFollow = followService.selectFollow(fw);
			model.addAttribute("isFollow", isFollow);
			
		}else {
			return "common/errorPage";
		}
		
		return "board/boardDetail";
	}
	
	@GetMapping("insert.bo")
	public String moveBoardEnroll() {
		return "board/boardEnroll";
	}
	
	
	@PostMapping("insert.bo")
	public String boardInsert(Board b,HttpSession session) {

		int result = boardService.insertBoard(b);
		System.out.println("result : "+result);
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 작성이 성공하셨습니다.");
			return "redirect:moveList.bo";
		}else {
			session.setAttribute("alertMsg", "게시글 작성이 실패하셨습니다.");
			return "common/errorPage";
		}
	
		
	}
	
	@GetMapping("moveUpdate.bo")
	public String moveBoardUpdate(int boardNo,Model model) {
		Board boardInfo = boardService.boardDetail(boardNo);
		model.addAttribute("boardInfo",boardInfo);
		
		return "board/boardUpdate";
	}
	
	@PostMapping("update.bo")
	public String boardUpdate(Board boardInfo,HttpSession session) {
		
		int result = boardService.boardUpdate(boardInfo);
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정이 성공하셨습니다.");
			return "redirect:detail.bo?boardNo="+boardInfo.getBoardNo();
		}else {
			session.setAttribute("alertMsg", "게시글 수정이 실패하셨습니다.");
			return "common/errorPage";
		}
	}
	
	
	@PostMapping("delete.bo")
	public String boardDelete(int boardNo,HttpSession session) {
		
		int result = boardService.boardDelete(boardNo);
		
		if(result>0) {	
			session.setAttribute("alertMsg", "게시글을 삭제하였습니다.");
			return "redirect:moveList.bo";
		}else {
			session.setAttribute("alertMsg", "게시글 삭제가 실패했습니다.");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="boardReplyList.bo",produces ="application/json; charset=UTF-8")
	public ArrayList<BoardReply> boardReplyList(int boardNo){
		
		ArrayList<BoardReply> rlist = new ArrayList<>();
		rlist = boardService.boardReplyList(boardNo);
		
		
		return rlist;
	}
	
	@ResponseBody
	@RequestMapping(value="insertReply.bo", produces="application/json; charset=UTF-8")
	public int insertReply(BoardReply br) {
		
		int result = boardService.insertReply(br);

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="updateReply.bo",produces="application/json; charset=UTF-8")
	public int updateReply(BoardReply br) {
		
		int result = boardService.updateReply(br);

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteReply.bo",produces = "application/json; charset=UTF-8")
	public int deleteReply(int replyNo) {

		int result = boardService.deleteReply(replyNo);
		
		
		return result;
	}
	

	@ResponseBody
	@RequestMapping(value="findLike.bo",produces = "application/json; charset=UTF-8")
	public ArrayList<BoardLike> findLike(BoardLike br) {

		ArrayList<BoardLike> blList = boardService.findLike(br);

		return blList;
		
	}

	
	@ResponseBody
	@RequestMapping(value="dolike.bo",produces = "application/json; charset=UTF-8")
	public int doLike(BoardLike bl) {
		
		int result1 = boardService.likeIncreaseCount(bl);
		int result2 = 0;
		
		if(result1>0) {			
			result2 = boardService.doLike(bl);
			
			return result2;
		}else {
			return result2;
		}
	
	}
	
	@ResponseBody
	@RequestMapping(value="cancelLike.bo",produces = "application/json; charset=UTF-8")
	public int cancelLike(BoardLike bl) {
		int result1= boardService.likeDecreaseCount(bl);
		int result2=0;
		if(result1>0) {
			result2= boardService.cancelLike(bl);
			return result2;
		}else {
			return result2;
		}
		
	}
	//게시글 신고페이지로 이동
	@PostMapping("moveReport.bo")
	public String moveReport(int userNo,int boardNo,Model model) {

		model.addAttribute("reportWriter", userNo);
		model.addAttribute("refBno", boardNo);
		
		return "board/boardReport";
	}
	//게시글 신고
	@PostMapping("report.bo")
	public String boardReport(BoardReport bp,HttpSession session) {
		System.out.println("bp : "+bp);
		
		int result =boardService.boardReport(bp);
		
		if(result>0) {
			session.setAttribute("alertMsg","게시글 신고에 성공하셨습니다.");
			return "redirect:moveList.bo";
		}else {
			session.setAttribute("alertMsg","게시글 신고에 실패하셨습니다.");
			return "redirect:moveList.bo";
		}
		
	}
	
	//댓글 신고창으로 이동
	@RequestMapping("moveReplyReport.bo")
	public String moveReplyReport(int replyNo,Model model) {
		
		model.addAttribute("replyNo", replyNo);
		return "board/replyReport";
	}
	

	//댓글 신고
	@PostMapping("replyReport.bo")
	public String replyReport(ReplyReport rp,HttpSession session) {
		
		int result =boardService.replyReport(rp);
		
		if(result>0) {
			session.setAttribute("alertMsg","댓글 신고에 성공하셨습니다.");
			return "redirect:moveList.bo";
		}else {
			session.setAttribute("alertMsg","댓글 신고에 실패하셨습니다.");
			return "redirect:moveList.bo";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="search.bo",produces = "application/json; charset=UTF-8")
	public ArrayList<Board> searchBoardList(Board b) {
		
		ArrayList<Board> searchList = boardService.searchBoardList(b);

		return searchList;
	}
	

}
