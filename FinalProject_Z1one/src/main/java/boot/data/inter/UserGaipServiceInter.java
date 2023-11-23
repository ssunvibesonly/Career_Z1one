package boot.data.inter;

import boot.data.dto.UserGaipDto;

public interface UserGaipServiceInter {
   public int getTotalCount();
   public void insertUserMember(UserGaipDto dto);
   public int getSearchUserId(String user_email);
   public int loginPassCheck(String user_email, String user_pass);
   public UserGaipDto getDataById(String user_email);
   public String getEmail(String user_email);
}