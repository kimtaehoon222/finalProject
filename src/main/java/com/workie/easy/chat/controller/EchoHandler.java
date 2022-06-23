package com.workie.easy.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.workie.easy.employee.model.dto.Employee;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler { //메세지 전송용 핸들러, binary는 이미지 등 파일 전송
    //세션 리스트
	List<WebSocketSession> users = new ArrayList<WebSocketSession>();
	Map<String,WebSocketSession> userSessions = new HashMap<>();
	
	 /*
     * websocket 연결 성공 시
     */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		users.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);  //연결 된 사용자의 아이디가 맵에 들어간다./ 로그인이 되어있지 않으면 세션아이디
		
	}

	 /*
     * websocket 메세지 수신 및 송신
     */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	       	       
		 System.out.println("handleTextMessage : " + session + " : " + message);
			
			String senderId = getId(session);
			String text = "";
			String msg = message.getPayload();
			String func = "";   
			String sender = "";
			String receiver = "";
			String receiverNo = "";
			String title = "";
			
			if(!StringUtils.isEmpty(msg)) {
				String[] strArr = message.getPayload().split(",");
				if(strArr != null) {
					
	



					 sender = strArr[0];
					 receiver = strArr[1];
					 receiverNo = strArr[2];
					 text = strArr[3];

		
				
	
					WebSocketSession receiverSession = userSessions.get(receiver);
					if(receiverSession != null) {   //받는 이가 로그인한 상태라면 
						receiverSession.sendMessage(new TextMessage("<a href='chat.do?empNo="+String.valueOf(receiverNo)+"'>새로운 메세지가 도착했습니다</a>"+"," + text ));
					}
					
				
				}
				
			}
			
			
			
	}
	
	
	private String getId(WebSocketSession session) {
		Map<String,Object> httpSession = session.getAttributes();
		Employee loginEmp = (Employee)httpSession.get("loginEmp");
		if(loginEmp == null) {
			return session.getId();
		}else {
			return loginEmp.getEmpId();
		}
				
		
	}

	 /*
     * websocket 연결 종료 시
     */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
	}

	
	
}
