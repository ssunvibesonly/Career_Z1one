package boot.data.service;

import java.util.List;

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
   public List<User_BoardDto> getSort(String orderby) {
      return boardSearchMapperInter.getSort(orderby);
   }
}