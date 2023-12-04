package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ChatDto {

	//메세지 타입 : 입장, 채팅, 퇴장
	//enum을 열거형식으로 사용
	//CHAT은 내용이 해당 채팅방을 SUB하고 있는 모든 클라이언트에게 전달
	public enum MessageType{
		HELLO, CHAT, BYE
	}
	private MessageType type; //메세지 타입
	private String roomId; //방번호
	private String sender; //메세지 발송자
	private String message; //메세지
	private String time; //채팅 발송 시간
	
	
}