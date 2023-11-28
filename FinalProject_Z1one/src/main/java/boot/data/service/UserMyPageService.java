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

}