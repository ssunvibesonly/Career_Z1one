package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.Company_ReiviewDto;

@Mapper
public interface CompanyReviewMapper {
	//리뷰 insert
	public void ReviewInsert(Company_ReiviewDto dto);
	public List<Company_ReiviewDto> readOneAllReview(int cn_idx);
}
