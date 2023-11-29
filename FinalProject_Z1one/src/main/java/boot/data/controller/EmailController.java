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
import org.springframework.web.bind.annotation.ModelAttribute;
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
   @Autowired
   HttpSession httpSession;
   private final String subject = "🎁안녕하세요 Z1one 채용공고가 도착했습니다🎁";
   private final String content = "";

   @GetMapping("/sendEmail")
   public String sendEmail(@RequestParam String user_email) {
      final String TOEMAIL = user_email;
      System.out.println(user_email);

      emailService.sendEmailLeaf(TOEMAIL,subject, content);
      return "/email/emailSuccess";
   }

   @GetMapping("/matchNotice")
   public String matchNotice(@ModelAttribute User_ApplyDto userApplyDto, Model model) {

      String email = (String)httpSession.getAttribute("myid");
      String name =  emailService.getNameByEmailId(email);
      String num = userApplyDto.getUser_num();
      System.out.println(num);

      //이메일 리스트 로직 보내기.
      //공고 다 뽑기
      List<CnoticeDto> list = emailService.getCompanyNotice();

      // 조건에 맞는 것만 뽑기
      // 조건을 뽑을 때 -> user_apply테이블에서 user_num에 해당하는 컬럼의 값들만 뽑아서 비교를 해야한다.
      List<CnoticeDto> list1 = emailService.getMatchUserwithNotice();

      //이메일 비교결과 추출

      model.addAttribute("list",list1);
      model.addAttribute("name",name);

      return "/2/email/matchNotice";
   }

}
