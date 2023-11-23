package boot.data.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.UserGaipDto;
import boot.data.inter.UserGaipServiceInter;
import boot.data.mapper.UserGaipMapperInter;

@Service
public class UserGaipService implements UserGaipServiceInter {

   @Autowired
   UserGaipMapperInter ugaipinter;
   
   @Override
   public int getTotalCount() {
      // TODO Auto-generated method stub
      return ugaipinter.getTotalCount();
   }

   @Override
   public void insertUserMember(UserGaipDto dto) {
      // TODO Auto-generated method stub
      ugaipinter.insertUserMember(dto);
   }

   @Override
   public int getSearchUserId(String user_email) {
      // TODO Auto-generated method stub
      return ugaipinter.getSearchUserId(user_email);
   }

   @Override
   public int loginPassCheck(String user_email, String user_pass) {
      // TODO Auto-generated method stub
      Map<String, String> map=new HashMap<>();
      map.put("user_email", user_email);
      map.put("user_pass", user_pass);
      
      return ugaipinter.loginPassCheck(map);
   }

   @Override
   public UserGaipDto getDataById(String user_email) {
      // TODO Auto-generated method stub
      return ugaipinter.getDataById(user_email);
   }

   @Override
   public String getEmail(String user_email) {
      // TODO Auto-generated method stub
      return ugaipinter.getEmail(user_email);
   }

}