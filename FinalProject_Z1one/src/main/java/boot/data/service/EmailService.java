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
import boot.data.inter.EmailSenderInter;
import boot.data.mapper.ApplyMapperInter;
import boot.data.mapper.CnoticeMapperInter;
import boot.data.mapper.EmailMapperInter;

@Service
public class EmailService implements ApplyInter, CnoticeServiceInter, EmailSenderInter {
   @Autowired
   CnoticeMapperInter cnoticeMapperInter;
   @Autowired
   ApplyMapperInter applyMapperInter;
   @Autowired
   JavaMailSender javaMailSender;
   @Autowired
   EmailMapperInter emailMapperInter;
   private final String FROM_EMAIL = "jinhyeonkyu@gmail.com";

   @Override
   public void sendEmail(String toEmail, String subject, String content) {
      SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

      simpleMailMessage.setFrom(FROM_EMAIL); //보내는 사람
      simpleMailMessage.setTo(toEmail); //누구한테 보낼지
      simpleMailMessage.setText(content); //어떤 내용 보낼지
      simpleMailMessage.setSubject(subject); //무슨 제목으로 보낼지

      javaMailSender.send(simpleMailMessage);
      System.out.println("메일 보내기 성공");
   }
   @Override
   public User_ApplyDto getApplyNum(int apply_Num) {
      return applyMapperInter.getApplyNum(apply_Num);
   }

		@Override
		public List<CnoticeDto> getPassMoneyNotices() {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public List<CnoticeDto> getReadCountNotices() {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public List<CnoticeDto> getWriteDayNotices() {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public List<CnoticeDto> getDeadLineNotices() {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public int getTotalCount() {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public List<CnoticeDto> jobList(String[] cnotice_Job) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public List<CnoticeDto> areaList(String cnotice_Area) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public List<CnoticeDto> careerList(String cnotice_Career) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public List<CnoticeDto> academicList(String cnotice_Academic) {
			// TODO Auto-generated method stub
			return null;
		}

}