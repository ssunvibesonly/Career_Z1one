package boot.data.service;


import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import boot.data.dto.ChatRoomDto;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatService{
	
	private Map<String, ChatRoomDto> chatRoomMap;
	
	@PostConstruct //해당 메서드가 객체의 생성 후 초기화될 때 실행되도록 지정하는 역할
	private void init()
	{
		chatRoomMap=new LinkedHashMap<>();
	}
	
	//전체 채팅방 조회
	public List<ChatRoomDto> findAllRoom(){
		List<ChatRoomDto> chatRooms=new ArrayList<>(chatRoomMap.values());
		//채팅방 생성 순서를 최근순으로 변환
		Collections.reverse(chatRooms);
		
		return chatRooms;
	}
	
	//roomID 기준으로 채팅방 찾기
	public ChatRoomDto findRoomById(String roomId) {
		return chatRoomMap.get(roomId);
	}
	
	//roomName으로 채팅방 만들기
	public ChatRoomDto createChatRoom(String roomName) {
		
		ChatRoomDto chatRoomDto=ChatRoomDto.builder()
				.roomId(UUID.randomUUID().toString())
				.roomName(roomName)
				.userlist(new HashMap<String,String>())
				.build();
		
		//map에 채팅방 아이디와 만들어진 채팅룸 저장
		chatRoomMap.put(chatRoomDto.getRoomId(), chatRoomDto);	
		
		return chatRoomDto;
	}
	//채팅방 유저 리스트에 유저 추가
	public String addUser(String roomId,String userName) {
		ChatRoomDto room=chatRoomMap.get(roomId);
		String userUUID=UUID.randomUUID().toString();
		
		//아이디 중복 확인 후 userList에 추가
		room.getUserlist().put(userUUID, userName);
	
		return userUUID;
	}
	
	//채팅방 유저 이름 중복 확인
	public String isDuplicateName(String roomId,String userName) {
		ChatRoomDto room=chatRoomMap.get(roomId);
		String tmp=userName;
		
		//만약 userName이 중복이라면 랜덤한 숫자를 붙인다.
		//이 때 랜덤한 숫자를 붙였을 경우 getUserlist안에 있는 닉네임이라면 다시 랜덤 숫자 붙이기
		while(room.getUserlist().containsValue(tmp)) {
			int ranNum=(int)(Math.random()*100)+1;
		
			tmp=userName+ranNum;
		}
		
		return tmp;
		
	}
	//채팅방 유저 리스트 삭제
	public void delUser(String roomId,String userUUID) {
		ChatRoomDto room=chatRoomMap.get(roomId);
		room.getUserlist().remove(userUUID);
	}
	
	//채팅방 userName조회
	public String getUserName(String roomId,String userUUID) {
		ChatRoomDto room=chatRoomMap.get(roomId);
		return room.getUserlist().get(userUUID);
	}
	
	//채팅방 전체 userlist 조회
	public ArrayList<String> getUserList(String roomId){
		ArrayList<String> list=new ArrayList<>();
		
		ChatRoomDto room=chatRoomMap.get(roomId);
		
		//hashmap을 for문을 돌린 후 
		//value값만 뽑아내서 list에 저장 후 return
		room.getUserlist().forEach((key,value)->list.add(value));
		
		return list;
	}
	
	//채팅방 삭제
	public void delChatRoom(String roomId) {
		
		try {
		//채팅방 삭제
		chatRoomMap.remove(roomId);
		log.info("삭제 완료 roomId : {}",roomId);
		
		}catch(Exception e){ //예외처리
			System.out.println(e.getMessage());
			
		}
	}
}