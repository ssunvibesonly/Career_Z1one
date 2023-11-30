package boot.data.mapper;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.CompanyInfoDto;

@Mapper
public interface CompanyInfoMapperInter {
	public void CompanyPlusInfoInsert(CompanyInfoDto dto);
}
