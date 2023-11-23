package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.CnoticeDto;
import boot.data.inter.CnoticeServiceInter;
import boot.data.mapper.CnoticeMapperInter;

@Service
public class CnoticeSerivce implements CnoticeServiceInter {

	@Autowired
	CnoticeMapperInter cnoticeInter;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return cnoticeInter.getTotalCount();
	}

	@Override
	public List<CnoticeDto> getPassMoneyNotices() {
		// TODO Auto-generated method stub
		return cnoticeInter.getPassMoneyNotices();
	}

	@Override
	public List<CnoticeDto> getReadCountNotices() {
		// TODO Auto-generated method stub
		return cnoticeInter.getReadCountNotices();
	}

	@Override
	public List<CnoticeDto> getWriteDayNotices() {
		// TODO Auto-generated method stub
		return cnoticeInter.getWriteDayNotices();
	}

	@Override
	public List<CnoticeDto> getDeadLineNotices() {
		// TODO Auto-generated method stub
		return cnoticeInter.getDeadLineNotices();
	}


	@Override
	public List<CnoticeDto> areaList(String cnotice_Area) {
		// TODO Auto-generated method stub
		return cnoticeInter.areaList(cnotice_Area);
	}

	@Override
	public List<CnoticeDto> careerList(String cnotice_Career) {
		// TODO Auto-generated method stub
		return cnoticeInter.careerList(cnotice_Career);
	}

	@Override
	public List<CnoticeDto> academicList(String cnotice_Academic) {
		// TODO Auto-generated method stub
		return cnoticeInter.academicList(cnotice_Academic);
	}

	@Override
	public List<CnoticeDto> jobList(String[] cnotice_Job) {
		// TODO Auto-generated method stub
		return cnoticeInter.jobList(cnotice_Job);
	}




}
