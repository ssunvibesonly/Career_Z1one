package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.CompanyNoticeDto;

@Mapper
public interface CompanyNoticeMapperInter {
	public void CompanyNoticeInsert(CompanyNoticeDto dto);
	public List<CompanyNoticeDto> CompanyNoticegetAllData();
}
