package boot.data.inter;

import java.util.List;

import boot.data.dto.CompanyGaipDto;
import boot.data.dto.CompanyInfoDto;

public interface CompanyInfoServiceInter {
	public void CompanyPlusInfoInsert(CompanyInfoDto dto);
	public int CompanyInfoMaxNum();
	public List<CompanyInfoDto> CompanyJoinSelect1(int company_num);
}
