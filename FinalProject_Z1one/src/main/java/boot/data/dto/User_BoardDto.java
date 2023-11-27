package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("User_BoardDto")
public class User_BoardDto {
   private String board_num;
   private String user_num;
   private String board_bigcategory; //카테고리대분류 추가함
   private String board_category; //카테고리 소분류
   private String board_title;
   private String board_story;
   private String board_photo; 
   private MultipartFile save;  //cmForm에 name과 일치해야 함
   private String board_readcnt;
   private int board_like;
   private int board_dislike;
   private Timestamp board_writeday;
   
   //사용자 이메일 띄어주기용
   private String user_email;
}