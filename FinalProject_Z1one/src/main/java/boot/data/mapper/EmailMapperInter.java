package boot.data.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.CnoticeDto;
import boot.data.dto.UserGaipDto;
import boot.data.dto.User_ApplyDto;

@Mapper
public interface EmailMapperInter {
   //usernum에 따른 dto 값 가져오기
   public User_ApplyDto getUserByNum(int user_num);
   //회사 전체 List가져오기
   public List<CnoticeDto> getCompanyNotice();
   //회사랑 회원이랑 조건 비교한 메소드
   public List<CnoticeDto> getMatchUserwithNotice(int user_num);
   public String getNameByEmailId(String user_email);

}