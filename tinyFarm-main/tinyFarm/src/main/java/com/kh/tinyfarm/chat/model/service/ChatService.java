package com.kh.tinyfarm.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tinyfarm.chat.model.vo.ChatMessage;
import com.kh.tinyfarm.chat.model.vo.ChatRoom;
import com.kh.tinyfarm.member.model.vo.Member;

public interface ChatService {
	
	ArrayList<Member> findUser(String search);

	int insertChatRoom(ChatRoom cr);

	ArrayList<ChatRoom> selectChatList(String userId);
	
	int checkExistChatRoom(ChatRoom cr);

	int insertChatMsg(ChatMessage chatMessage);
	
	ArrayList<ChatMessage> selectChatMsg(int chatRoomNo);

	ArrayList<Member> searchUser(String search);

	int deleteRoom(HashMap map);

	int updateConnectTime(HashMap map);

	ArrayList<HashMap> selectNotReadMsg(String userId);

	int checkStatusChatRoom(ChatRoom cr);

	int updateChatRoom(ChatRoom cr);

	String getUserId(int userNo);

	int updateReceiverStatus(ChatMessage chatMessage);
}
