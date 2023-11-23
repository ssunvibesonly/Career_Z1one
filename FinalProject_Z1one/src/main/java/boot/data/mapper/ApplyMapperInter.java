package boot.data.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.CnoticeDto;
import boot.data.dto.User_ApplyDto;

@Mapper
public interface ApplyMapperInter {
   //public List<User_ApplyDto> getUserApplyList();
   //public List<User_ApplyDto> getSingleDto(int apply_Num);
   public User_ApplyDto getApplyNum(int user_num);


}