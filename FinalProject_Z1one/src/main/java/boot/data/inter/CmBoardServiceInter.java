package boot.data.inter;

import java.util.HashMap;
import java.util.List;

import boot.data.dto.User_BoardDto;

public interface CmBoardServiceInter {

	public void insertCmBoard(User_BoardDto dto);
	public List<User_BoardDto> getBoards(int start,int perpage); 
	public int getTotalCount();
	public int getMaxNum(); //내가 쓴 글을 getMaxNum으로 최대값을 올리면 바로 쓰자마자 보여준다.
	public User_BoardDto getData(String num); //게시판 글쓰기 후 내가 쓴 글 보이게 하기 위함.
	public void updateReadCount(String num); 
	public String getEmail(String num);  //content의 작성자를 회원가입 email로 넣기

}
