package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import boot.data.dto.CnoticeDto;
import boot.data.dto.User_ApplyDto;
import boot.data.inter.ApplyInter;
import boot.data.inter.CnoticeServiceInter;
import boot.data.inter.EmailInter;
import boot.data.mapper.ApplyMapperInter;
import boot.data.mapper.CnoticeMapperInter;
import boot.data.mapper.EmailMapperInter;

@Service
public class EmailService implements EmailInter {
   @Autowired
   JavaMailSender javaMailSender;
   @Autowired
   EmailMapperInter emailMapperInter;
   private final String FROM_EMAIL = "jinhyeonkyu@gmail.com";

   @Override
   public void sendEmail(String subject, String content, String toEmail) {
      SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

      simpleMailMessage.setFrom(FROM_EMAIL); //보내는 사람
      simpleMailMessage.setSubject(subject); //무슨 제목으로 보낼지
      simpleMailMessage.setText(content); //어떤 내용 보낼지
      simpleMailMessage.setTo(toEmail); //누구한테 보낼지

      javaMailSender.send(simpleMailMessage);
      System.out.println("메일 보내기 성공");
   }

   @Override
   public List<CnoticeDto> getMatchUserwithNotice() {
      return emailMapperInter.getMatchUserwithNotice();
   }

}