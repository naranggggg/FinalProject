package com.kh.tinyfarm.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tinyfarm.chat.model.service.ChatService;
import com.kh.tinyfarm.chat.model.vo.ChatMessage;
import com.kh.tinyfarm.chat.model.vo.ChatRoom;
import com.kh.tinyfarm.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("chatList.ch")
	public String goChat(@RequestParam(value = "userId",defaultValue = "")String userId,Model model) {
		//다른 페이지에서 1:1 채팅하기를 눌렀을 때 userId 받아서 전달
		model.addAttribute("userId", userId);
		System.out.println(userId);
		return "chat/chatingList";
	}
	
	@ResponseBody
	@RequestMapping(value="findUser.ch",produces = "application/json; charset=UTF-8")
	public ArrayList<Member> findUser(String search) {
		ArrayList<Member> list = chatService.findUser(search);
		
		return list;
	}
	@ResponseBody
	@RequestMapping(value="searchUser.ch",produces = "application/json; charset=UTF-8")
	public ArrayList<Member> searchUser(String search) {
		ArrayList<Member> list = chatService.searchUser(search);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="insertChatRoom.ch",produces="text/html; charset=UTF-8")
	public String insertChatRoom(ChatRoom cr) {
		System.out.println(cr);
		//채팅방이 아예 DB에 존재하지 않는지 확인
		int count = chatService.checkExistChatRoom(cr);
		//채팅방이 존재하지만 현재 사용자가 채팅방을 나간 상태(N)인지 확인
		int sCount = chatService.checkStatusChatRoom(cr);
		int result = 0;

		if(count > 0 && sCount > 0) { //이미 채팅방이 DB에 존재하고 상태가 Y라면 나가지 않은 채팅방이 있다는 뜻
			
			return "NNNYY";
		}else if(count > 0 && sCount == 0) { //이미 채팅방이 DB에 존재하고 상태가 N라면 혼자 나간 채팅방을 있다는 뜻이므로 상태를 Y로 바꿔주는 작업
			result = chatService.updateChatRoom(cr);
			if(result > 0) { //상태 업데이트에 성공하면
				return "NNNNY";
			}else {
				return "NNNNN";
			}
		}else {//채팅방이 없다면 추가
			result = chatService.insertChatRoom(cr);
			
			if(result > 0) { //추가에 성공하면
				return "NNNNY";
			}else {
				return "NNNNN";
			}
			
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectChatList.ch",produces = "application/json; charset=UTF-8")
	public ArrayList<ChatRoom> selectChatList(String userId){
		ArrayList<ChatRoom> list = chatService.selectChatList(userId);
		
		return list;
	}
	
	
	@RequestMapping("updateConnectTime.ch")
	public void updateConnectTime(String userId,String chatRoomNo){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("chatRoomNo", chatRoomNo);
		int result = chatService.updateConnectTime(map);
		if(result > 0) {
			//System.out.println("업데이트 성공");
		}else {
			//System.out.println("업데이트 실패");
		}	
	}
	@ResponseBody
	@RequestMapping(value="selectNotReadMsg.ch",produces = "application/json; charset=UTF-8")
	public ArrayList<HashMap> selectNotReadMsg(String userId){
		ArrayList<HashMap> list = chatService.selectNotReadMsg(userId);
		System.out.println(list);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="selectChatMsg.ch",produces = "application/json; charset=UTF-8")
	public ArrayList<ChatMessage> selectChatMsg(HttpSession session,String chatRoomNo){
		//WebsocketBasicServer에서 chatRoomNo를 session을 가로채서 사용해야 하기 때문에 현재 선택된 chatRoomNo를 세션에 저장		
		session.removeAttribute("chatRoomNo");
		session.setAttribute("chatRoomNo", chatRoomNo);
		ArrayList<ChatMessage> list = chatService.selectChatMsg(Integer.parseInt(chatRoomNo));
		
		return list;
	}
	
	@RequestMapping("deleteRoom.ch")
	public String deleteRoom(String chatRoomNo,String userId,HttpSession session) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("chatRoomNo", chatRoomNo);
		map.put("userId", userId);
		int result = chatService.deleteRoom(map);

		if(result >0) {
			return "redirect:chatList.ch";
		} else {
			session.setAttribute("alertMsg", "채팅방 나가기에 실패했습니다. 다시 시도해주세요");
			return "redirect:chatList.ch";
		}
	}
	@ResponseBody
	@RequestMapping("getUserId.ch")
	public String getUserId(int userNo) {
		String userId = chatService.getUserId(userNo);
		return userId;
	}
}
