package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.data.dto.User_BoardDto;
import boot.data.service.BoardSearchService;

@Controller
@RequestMapping("/board")
public class BoardSearchController {
   @Autowired
   BoardSearchService boardSearchService;

   @GetMapping("/search")
   public String searchBoardByTitle(@RequestParam(required = false) String searchword, Model model) {
      if(searchword==null) {
         List<User_BoardDto> getAllResults = boardSearchService.getAllSearch();
         model.addAttribute("getAllResults", getAllResults);
      }
         List<User_BoardDto> searchResults = boardSearchService.searchTitle(searchword);
         model.addAttribute("searchResults", searchResults);
         model.addAttribute("resultCount", searchResults.size());
         model.addAttribute("searchword", searchword);
      return "/2/community/searchResult"; // 검색 결과를 보여줄 페이지로 이동
   }

   @GetMapping("/sort")
   @ResponseBody
   public List<User_BoardDto> list(@RequestParam(required = false) String searchword, @RequestParam(required = false) String orderby) {

      if(searchword == null && orderby==null) {
         return boardSearchService.getAllSearch();
      } else {
         return boardSearchService.getSort(searchword,orderby);
      }
   }
}