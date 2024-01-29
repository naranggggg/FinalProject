package com.kh.tinyfarm.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.chat.model.vo.ChatMessage;
import com.kh.tinyfarm.chat.model.vo.ChatRoom;
import com.kh.tinyfarm.member.model.vo.Member;

@Repository
public class ChatDao {

	public ArrayList<Member> findUser(SqlSessionTemplate sqlSession,String search) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectFindUserList",search);
	}

	public int insertChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.insert("chatMapper.insertChatRoom", cr);
	}

	public ArrayList<ChatRoom> selectChatList(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList",userId);
	}

	public int checkExistChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.selectOne("chatMapper.checkExistChatRoom", cr);
	}
	
	//채팅방은 존재하지만 현재 회원이 해당 채팅방 상태가 N인지 확인
	public int checkStatusChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.checkStatusChatRoom", cr);
	}
	//채팅 메세지 테이블에 넣기
	public int insertChatMsg(SqlSessionTemplate sqlSession, ChatMessage chatMessage) {
		
		return sqlSession.insert("chatMapper.insertChatMsg", chatMessage);
	}
	
	//방 번호에 해당하는 채팅 메세지 가져오기
	public ArrayList<ChatMessage> selectChatMsg(SqlSessionTemplate sqlSession,int chatRoomNo) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatMsg",chatRoomNo);
	}
	
	//채팅 대상 유저 검색
	public ArrayList<Member> searchUser(SqlSessionTemplate sqlSession,String search) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectSearchUserList",search);
	}

	public int deleteRoom(SqlSessionTemplate sqlSession, HashMap map) {
		
		int result = sqlSession.delete("chatMapper.deleteRoom", map);

		return result;
	}
	
	//채팅방 접속 시간 업데이트
	public int updateConnectTime(SqlSessionTemplate sqlSession,HashMap map) {
		// TODO Auto-generated method stub
		return sqlSession.update("chatMapper.updateConnectTime", map);
	}
	
	//내가 읽지 않은 메세지의 수를 세서 채팅방 번호와 함께 가져온다
	public ArrayList<HashMap> selectNotReadMsg(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatMapper.selectNotReadMsg", userId);
	}
	
	//채팅방 상태 Y로 업데이트
	public int updateChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.update("chatMapper.updateChatRoom", cr);
	}

	public String getUserId(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getUserId", userNo);
	}

	public int updateReceiverStatus(SqlSessionTemplate sqlSession, ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return sqlSession.update("chatMapper.updateReceiverStatus",chatMessage);
	}
	
	
	
	

}
