package boot.data.service;


import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import boot.data.dto.CnoticeDto;
import boot.data.inter.EmailInter;
import boot.data.mapper.EmailMapperInter;

@Service
public class EmailService implements EmailInter {
   @Autowired
   JavaMailSender javaMailSender;
   @Autowired
   private TemplateEngine templateEngine;
   @Autowired
   EmailMapperInter emailMapperInter;
   @Autowired
   HttpSession httpSession;
   private final String FROM_EMAIL = "jinhyeonkyu@gmail.com";

   @Override
   public void sendEmail(String toEmail,String subject, String content) {
      SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

      simpleMailMessage.setFrom(FROM_EMAIL); //보내는 사람
      simpleMailMessage.setTo(toEmail); //누구한테 보낼지
      simpleMailMessage.setSubject(subject); //무슨 제목으로 보낼지
      simpleMailMessage.setText(content); //어떤 내용 보낼지

      javaMailSender.send(simpleMailMessage);
      System.out.println("메일 보내기 성공");
   }

   @Override
   public List<CnoticeDto> getCompanyNotice() {
      return emailMapperInter.getCompanyNotice();
   }

   @Override
   public List<CnoticeDto> getMatchUserwithNotice(int user_num) {
      return emailMapperInter.getMatchUserwithNotice(user_num);
   }

   @Override
   public void sendEmailLeaf(String toEmail, String subject, String content) {
      MimeMessage mimeMessage = javaMailSender.createMimeMessage();
      try {
         MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
         mimeMessageHelper.setFrom(FROM_EMAIL);
         mimeMessageHelper.setTo(toEmail);
         mimeMessageHelper.setSubject(subject);

         //String id = (String)httpSession.getAttribute("myid");

         // Create a Thymeleaf context
         Context thymeleafContext = new Context();
         //thymeleafContext.setVariable("myid",id);
         //thymeleafContext.setVariable("title", subject);
         //thymeleafContext.setVariable("content", content);

         // Process the Thymeleaf template
         String emailBody = templateEngine.process("email-template", thymeleafContext);

         mimeMessageHelper.setText(emailBody, true);
         javaMailSender.send(mimeMessage);

         System.out.println("메일 보내기 성공");
      } catch (MessagingException e) {
         e.printStackTrace();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   @Override
   public String getNameByEmailId(String user_email) {
      return emailMapperInter.getNameByEmailId(user_email);
   }

}
