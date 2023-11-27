package boot.data.inter;

import java.util.List;

import boot.data.dto.Board_ContentDto;

public interface BoardAnswerServiceInter {

	public int getMaxNum();
	public int getTotalCount();
	public void insertBanswer(Board_ContentDto dto);
	public List<Board_ContentDto> getAllBAnswer(String board_num);
}
