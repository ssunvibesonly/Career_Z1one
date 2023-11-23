package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ApplyDto;
import boot.data.dto.RecruitDto;
import boot.data.dto.TitleDto;
import boot.data.dto.User_ApplyDto;
import boot.data.dto.User_CareerDto;
import boot.data.dto.User_EducationDto;

@Mapper
public interface RecruitMapperInter {

	public List<RecruitDto> getAllRecruitCourse(Map<String, Object> map);
	public void insertRecruitCourse(RecruitDto dto);
	public int getTotalCount();
	public List<ApplyDto> getAllApplier();
	public String getCompanyNameByCode(int c_code);
	public int getMaxStepOfCourse(Map<String, String> map);
	public void updateRecruitCourse(RecruitDto dto);
	public void deleteRecruitCourse(RecruitDto dto);
	public int getNumByIdx(int a_idx);
	public RecruitDto getStepCourseByNum(int r_num);
	public int getNumOfStep(RecruitDto dto);
	public void passThisStep(Map<String, Integer> map);
	public void failCourse(int a_idx);
	public void failRecord(int a_idx);
	public String getCompanyPass(int c_code);
	public List<ApplyDto> getAllFinalPass(int r_num);
	public String getEmail(int user_num);
	public List<User_EducationDto> getEducation(int user_num);
	public List<User_CareerDto> getCareer(int user_num);
	public User_ApplyDto getApplyInfo(int user_num);
	
	public List<TitleDto> getAllTitles(int c_code);
	public int getApplierCount(Map<String, String> map);
	public List<Integer> getOutline(Map<String, String> map);
}
