package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.CompanyNoticeDto;
import boot.data.inter.CompanyNoticeServiceInter;
import boot.data.mapper.CompanyNoticeMapperInter;

@Service
public class CompanyNoticeService implements CompanyNoticeServiceInter {

	@Autowired
	CompanyNoticeMapperInter cnmapper;
	
	@Override
	public void CompanyNoticeInsert(CompanyNoticeDto dto) {
		// TODO Auto-generated method stub
		cnmapper.CompanyNoticeInsert(dto);
	}

	@Override
	public List<CompanyNoticeDto> CompanyNoticegetAllData() {
		// TODO Auto-generated method stub
		return cnmapper.CompanyNoticegetAllData();
	}

}
