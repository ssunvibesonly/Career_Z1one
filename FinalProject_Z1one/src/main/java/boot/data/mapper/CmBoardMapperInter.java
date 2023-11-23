package boot.data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.User_BoardDto;

@Mapper
public interface CmBoardMapperInter {

	public void insertCmBoard(User_BoardDto dto);
	public List<User_BoardDto> getBoards(HashMap<String, Integer> map); 
	public int getTotalCount();  //게시글 전체 수 (페이징과 연관)
	public int getMaxNum(); //내가 쓴 글을 getMaxNum으로 최대값을 올리면 바로 쓰자마자 보여준다.
	public User_BoardDto getData(String num); //게시판 글쓰기 후 내가 쓴 글 보이게 하기 위함.
	public void updateReadCount(String num); 
	public String getEmail(String num);  //content의 작성자를 회원가입 email로 넣기
}
