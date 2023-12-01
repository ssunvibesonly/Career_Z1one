package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.CompanyGaipDto;
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
		c_mapper.CompanyPlusInfoInsert(dto);
	}

	//1차에서 등록된 최대 company_num 불러오기
	@Override
	public int CompanyInfoMaxNum() {
		// TODO Auto-generated method stub
		return c_mapper.CompanyInfoMaxNum();
	}

	@Override
	public List<CompanyInfoDto> CompanyJoinSelect1(int company_num) {
		// TODO Auto-generated method stub
		return c_mapper.CompanyJoinSelect1(company_num);
	}




}
