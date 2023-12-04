package boot.data.inter;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;

import boot.data.dto.CnoticeDto;
import boot.data.dto.User_ApplyDto;

public interface EmailInter {
   public User_ApplyDto getUserByNum(String user_num);
   public List<User_ApplyDto> getAllUser();
   public List<CnoticeDto> getCompanyNotice();
   public List<CnoticeDto> getMatchUserwithNotice(String user_num);
   public void sendEmail(String toEmail, String subject, String content);
   public void sendEmailLeaf(String toEmail, String subject, String content);
   public String getNameByEmailId(String user_email);

}