package boot.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import boot.data.dto.ChatRoomDto;
import boot.data.service.ChatService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatRoomController {

	@Autowired
	private ChatService service;
	
	//채팅 리스트 화면
	// /chat으로 요청이 들어오면 전체 채팅품 리스트를 담아서 return
	@GetMapping("/chat")
	public String goChatRoom(Model model) {
		
		model.addAttribute("list", service.findAllRoom());
		
		return "/3/chat/roomlist";
	}
	
	//채팅방 생성
	//채팅방 생성 훟 다시 /chat으로 return
	//JSP에서 넘어온 roomName
	//redirectAttributes = 컨트롤러에서 리다이렉트를 수행할 때 데이터를 전달하는 데 사용되는 클래스
	@PostMapping("/chat/createroom")
	public String createRoom(@RequestParam String roomName,RedirectAttributes rttr) {
		ChatRoomDto room=service.createChatRoom(roomName);
		
		rttr.addFlashAttribute("roomName",room);
		return "redirect:/chat";
	}
	
	//채팅방 입장 화면
	//파라메터로 넘어오는 roomId를 확인 후 해당 roomId를 기준으로 
	//채팅방을 찾아서 클라이언트를 chatroom으로 보낸다.
	@GetMapping("/chat/room")
	public String roomDetail(Model model, String roomId ) {
		
		log.info("roomId {}",roomId);
		
		model.addAttribute("room",service.findRoomById(roomId));
		return "/3/chat/chatroom";
	}
	//채팅방 삭제
	@GetMapping("/chat/delRoom/{roomId}")
	public String delChatRoom(@PathVariable String roomId) {
		
		
		service.delChatRoom(roomId);
		
		return "redirect:/chat";
	}
}
