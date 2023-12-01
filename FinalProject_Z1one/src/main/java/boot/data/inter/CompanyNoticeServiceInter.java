package boot.data.inter;

import java.util.List;

import boot.data.dto.CompanyNoticeDto;

public interface CompanyNoticeServiceInter {
	//기업 로그인 후 정보게시 버튼 눌렀을 때 insert
	public void CompanyNoticeInsert(CompanyNoticeDto dto);
	//기업 정보 게시 List
	public List<CompanyNoticeDto> CompanyNoticegetAllData();
	//기업 리뷰 클릭 시 getdata
	public CompanyNoticeDto CompanyInfoGetData(int cn_idx);
}
