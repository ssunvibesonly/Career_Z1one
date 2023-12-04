package boot.data.inter;

import java.util.List;

import boot.data.dto.UserGaipDto;

public interface UserGaipServiceInter {
   public int getTotalCount();
   public void insertUserMember(UserGaipDto dto);
   public int getSearchUserId(String user_email);
   public int loginPassCheck(String user_email, String user_pass);
   public UserGaipDto getDataById(String user_email);
   public String getEmail(String user_email);
   public UserGaipDto getDataByNum(String user_num);
   public List<UserGaipDto> getAllUser();
   public void UpdateUserEdit(UserGaipDto dto);
   public void DeleteMember(String user_email);
   public void UpdatePass(UserGaipDto dto);
  
}