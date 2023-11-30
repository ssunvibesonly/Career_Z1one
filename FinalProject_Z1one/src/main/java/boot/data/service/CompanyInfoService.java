package boot.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.CompanyInfoDto;
import boot.data.inter.CompanyInfoServiceInter;
import boot.data.mapper.CompanyInfoMapperInter;

@Service
public class CompanyInfoService implements CompanyInfoServiceInter {

	@Autowired
	CompanyInfoMapperInter c_mapper;
	
	//추가 정보 insert
	@Override
	public void CompanyPlusInfoInsert(CompanyInfoDto dto) {
		// TODO Auto-generated method stub
		
	}

}
