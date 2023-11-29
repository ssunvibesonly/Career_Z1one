package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.Board_ContentDto;

@Mapper
public interface BoardAnswerMapperInter {

	public int getMaxNum();
	public int getTotalCount();
	public void insertBanswer(Board_ContentDto dto);
	public List<Board_ContentDto> getAllBAnswer(String board_num);
	public Board_ContentDto getAnswer(String content_num); //댓글수정num
	public void updateBanswer(Map<String, String> map); //댓글 수정
	public void deleteAnswer(String content_num); //댓글 삭제
	
	public Board_ContentDto getAnswerCount(String board_num);  //게시판list 댓글 수 나타내기 위한 사전 조건
}
