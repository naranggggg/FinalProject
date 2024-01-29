package com.kh.tinyfarm.common.websocket.server;

import java.util.Date;
import java.util.Enumeration;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.tinyfarm.chat.model.service.ChatService;
import com.kh.tinyfarm.chat.model.vo.ChatMessage;
import com.kh.tinyfarm.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

//상속 또는 구현으로 websocket 관련 메소드 구현하기
//-WebsocketServer를 만들기 위해서는 TextWebSocketHandler 클래스 또는 WebSocketHandler 인터페이스 구현

//public class WebsocketBasicServer extends TextWebSocketHandler{
//public class WebsocketBasicServer implements WebSocketHandler
@Slf4j
public class WebsocketBasicServer extends TextWebSocketHandler{
	/*
	 * 웹소켓 - web에서 수행하는 socket통신 - socket통신은 연결형 통신
	 * 		  기본 통신은 HTTP로 진행되며 필요시에만 websocket을 사용한다
	 * 실시간 작업을 처리할때 유용하다
	 * ex)채팅, 시세변동사이트,알림기능, ...
	 * 
	 * WebSocketSession : 기존에 사용하던 HttpSession과는 다르다.
	 *  - 사용자의 웹소켓 정보가 담겨있음.
	 * 
	 * */
	
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<>();
	
	@Autowired
	private ChatService chatService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
		//접속했을때
		log.info("접속");
		log.debug("session : {}",session);
		log.debug("접속자의 아이디 : {}",((Member)session.getAttributes().get("loginUser")).getUserId()); //이거 없애면 user정보를 가져오지 못함. why?
		log.info("접속 ! 현재 접속자 수 : {}",users.size());
	}
	/*
	 * 메세지 수신시 실행될 메소드
	 * handleTextMessage() : 메세지 수신시 실행될 메소드
	 * -session : 사용자(전송한 사용자)의 웹소켓 정보
	 * -message : 사용자가 전송한 메세지 정보
	 *   - payload : 메세지내용
	 *   - byteCount : 보낸 메세지 크기
	 *   - last : 메세지 종료 여부
	 * */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 메세지를 받았을때
		//log.info("메세지 수신");
		//log.info("session : {}",session);
		//log.info("message : {}",message);
		//메세지랑 userId 붙여서 보내기
		
		
		//새로만든 텍스트를 넣고 TextMessage 생성하기
		
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
		
		// 시간 세팅
		chatMessage.setCreateDate( new Date( System.currentTimeMillis()));
		//System.out.println("chatMessage : "+chatMessage);
		int result = chatService.insertChatMsg(chatMessage);
		int updateState = chatService.updateReceiverStatus(chatMessage); //받는 상대의 상태 Y로 바꾸기
		for(WebSocketSession ws : users) {
			// WebSocketSession == HttpSession (로그인정보,채팅방정보) 을 가로챈것..
			String id = ((Member)ws.getAttributes().get("loginUser")).getUserId(); //test123와 test1이 채팅jsp에 접속하면 users에는 두개가 담겨있음.
//			System.out.println("total id : "+id);
//			System.out.println("보낸사람 id : "+chatMessage.getUserId());
//			System.out.println("받는사람 id : "+chatMessage.getReceiveId());
			//보낸사람 또는 받는사람중에 접속자가 있다면 
			
			if(id.equals(chatMessage.getUserId()) || id.equals(chatMessage.getReceiveId())) {
				//System.out.println("채팅이 지금 가는 id : "+id);
				ws.sendMessage( new TextMessage( new Gson().toJson(chatMessage) ));
			}
			
			// WebSocketSession에 담겨있는 채팅장 번호와
			// 메시지에 담겨있는 채팅방 번호가 같은 경우  === 같은방 클라이언트
		
				//같은방 클라이언트에게 JSON 형식의 메시지를 보냄 
			
			//ws.sendMessage(new TextMessage( new Gson().toJson(chatMessage)));
		}
	}
	
	/*
	 * 	afterConnectionClosed() : 사용자 접속 종료시 실행되는 메소드
	 *  - session : 사용자 웹소켓 정보
	 *  - status : 접속이 종료된 원인과 관련 정보
	 * 
	 * */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 접속 종료 됐을 때
		log.info("접속 종료");
		log.debug("session : {}",session);
		log.debug("status : {}",status);
		users.remove(session);
		
	}
	
}
