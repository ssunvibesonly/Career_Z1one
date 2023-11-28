package boot.data.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.Board_ContentDto;
import boot.data.dto.User_BoardDto;
import boot.data.service.BoardService;
import boot.data.service.EmailService;

@Controller
@RequestMapping("/board")
public class BoardController {
   @Autowired
   BoardService boardService;
   @Autowired
   EmailService emailService;

   // 게시판 인기 공고 글 띄우기.
   @GetMapping("/community")
   public ModelAndView boardmain(HttpSession httpSession) {

      ModelAndView modelAndView = new ModelAndView();

      List<String> list1 = boardService.getNameNotice();
      //List<Integer> date1 = boardService.getRemainDate();

      CompletableFuture<List<User_BoardDto>> oneTitle = boardService.getTopOneTitle(); //비동기 처리.
      List<User_BoardDto> onetitle1 = oneTitle.join();

      //카테고리 별 게시판 띄우기
      List<User_BoardDto> title = boardService.selectFiveByCategory("자소서");
      List<User_BoardDto> title1 = boardService.selectFiveByCategory("면접");
      List<User_BoardDto> title2 = boardService.selectFiveByCategory("portfolio");
      List<User_BoardDto> title3 = boardService.selectFiveByCategory("신입꿀팁");
      List<User_BoardDto> title4 = boardService.selectFiveByCategory("이직STORY");
      List<User_BoardDto> title5 = boardService.selectFiveByCategory("퇴사꿀팁");
      List<User_BoardDto> title6 = boardService.selectFiveByCategory("Z1맘대로");
      List<User_BoardDto> title7 = boardService.selectFiveByCategory("인적성");
      List<User_BoardDto> title8 = boardService.selectFiveByCategory("회사생활");
      List<User_BoardDto> title9 = boardService.selectFiveByCategory("Z1마켓");

      //인기공고
      modelAndView.addObject("list1",list1);
      //modelAndView.addObject("date1",date1);

      //토픽베스트 (카테고리, 타이틀 , 좋아요수, 댓글수)
      modelAndView.addObject("oneTitle",onetitle1); //카테고리, 타이틀, 좋아요수

      modelAndView.addObject("title",title);
      modelAndView.addObject("title1",title1);
      modelAndView.addObject("title2",title2);
      modelAndView.addObject("title3",title3);
      modelAndView.addObject("title4",title4);
      modelAndView.addObject("title5",title5);
      modelAndView.addObject("title6",title6);
      modelAndView.addObject("title7",title7);
      modelAndView.addObject("title8",title8);
      modelAndView.addObject("title9",title9);


      modelAndView.setViewName("/2/community/cmMain");
      return modelAndView;
   }


   }