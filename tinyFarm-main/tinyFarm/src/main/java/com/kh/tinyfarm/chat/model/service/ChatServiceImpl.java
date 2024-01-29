package com.kh.tinyfarm.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.chat.model.dao.ChatDao;
import com.kh.tinyfarm.chat.model.vo.ChatMessage;
import com.kh.tinyfarm.chat.model.vo.ChatRoom;
import com.kh.tinyfarm.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<Member> findUser(String search) {
		
		return chatDao.findUser(sqlSession,search);
	}
	
	@Override
	public int insertChatRoom(ChatRoom cr) {
	
		return chatDao.insertChatRoom(sqlSession,cr);
	}

	@Override
	public ArrayList<ChatRoom> selectChatList(String userId) {
		
		return chatDao.selectChatList(sqlSession,userId);
	}
	
	//채팅방 데이터베이스에 이미 채팅방이 있는지 없는지 확인
	@Override
	public int checkExistChatRoom(ChatRoom cr) {

		return chatDao.checkExistChatRoom(sqlSession,cr);
	}
	
	//채팅 메세지 테이블에 추가
	@Override
	public int insertChatMsg(ChatMessage chatMessage) {
		
		return chatDao.insertChatMsg(sqlSession,chatMessage);
	}
	
	//방번호에 해당하는 채팅 메세지 리스트 가져오기
	@Override
	public ArrayList<ChatMessage> selectChatMsg(int chatRoomNo) {
		// TODO Auto-generated method stub
		return chatDao.selectChatMsg(sqlSession,chatRoomNo);
	}
	
	//유저 검색
	@Override
	public ArrayList<Member> searchUser(String search) {
		// TODO Auto-generated method stub
		return chatDao.searchUser(sqlSession,search);
	}

	@Override
	public int deleteRoom(HashMap map) {
		
		return chatDao.deleteRoom(sqlSession,map);
	}
	//채팅방 접속 시간 업데이트
	@Override
	public int updateConnectTime(HashMap map) {
		// TODO Auto-generated method stub
		return chatDao.updateConnectTime(sqlSession,map);
	}
	
	//내가 읽지 않은 메세지의 수를 세서 채팅방 번호와 함께 가져온다
	@Override
	public ArrayList<HashMap> selectNotReadMsg(String userId) {
		// TODO Auto-generated method stub
		return chatDao.selectNotReadMsg(sqlSession,userId);
	}

	@Override
	public int checkStatusChatRoom(ChatRoom cr) {
		// TODO Auto-generated method stub
		return chatDao.checkStatusChatRoom(sqlSession,cr);
	}

	@Override
	public int updateChatRoom(ChatRoom cr) {
		// TODO Auto-generated method stub
		return chatDao.updateChatRoom(sqlSession,cr);
	}

	@Override
	public String getUserId(int userNo) {
		// TODO Auto-generated method stub
		return chatDao.getUserId(sqlSession,userNo);
	}

	@Override
	public int updateReceiverStatus(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return chatDao.updateReceiverStatus(sqlSession,chatMessage);
	}

}
