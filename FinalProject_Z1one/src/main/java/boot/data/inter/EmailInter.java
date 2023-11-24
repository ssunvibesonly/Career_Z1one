package boot.data.inter;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;

import boot.data.dto.CnoticeDto;

public interface EmailInter {
   public void sendEmail(String toEmail, String subject, String content);
   public void getMatchUserwithNotice();
   public void sendEmailLeaf(String toEmail, String subject, String content);

}