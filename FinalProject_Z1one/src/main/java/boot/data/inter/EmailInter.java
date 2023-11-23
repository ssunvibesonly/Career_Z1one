package boot.data.inter;

import java.util.List;

import boot.data.dto.CnoticeDto;

public interface EmailInter {
   public void sendEmail(String toEmail, String subject, String content);
   public List<CnoticeDto> getMatchUserwithNotice();
}