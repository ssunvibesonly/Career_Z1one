package boot.data.inter;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;

import boot.data.dto.CnoticeDto;

public interface EmailInter {
   public List<CnoticeDto> getCompanyNotice();
   public void getMatchUserwithNotice();
   public void sendEmail(String toEmail, String subject, String content);
   public void sendEmailLeaf(String toEmail, String subject, String content);
   public String getNameByEmailId(String user_email);

}