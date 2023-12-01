package boot.data.inter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import boot.data.dto.User_BoardDto;

public interface CmBoardServiceInter {

	public void insertCmBoard(User_BoardDto dto);
	public List<User_BoardDto> getBoards(int start,int perpage); 
	public int getTotalCount(String board_category);
	public int getMaxNum(); //내가 쓴 글을 getMaxNum으로 최대값을 올리면 바로 쓰자마자 보여준다.
	public User_BoardDto getData(String board_num); //게시판 글쓰기 후 내가 쓴 글 보이게 하기 위함.
	public void updateReadCount(String board_num); 
	public String getEmail(String user_num);  //content의 작성자를 회원가입 email로 넣기
	public void updateLikes(String board_num); //content에서 좋아요 버튼 클릭시 board_like 숫자 증가
	public void updateunLikes(String board_num); //content에서 좋아요 버튼 2번 클릭하면 board_like 숫자 -1 감소 
	public List<User_BoardDto> getBoardsByCategory(int start, int perpage, String board_category);//해당 카테고리에 해당하는 전체 게시글 출력
}
