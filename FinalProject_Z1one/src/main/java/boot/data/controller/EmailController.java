package boot.data.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.data.dto.CnoticeDto;
import boot.data.dto.UserGaipDto;
import boot.data.dto.User_ApplyDto;
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
   private final String subject = "🎁안녕하세요 Z1one 채용공고가 도착했습니다🎁";
   private final String content = "";

   @GetMapping("/sendEmail")
   public String sendEmail(@RequestParam String user_email) {
      final String TOEMAIL = user_email;
      System.out.println(user_email);

      emailService.getMatchUserwithNotice();
      //emailService.sendEmail(subject, content, TOEMAIL);
      emailService.sendEmailLeaf(TOEMAIL,subject, content);
      return "/email/emailSuccess";
   }

   @GetMapping("/matchNotice")
   public String matchNotice(Model model,HttpSession httpSession) {

      String email = (String)httpSession.getAttribute("myid");
      String name =  emailService.getNameByEmailId(email);
      System.out.println(email);
      System.out.println(name);

      //이메일 리스트 로직 보내기.
      List<CnoticeDto> list = emailService.getCompanyNotice();
      System.out.println(list.size() + "개");

      //이메일 비교결과 추출

      model.addAttribute("list",list);
      model.addAttribute("name",name);

      return "/2/email/matchNotice?user_email="+email;
   }

}
