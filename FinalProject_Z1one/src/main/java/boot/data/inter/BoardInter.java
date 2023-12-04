package boot.data.inter;

import java.util.List;
import java.util.concurrent.CompletableFuture;

import boot.data.dto.Board_ContentDto;
import boot.data.dto.User_BoardDto;

public interface BoardInter {
   public List<User_BoardDto> selectFiveByCategory(String category);
   public List<String> getNameNotice();
   public List<Integer> getRemainDate();
   public CompletableFuture<List<User_BoardDto>> getTopOneTitle();
   public List<User_BoardDto> getAllData();
   public Board_ContentDto getContentCount(String board_num);

}