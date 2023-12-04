package boot.data.inter;

import java.util.List;

import boot.data.dto.Company_ReiviewDto;

public interface CompanyReivewServiceInter {
	public void ReviewInsert(Company_ReiviewDto dto);
	public List<Company_ReiviewDto> readOneAllReview(int cn_idx);
	public double SumCompanyReview(int cn_idx);
}
