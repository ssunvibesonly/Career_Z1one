package boot.data.controller;

import java.util.List;

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
   @Autowired
   CnoticeMapperInter cnoticeMapperInter;
   @Autowired
   ApplyMapperInter applyMapperInter;
   @Autowired
   EmailMapperInter emailMapperInter;
   UserGaipDto userGaipDto;
   HttpSession httpSession;

   private final String subject = "🎁 안녕하세요 Z1one 채용공고가 도착했습니다 🎁 ";
   private final String content = "아 이거 기업 리스트를 어케띄우냐 하.";

   @GetMapping("/sendEmail")
   @ResponseBody
   public String sendEmail(@RequestParam(required = false) int user_num) {
      final String TOEMAIL = (String)httpSession.getAttribute("myid");
      //로그인된 사람이 버튼을 클릭하면 작동하게 로직 작성


      //이메일 비교한 쿼리 로직
      emailService.getMatchUserwithNotice();
      // 이메일 보내는 로직
	  emailService.sendEmail(subject, content, TOEMAIL);
      return "/email/emailSuccess";
   }
}















/*
	   for(CnoticeDto cnoticeDto : cnoticeDtos) { if
		   (cnoticeDto.getCnotice_Salary().equalsIgnoreCase(userApplyDto.getApply_Salary
		   ()) &&
		   cnoticeDto.getCnotice_Place().equalsIgnoreCase(userApplyDto.getApply_region()
		   ) &&
		   cnoticeDto.getCnotice_Team().equalsIgnoreCase(userApplyDto.getApply_primary()
		   )) { String subject = "안녕하세요! 기업 맞춤공고 이메일 입니다."; String content =
		   "이거 어떻게 보낼꺼임 list로 띄우나?? ㅈㄴ어려운데"; String toEmail =
		   userGaipDto.getUser_email(); //이렇게하면 지금 로그인된 사람의 user_email을 가져올 수 있나?*/
