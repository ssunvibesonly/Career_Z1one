package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.CompanyGaipDto;
import boot.data.dto.CompanyInfoDto;

@Mapper
public interface CompanyInfoMapperInter {
	public void CompanyPlusInfoInsert(CompanyInfoDto dto);
	public int CompanyInfoMaxNum();
	public List<CompanyInfoDto> CompanyJoinSelect1(int company_num); //기업 회원가입 정보+2차정보 
}
