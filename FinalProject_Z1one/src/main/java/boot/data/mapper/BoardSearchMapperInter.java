package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.User_BoardDto;

@Mapper
public interface BoardSearchMapperInter {
   public List<User_BoardDto> searchTitle(String searchword);
   public List<User_BoardDto> getAllSearch();
   public List<User_BoardDto> getSort(Map<String,String> map);
}