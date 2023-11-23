package boot.data.mapper;


import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.UserGaipDto;
import boot.data.dto.User_ApplyDto;

@Mapper
public interface EmailMapperInter {
   public User_ApplyDto getUserByNum(int apply_num);
   public UserGaipDto getGaipByNum(int user_num);
}