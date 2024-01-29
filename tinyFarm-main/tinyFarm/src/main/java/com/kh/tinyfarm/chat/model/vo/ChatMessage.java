package com.kh.tinyfarm.chat.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatMessage {
	private String cmNo;//CM_NO	NUMBER	PRIMARY KEY,
	private String message;//MESSAGE	VARCHAR2(4000)	NOT NULL,
	private Date createDate;//CREATE_DATE	DATE DEFAULT SYSDATE,
	private String chatRoomNo;//CHAT_ROOM_NO NUMBER	REFERENCES CHAT_ROOM,
	private String userId;//MEMBER_ID	VARCHAR REFERENCES MEMBER
	private String receiveId; //받는사람 id
}
