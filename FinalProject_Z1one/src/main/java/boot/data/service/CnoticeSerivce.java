package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.CnoticeDto;
import boot.data.dto.Company_DetailDto;
import boot.data.dto.RecruitDto;
import boot.data.inter.CnoticeServiceInter;
import boot.data.mapper.CnoticeMapperInter;

@Service
public class CnoticeSerivce implements CnoticeServiceInter {

	@Autowired
	CnoticeMapperInter cnoticeInter;

	@Override
	public List<CnoticeDto> testList(String[] industry, String[] career, String[] location, String gradeLeft,
			String gradeRight, String[] type, String[] academy, String orderBy) {
		// TODO Auto-generated method stub
		return cnoticeInter.testList(industry, career, location, gradeLeft, gradeRight, type, academy, orderBy);
	}

	@Override
	public CnoticeDto getNoticeData(int cnotice_num) {
		// TODO Auto-generated method stub
		return cnoticeInter.getNoticeData(cnotice_num);
	}

	@Override
	public List<CnoticeDto> readCountList() {
		// TODO Auto-generated method stub
		return cnoticeInter.readCountList();
	}

	@Override
	public void insertNotice(CnoticeDto dto) {
		// TODO Auto-generated method stub
		cnoticeInter.insertNotice(dto);
	}

	@Override
	public void deleteNotice(int cnotice_num) {
		// TODO Auto-generated method stub
		cnoticeInter.deleteNotice(cnotice_num);
	}

	@Override
	public void updateNotice(CnoticeDto dto) {
		// TODO Auto-generated method stub
		cnoticeInter.updateNotice(dto);
	}

	@Override
	public void insertDetail(Company_DetailDto dto) {
		// TODO Auto-generated method stub
		cnoticeInter.insertDetail(dto);
	}

	@Override
	public Company_DetailDto getDetailData(int cnotice_num, int company_num) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("cnotice_num", cnotice_num);
		map.put("company_num", company_num);
		return cnoticeInter.getDetailData(map);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return cnoticeInter.getMaxNum();
	}

	
<<<<<<< HEAD



	









=======
>>>>>>> eff156aba857b27028a5cf75228e81ee6ed57b5f
}
