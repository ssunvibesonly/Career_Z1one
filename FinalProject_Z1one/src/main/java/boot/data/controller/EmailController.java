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
   private final String content = "ㅎㅇ?";

   @GetMapping("/sendEmail")
   public String sendEmail(@RequestParam String user_email) {
      final String TOEMAIL = user_email;
      System.out.println(user_email);

      emailService.getMatchUserwithNotice();
      //emailService.sendEmail(subject, content, TOEMAIL);
      emailService.sendEmailLeaf(TOEMAIL,subject, content);
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
