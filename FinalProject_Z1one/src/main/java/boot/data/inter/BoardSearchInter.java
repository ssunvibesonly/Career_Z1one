package boot.data.inter;

import java.util.List;

import boot.data.dto.User_BoardDto;

public interface BoardSearchInter {
   public List<User_BoardDto> searchTitle(String searchword);
   public List<User_BoardDto> getAllSearch();
   public List<User_BoardDto> getSort(String searchword, String orderby);
}