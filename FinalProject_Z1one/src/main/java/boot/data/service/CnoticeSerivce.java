package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<CnoticeDto> allList(String[] cnotice_Job_List, String[] cnotice_Area_List, String[] cnotice_Career_List,
			String[] cnotice_Academic_List, String orderBy) {
		// TODO Auto-generated method stub
		return cnoticeInter.allList(cnotice_Job_List, cnotice_Area_List, cnotice_Career_List, cnotice_Academic_List, orderBy);
	}

	@Override
	public CnoticeDto getNoticeData(String cnotice_Num) {
		// TODO Auto-generated method stub
		return cnoticeInter.getNoticeData(cnotice_Num);
	}

	@Override
	public void insertNotice(CnoticeDto dto) {
		// TODO Auto-generated method stub
		cnoticeInter.insertNotice(dto);
	}

	@Override
	public void deleteNotice(String cnotice_Num) {
		// TODO Auto-generated method stub
		cnoticeInter.deleteNotice(cnotice_Num);
	}

	@Override
	public void updateNotice(CnoticeDto dto) {
		// TODO Auto-generated method stub
		cnoticeInter.updateNotice(dto);
	}

}
