package boot.data.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import boot.data.dto.CnoticeDto;
import boot.data.dto.User_BoardDto;
import boot.data.service.BoardService;
import boot.data.service.CnoticeSerivce;

@Controller
public class MainController {

	@Autowired
	BoardService board_service;
	
	@Autowired
	CnoticeSerivce cnotice_service;
	
	@GetMapping("/")
	public String mainStart(Model model) {

		List<CnoticeDto> popularList=cnotice_service.readCountList();
		
		//CompletableFuture 클래스는 비동기 작업의 결과를 다루는 데 사용
		CompletableFuture<List<User_BoardDto>> mlist=board_service.getTopOneTitle();
		List<User_BoardDto> resultlist;
		
			
			try {
				//multi.get()은 CompletableFuture가 작업을 완료할 때까지 기다리고 그 결과를 반환하는 메서드
				//이 코드는 비동기 작업의 결과를 얻기 위해 사용
				//작업이 완료될 때까지 스레드가 차단될 수 있어서 CompletableFuture의 get()을 호출하여 결과를 받아온 후, 
				//이를 List<User_BoardDto> 타입의 변수인 resultList에 담음
				resultlist=mlist.get();
				System.out.println(resultlist);
				
			} catch (InterruptedException | ExecutionException e) {
			    // 예외가 발생한 경우, 해당 예외를 처리하고 결과 리스트를 빈 리스트로 초기화
			    e.printStackTrace(); // 예외를 출력하여 디버깅할 수 있도록 함
			    resultlist = Collections.emptyList(); // 빈 리스트로 초기화
			}
		
		model.addAttribute("resultlist", resultlist);
		model.addAttribute("popularList", popularList);
		
		
		return "/layout/main";

	}
}