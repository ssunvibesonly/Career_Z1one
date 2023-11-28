package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.User_BoardDto;
import boot.data.inter.BoardSearchInter;
import boot.data.mapper.BoardSearchMapperInter;

@Service
public class BoardSearchService implements BoardSearchInter {
   @Autowired
   BoardSearchMapperInter boardSearchMapperInter;

   @Override
   public List<User_BoardDto> searchTitle(String searchword) {
      return boardSearchMapperInter.searchTitle(searchword);
   }

   @Override
   public List<User_BoardDto> getAllSearch() {

      return boardSearchMapperInter.getAllSearch();
   }

   @Override
   public List<User_BoardDto> getSort(String searchword, String orderby) {
      Map<String,String> map = new HashMap<String,String>();


      map.put("searchword", searchword);
      map.put("orderby", orderby);
      return boardSearchMapperInter.getSort(map);
   }
}