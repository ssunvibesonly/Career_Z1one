package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

   @GetMapping("/sendEmail")
   public String sendEmail(@RequestParam int user_num) {
      List<CnoticeDto> cnoticeDtos = cnoticeMapperInter.getPassMoneyNotices();
      User_ApplyDto userApplyDto = applyMapperInter.getApplyNum(user_num);
      System.out.println(user_num);
      System.out.println(cnoticeDtos.toString());
      System.out.println(userApplyDto.toString());

		/*
		 * for(CnoticeDto cnoticeDto : cnoticeDtos) { if
		 * (cnoticeDto.getCnotice_Salary().equalsIgnoreCase(userApplyDto.getApply_Salary
		 * ()) &&
		 * cnoticeDto.getCnotice_Place().equalsIgnoreCase(userApplyDto.getApply_region()
		 * ) &&
		 * cnoticeDto.getCnotice_Team().equalsIgnoreCase(userApplyDto.getApply_primary()
		 * )) { String subject = "안녕하세요! 기업 맞춤공고 이메일 입니다."; String content =
		 * "이거 어떻게 보낼꺼임 list로 띄우나?? ㅈㄴ어려운데"; String toEmail =
		 * userGaipDto.getUser_email(); //이렇게하면 지금 로그인된 사람의 user_email을 가져올 수 있나?
		 * 
		 * emailService.sendEmail(subject, content, toEmail); } }
		 */
      return "/email/emailSuccess";
   }




}