package boot.data.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import boot.data.dto.ChatDto;
import boot.data.dto.ChatDto.MessageType;
import boot.data.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ChatController {
	
	//아래에서 사용되는 convertAndSend를 사용하기
	//convertAndSend는 객체를 인자로 넘겨주면 자동으로 Message 객체로 변환 후 도착지로 전송한다.
	//특정 Broker로 메세지 전달
	private final SimpMessageSendingOperations template;
	
	@Autowired
	ChatService service;
	
	//MessageMapping을 통해 websocket 로 들어오는 메세지 발신
	//이 때 클라이언트에서는 /pub/chat/message로 요청하게 되고 클라이언트가 처리
	//처리 완료시 /sub/chat/room/roomId로 메세지 전송
	//Client가 SEND할 수 있는 경로 
	@MessageMapping("/chat/enterUser")
	public void enterUser(@Payload ChatDto chat,SimpMessageHeaderAccessor headerAccessor) {
		
		//채팅방에 유저 추가 및 UserUUID 반환
		String userUUID=service.addUser(chat.getRoomId(), chat.getSender());
		
		//반환 결과를 socket session에 userUUID로 저장
		headerAccessor.getSessionAttributes().put("userUUID", userUUID);
		headerAccessor.getSessionAttributes().put("roomId",chat.getRoomId());
		
		log.info(userUUID);
		
		chat.setMessage(chat.getSender()+"님이 입장하셨습니다.");
		template.convertAndSend("/sub/chat/room/"+chat.getRoomId(),chat);
		
		
	}
	
	//해당 유저
	@MessageMapping("/chat/sendMessage")
	public void sendMessage(@Payload ChatDto chat) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:ss");
		log.info("CHAT {}",chat);
		chat.setMessage(chat.getMessage()+" "+sdf.format(new Date()));
		template.convertAndSend("/sub/chat/room/"+chat.getRoomId(),chat);
	}
	
	//유저 퇴장 시에는 EventeListener를 통해서 유저 퇴장 확인
	@EventListener
	public void webSocketDisconnectListener(SessionDisconnectEvent event) {
		log.info("DisConnEvent {}",event);
		
		StompHeaderAccessor headerAccessor=StompHeaderAccessor.wrap(event.getMessage());
		
		//stomp세션에 있던 uuid와 roomId를 확인해서 채팅방 유저 리스트와 room에서 해당 유저 삭제
		String userUUID=(String)headerAccessor.getSessionAttributes().get("userUUID");
		String roomId=(String)headerAccessor.getSessionAttributes().get("roomId");
		
		log.info("headerAccessor {}",headerAccessor);
		
		String userName=service.getUserName(roomId, userUUID);
		service.delUser(roomId, userUUID);
		
		if(userName != null) {
			log.info("User Disconn : "+userName);
			
			//builder 어노테이션 활용
			ChatDto chat=ChatDto.builder()
					.type(MessageType.BYE)
					.sender(userName)
					.message(userName+"님이 퇴장하셨습니다.")
					.build();
			
			template.convertAndSend("/sub/chat/room/"+roomId,chat);
		}
	}
	
	//채팅에 참여한 유저 리스트 반환
	@GetMapping("/chat/userlist")
	@ResponseBody
	public ArrayList<String> userList(String roomId){
		
		return service.getUserList(roomId);
	}
	//채팅에 참여한 유저 닉네임 중복 확인
	@GetMapping("/chat/duplicateName")
	@ResponseBody
	public String isDuplicateName(@RequestParam String roomId, @RequestParam String username) {
		
		//유저 이름 확인
		String userName=service.isDuplicateName(roomId, username);
		log.info("동장 확인{}",userName);
		
		
		return userName;
	}
}
