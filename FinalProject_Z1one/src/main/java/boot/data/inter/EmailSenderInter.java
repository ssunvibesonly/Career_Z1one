package boot.data.inter;


public interface EmailSenderInter {
   public void sendEmail(String toEmail, String subject, String content);

}