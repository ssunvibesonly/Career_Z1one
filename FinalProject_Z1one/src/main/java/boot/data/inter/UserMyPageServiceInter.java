package boot.data.inter;

import boot.data.dto.UserGaipDto;
import boot.data.dto.User_ActiveDto;
import boot.data.dto.User_ApplyDto;
import boot.data.dto.User_CareerDto;
import boot.data.dto.User_EducationDto;

public interface UserMyPageServiceInter {
	public void insertUserApply(User_ApplyDto applydto);
	public void insertUserCareer(User_CareerDto careerdto);
	public void insertUserSchool(User_EducationDto edudto);
	public void insertUserActive(User_ActiveDto actdto);
	public int UserApplyCheck(String user_num);
	public User_ApplyDto getDataByNum(String user_num);
	public User_CareerDto getCareerDataByNum(String user_num);
	public User_EducationDto getEducationDataByNum(String user_num);
	public User_ActiveDto getActiveDataByNum(String user_num);
	public String UsergetName(String user_num);
	public String UsergetWriteday(String user_num);
	public void UpdateUserApply(User_ApplyDto applydto);
	public void UpdateUserCareer(User_CareerDto careerdto);
	public void UpdateUserSchool(User_EducationDto edudto);
	public void UpdateUserActive(User_ActiveDto actdto);
	public void DeleteUserApply(String user_num);
	public void DeleteUserCareer(String user_num);
	public void DeleteUserSchool(String user_num);
	public void DeleteUserActive(String user_num);
	public String getPhoto(String user_num);
}