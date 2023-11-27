package boot.data.controller;

import java.security.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.Board_ContentDto;
import boot.data.mapper.BoardAnswerMapperInter;

@RestController
@RequestMapping("/boardanswer")
public class BoardAnswerController {

	@Autowired
	BoardAnswerMapperInter mapper;
	
	@PostMapping("/binsert")
	public void insert(@ModelAttribute Board_ContentDto dto,HttpSession session)
	{
			//System.out.println(dto.getContent());
			//System.out.println(dto.getBoard_num());
			mapper.insertBanswer(dto);
	}
	
	@GetMapping("/blist")
	public List<Board_ContentDto> list(@RequestParam String board_num)
	{
		System.out.println(board_num);
		List<Board_ContentDto> list=new ArrayList<>();
		
		list=mapper.getAllBAnswer(board_num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		for(Board_ContentDto dto: list) {
			String writeday = sdf.format(dto.getWriteday());
			dto.setSdf_writeday(writeday);
		}
		
		return list;  //실제 경로 쓰지 않아도 된다_왜? ajax를 사용하기 때문
	}
}
