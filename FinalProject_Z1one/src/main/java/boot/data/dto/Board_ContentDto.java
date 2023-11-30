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
   
   //list에 content
   private int count;
   
   //list출력용 writeday
   private String sdf_writeday;
   
   //사용자 email
   private String user_email;
   
   @Override
   public String toString() {
      return "Board_ContentDto [content_num=" + content_num + ", board_num=" + board_num + ", content=" + content + "]";
   }
}