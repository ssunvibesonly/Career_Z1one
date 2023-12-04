package boot.data.inter;

import java.util.List;

import boot.data.dto.CnoticeDto;
import boot.data.dto.Company_DetailDto;

public interface CnoticeServiceInter {
	// 세부분류리스트
	public List<CnoticeDto> testList(String[] industry, String[] career, String[] location, String gradeLeft,
			String gradeRight, String[] type, String[] academy, String orderBy);
	// 조회수순리스트
	public List<CnoticeDto> readCountList(); 
	// 디테일페이지
	public CnoticeDto getNoticeData(int cnotice_num); 
	//공고 추가
	public void insertNotice(CnoticeDto dto); 
	//공고 삭제
	public void deleteNotice(int cnotice_num); 
	//공고 수정
	public void updateNotice(CnoticeDto dto); 
	// cdetail
	//public List<Company_DetailDto> detailList(int company_num);
}
