package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ApplyDto;
import boot.data.dto.RecruitDto;
import boot.data.dto.TitleDto;
import boot.data.dto.User_ApplyDto;
import boot.data.dto.User_CareerDto;
import boot.data.dto.User_EducationDto;
import boot.data.inter.RecruitServiceInter;
import boot.data.mapper.RecruitMapperInter;

@Service
public class RecruitService implements RecruitServiceInter {

	@Autowired
	RecruitMapperInter mapper;

	@Override
	public List<RecruitDto> getAllRecruitCourse(int c_code,String r_title) {
		Map<String, Object> map=new HashMap<>();
		map.put("c_code", c_code);
		map.put("r_title", r_title);
		
		return mapper.getAllRecruitCourse(map);
	}

	@Override
	public void insertRecruitCourse(RecruitDto dto) {
		mapper.insertRecruitCourse(dto);
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	@Override
	public List<ApplyDto> getAllApplier() {
		return mapper.getAllApplier();
	}

	@Override
	public String getCompanyNameByCode(int c_code) {
		return mapper.getCompanyNameByCode(c_code);
	}

	@Override
	public int getMaxStepOfCourse(int c_code, String r_title) {
		Map<String, String> map=new HashMap<>();
		map.put("c_code", Integer.toString(c_code));
		map.put("r_title", r_title);
		
		return mapper.getMaxStepOfCourse(map);
	}
	
	//maxstep이 0이면 r_title입력가능..아니면 readonly
	@Override
	public void updateRecruitCourse(RecruitDto dto) {
		mapper.updateRecruitCourse(dto);
	}

	@Override
	public void deleteRecruitCourse(RecruitDto dto) {
		mapper.deleteRecruitCourse(dto);
	}
	
	@Override
	public int getNumByIdx(int a_idx) {
		return mapper.getNumByIdx(a_idx);
	}

	@Override
	public RecruitDto getStepCourseByNum(int r_num) {
		return mapper.getStepCourseByNum(r_num);
	}

	@Override
	public void passThisStep(int r_num,int a_idx) {
		Map<String, Integer> map=new HashMap<>();
		map.put("r_num", r_num);
		map.put("a_idx", a_idx);
		
		mapper.passThisStep(map);
	}

	@Override
	public int getNumOfStep(RecruitDto dto) {
		return mapper.getNumOfStep(dto);
	}

	@Override
	public void failCourse(int a_idx) {
		mapper.failCourse(a_idx);
	}
	
	@Override
	public void failRecord(int a_idx) {
		mapper.failRecord(a_idx);
	}

	@Override
	public String getCompanyPass(int c_code) {
		return mapper.getCompanyPass(c_code);
	}

	@Override
	public List<ApplyDto> getAllFinalPass(int r_num) {
		return mapper.getAllFinalPass(r_num);
	}

	@Override
	public String getEmail(int user_num) {
		return mapper.getEmail(user_num);
	}

	@Override
	public List<User_EducationDto> getEducation(int user_num) {
		return mapper.getEducation(user_num);
	}

	@Override
	public List<User_CareerDto> getCareer(int user_num) {
		return mapper.getCareer(user_num);
	}

	@Override
	public User_ApplyDto getApplyInfo(int user_num) {
		return mapper.getApplyInfo(user_num);
	}

	@Override
	public List<TitleDto> getAllTitles(int c_code) {
		return mapper.getAllTitles(c_code);
	}

	@Override
	public int getApplierCount(int c_code, String r_title) {
		Map<String, String> map=new HashMap<>();
		map.put("c_code", Integer.toString(c_code));
		map.put("r_title", r_title);
		
		return mapper.getApplierCount(map);
	}

	@Override
	public List<Integer> getOutline(int c_code, String r_title) {
		Map<String, String> map=new HashMap<>();
		map.put("c_code", Integer.toString(c_code));
		map.put("r_title", r_title);
		
		return mapper.getOutline(map);
	}
}
