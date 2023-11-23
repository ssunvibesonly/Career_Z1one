package boot.data.mapper;


import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.User_ApplyDto;

@Mapper
public interface ApplyMapperInter {
   //public List<User_ApplyDto> getUserApplyList();
   //public List<User_ApplyDto> getSingleDto(int apply_Num);
   public User_ApplyDto getApplyNum(int apply_Num);

}