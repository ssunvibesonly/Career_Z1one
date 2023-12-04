package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.Board_ContentDto;
import boot.data.inter.BoardAnswerServiceInter;
import boot.data.mapper.BoardAnswerMapperInter;

@Service
public class BoardAnswerService implements BoardAnswerServiceInter {

	@Autowired
	BoardAnswerMapperInter mapperInter;
	
	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public void insertBanswer(Board_ContentDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertBanswer(dto);
	}

	@Override
	public List<Board_ContentDto> getAllBAnswer(String board_num) {
		// TODO Auto-generated method stub
		return mapperInter.getAllBAnswer(board_num);
	}

	@Override
	public Board_ContentDto getAnswer(String content_num) {
		// TODO Auto-generated method stub
		return mapperInter.getAnswer(content_num);
	}

	@Override
	public void updateBanswer(int idx,String content) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("content_num", Integer.toString(idx));
		map.put("content", content);
		mapperInter.updateBanswer(map);
	}

	@Override
	public void deleteAnswer(String content_num) {
		// TODO Auto-generated method stub
		mapperInter.deleteAnswer(content_num);
	}

	@Override
	public Board_ContentDto getAnswerCount(String board_num) {
		// TODO Auto-generated method stub
		return mapperInter.getAnswerCount(board_num);
	}


}
