package boot.data.mapper;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.User_ActiveDto;
import boot.data.dto.User_ApplyDto;
import boot.data.dto.User_CareerDto;
import boot.data.dto.User_EducationDto;

@Mapper
public interface UserMyPageMapperInter {
	public void insertUserApply(User_ApplyDto applydto);
	public int UserApplyCheck(String user_num);
	public User_ApplyDto getDataByNum(String user_num);
	public String UsergetName(String user_num);
	public String UsergetWriteday(String user_num);
}