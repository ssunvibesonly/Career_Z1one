package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.User_BoardDto;
import boot.data.inter.CmBoardServiceInter;
import boot.data.mapper.CmBoardMapperInter;

@Service
public class CmBoardService implements CmBoardServiceInter {

	@Autowired
	CmBoardMapperInter mapper;
	
	@Override
	public void insertCmBoard(User_BoardDto dto) {
		// TODO Auto-generated method stub

		mapper.insertCmBoard(dto);
	}

	@Override
	public List<User_BoardDto> getBoards(int start, int perpage) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getBoards(map);
	}

	@Override
	public int getTotalCount(String board_category) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(board_category);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapper.getMaxNum();
	}

	@Override
	public User_BoardDto getData(String board_num) {
		// TODO Auto-generated method stub
		return mapper.getData(board_num);
	}

	@Override
	public void updateReadCount(String board_num) {
		// TODO Auto-generated method stub
		mapper.updateReadCount(board_num);
	}

	@Override
	public String getEmail(String user_num) {
		// TODO Auto-generated method stub
		return mapper.getEmail(user_num);
	}

	@Override
	public void updateLikes(String board_num) {  //content에서 좋아요 버튼 클릭시 board_like 숫자 증가
		// TODO Auto-generated method stub
		 mapper.updateLikes(board_num);
	}

	@Override
	public void updateunLikes(String board_num) {	//content에서 좋아요 버튼 클릭시 board_like 숫자 감소
		// TODO Auto-generated method stub
		mapper.updateunLikes(board_num);
	}

	@Override
	public List<User_BoardDto> getBoardsByCategory(int start, int perpage, String board_category) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		map.put("board_category", board_category);
		return mapper.getBoardsByCategory(map);
	}

	@Override
	public void upadateBoard(User_BoardDto dto) {
		// TODO Auto-generated method stub
		mapper.upadateBoard(dto);
	}

	@Override
	public void deleteBoard(String board_num) {
		// TODO Auto-generated method stub
		mapper.deleteBoard(board_num);
	}

}
