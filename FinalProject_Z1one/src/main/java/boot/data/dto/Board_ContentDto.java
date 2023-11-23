package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Board_ContentDto")
public class Board_ContentDto {
   private int content_num;
   private int board_num;
   private String content;
   private int likes;
   private int regroup;
   private int relevel;
   private int restep;
   private Timestamp writeday;
   @Override
   public String toString() {
      return "Board_ContentDto [content_num=" + content_num + ", board_num=" + board_num + ", content=" + content + "]";
   }
}