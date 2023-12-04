package boot.data.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.data.dto.Board_ContentDto;
import boot.data.dto.CnoticeDto;
import boot.data.dto.UserGaipDto;
import boot.data.dto.User_ApplyDto;
import boot.data.dto.User_BoardDto;
import boot.data.mapper.ApplyMapperInter;
import boot.data.mapper.CnoticeMapperInter;
import boot.data.mapper.EmailMapperInter;
import boot.data.service.EmailService;

@Controller
@RequestMapping("/email")
public class EmailController {

   @Autowired
   JavaMailSender javaMailSender;
   @Autowired
   private EmailService emailService;
   @Autowired
   HttpSession httpSession;
   private final String subject = "🎁안녕하세요 Z1one 채용공고가 도착했습니다🎁";
   private final String content = "";

   @GetMapping("/sendEmail")
   public String sendEmail(@RequestParam String user_email, @RequestParam String user_num) {
      final String TOEMAIL = user_email;

      System.out.println("넘기는 num :" + user_num);

      emailService.sendEmailLeaf(TOEMAIL,subject, content);
      return "/email/emailSuccess";
   }

   @GetMapping("/matchNotice")
   public String matchNotice(@RequestParam(defaultValue = "0") String user_num, Model model) {

      String email = (String)httpSession.getAttribute("myid");
      String num  = (String)httpSession.getAttribute("user_num");
      String name =  emailService.getNameByEmailId(email);
      List<CnoticeDto> list1 = emailService.getMatchUserwithNotice(user_num);
      System.out.println(list1.toString());

      model.addAttribute("Total",list1.size());
      model.addAttribute("list",list1);
      model.addAttribute("name",name);

      return "/2/email/matchNotice";
   }

}
/*      //notice list
      List<CnoticeDto> list = emailService.getCompanyNotice(); //회사 공고 리스트
      //user list
      List<User_ApplyDto> userList = emailService.getAllUser();
      List<User_ApplyDto> UserNumList = new ArrayList<User_ApplyDto>();
      for (int i = 0; i <userList.size() ; i++) {
         UserNumList.add(emailService.getUserByNum(UserNumList.get(i).getUser_num()));
         System.out.println("user_num : "+userList.get(i).getUser_num());
      }
      System.out.println("ToString : " + UserNumList.toString());
      System.out.println("기본" + UserNumList);
      model.addAttribute("contentList",UserNumList);*/