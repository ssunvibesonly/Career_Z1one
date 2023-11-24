package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.Board_ContentDto;
import boot.data.dto.CnoticeDto;
import boot.data.dto.User_BoardDto;

@Mapper
public interface BoardMapperInter {
   public List<User_BoardDto> selectFiveByCategory(String category);
   public List<String> getNameNotice();
   public List<Integer> getRemainDate();
   public List<User_BoardDto> getTopOneTitle();
   public List<User_BoardDto> getAllData();

}