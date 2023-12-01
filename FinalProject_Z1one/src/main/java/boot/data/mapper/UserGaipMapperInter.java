package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.UserGaipDto;

@Mapper
public interface UserGaipMapperInter {
    public int getTotalCount();
    public void insertUserMember(UserGaipDto dto);
    public int getSearchUserId(String user_email);
    public int loginPassCheck(Map<String, String> map);
    public UserGaipDto getDataById(String user_email);
    public String getEmail(String user_email);
    public UserGaipDto getDataByNum(String user_num);
    public List<UserGaipDto> getAllUser();
    public void UpdateUserEdit(UserGaipDto dto);
    
	/* public String getName(String user_email); */
}