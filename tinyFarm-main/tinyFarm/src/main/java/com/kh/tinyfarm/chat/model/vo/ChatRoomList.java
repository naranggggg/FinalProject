package com.kh.tinyfarm.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatRoomList {
	private int chatRoomNo;//	CHAT_ROOM_NO 채팅방 번호
	private String firstMemId;//	FIRST_MEM_ID 최초 송신자
	private String receiveMemId;//	RECEIVE_MEM_ID 수신자
	private String firstMemStatus;//	FIRST_MEM_STATUS 최초 송신자 채팅방 상태
	private String receiveMemStatus;//	RECEIVE_MEM_STATUS 수신자 채팅방 상태
	private String otherId;//나랑 같은 채팅방에 있는 상대의 id
	private String changeName; //상대의 프로필 url
	private String userName; //상대 이름
	private String message; //가장 최근에 온 메세지
}
