package boot.data.service;

import java.util.List;
import java.util.concurrent.CompletableFuture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import boot.data.dto.Board_ContentDto;
import boot.data.dto.User_BoardDto;
import boot.data.inter.BoardInter;
import boot.data.mapper.BoardMapperInter;

@Service
public class BoardService implements BoardInter {
   @Autowired
   private BoardMapperInter boardMapperInter;

   @Override
   public List<User_BoardDto> selectFiveByCategory(String category) {
      return boardMapperInter.selectFiveByCategory(category);
   }

   @Override
   public List<String> getNameNotice() {
      return boardMapperInter.getNameNotice();
   }

   @Override
   public List<Integer> getRemainDate() {
      return boardMapperInter.getRemainDate();
   }

   @Override
   @Async
   public CompletableFuture<List<User_BoardDto>> getTopOneTitle() {
      return CompletableFuture.completedFuture(boardMapperInter.getTopOneTitle());
   }

   @Override
   public List<User_BoardDto> getAllData() {
      return boardMapperInter.getAllData();
   }

   @Override
   public Board_ContentDto getContentCount(String board_num) {
      return boardMapperInter.getContentCount(board_num);
   }

}