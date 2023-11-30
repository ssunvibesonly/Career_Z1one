package boot.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.User_ActiveDto;
import boot.data.dto.User_ApplyDto;
import boot.data.dto.User_CareerDto;
import boot.data.dto.User_EducationDto;
import boot.data.inter.UserMyPageServiceInter;
import boot.data.mapper.UserMyPageMapperInter;

@Service
public class UserMyPageService implements UserMyPageServiceInter {

	@Autowired
	UserMyPageMapperInter umypageinter;
	
	@Override
	public void insertUserApply(User_ApplyDto applydto) {
		// TODO Auto-generated method stub
		umypageinter.insertUserApply(applydto);
	}

	@Override
	public int UserApplyCheck(String user_num) {
		// TODO Auto-generated method stub
		return umypageinter.UserApplyCheck(user_num);
	}

	@Override
	public String UsergetName(String user_num) {
		// TODO Auto-generated method stub
		return umypageinter.UsergetName(user_num);
	}

	@Override
	public String UsergetWriteday(String user_num) {
		// TODO Auto-generated method stub
		return umypageinter.UsergetWriteday(user_num);
	}

	@Override
	public User_ApplyDto getDataByNum(String user_num) {
		// TODO Auto-generated method stub
		return umypageinter.getDataByNum(user_num);
	}

	@Override
	public void insertUserCareer(User_CareerDto careerdto) {
		// TODO Auto-generated method stub
		umypageinter.insertUserCareer(careerdto);
	}

	@Override
	public void insertUserSchool(User_EducationDto edudto) {
		// TODO Auto-generated method stub
		umypageinter.insertUserSchool(edudto);
	}

	@Override
	public void insertUserActive(User_ActiveDto actdto) {
		// TODO Auto-generated method stub
		umypageinter.insertUserActive(actdto);
	}

	@Override
	public User_CareerDto getCareerDataByNum(String user_num) {
		// TODO Auto-generated method stub
		return umypageinter.getCareerDataByNum(user_num);
	}

	@Override
	public User_EducationDto getEducationDataByNum(String user_num) {
		// TODO Auto-generated method stub
		return umypageinter.getEducationDataByNum(user_num);
	}

	@Override
	public User_ActiveDto getActiveDataByNum(String user_num) {
		// TODO Auto-generated method stub
		return umypageinter.getActiveDataByNum(user_num);
	}

	@Override
	public void UpdateUserApply(User_ApplyDto applydto) {
		// TODO Auto-generated method stub
		umypageinter.UpdateUserApply(applydto);
	}

	@Override
	public void UpdateUserCareer(User_CareerDto careerdto) {
		// TODO Auto-generated method stub
		umypageinter.UpdateUserCareer(careerdto);
	}

	@Override
	public void UpdateUserSchool(User_EducationDto edudto) {
		// TODO Auto-generated method stub
		umypageinter.UpdateUserSchool(edudto);
	}

	@Override
	public void UpdateUserActive(User_ActiveDto actdto) {
		// TODO Auto-generated method stub
		umypageinter.UpdateUserActive(actdto);
	}

	@Override
	public void DeleteUserApply(String user_num) {
		// TODO Auto-generated method stub
		umypageinter.DeleteUserApply(user_num);
	}

	@Override
	public void DeleteUserCareer(String user_num) {
		// TODO Auto-generated method stub
		umypageinter.DeleteUserCareer(user_num);
	}

	@Override
	public void DeleteUserSchool(String user_num) {
		// TODO Auto-generated method stub
		umypageinter.DeleteUserSchool(user_num);
	}

	@Override
	public void DeleteUserActive(String user_num) {
		// TODO Auto-generated method stub
		umypageinter.DeleteUserActive(user_num);
	}

}