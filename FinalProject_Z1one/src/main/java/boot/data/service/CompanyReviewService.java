package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.Company_ReiviewDto;
import boot.data.inter.CompanyReivewServiceInter;
import boot.data.mapper.CompanyReviewMapper;

@Service
public class CompanyReviewService implements CompanyReivewServiceInter {

	@Autowired
	CompanyReviewMapper crmapper;
	
	@Override
	public void ReviewInsert(Company_ReiviewDto dto) {
		// TODO Auto-generated method stub
		crmapper.ReviewInsert(dto);
	}

	@Override
	public List<Company_ReiviewDto> readOneAllReview(int cn_idx) {
		// TODO Auto-generated method stub
		return crmapper.readOneAllReview(cn_idx);
	}

}
