package boot.data.inter;

import java.util.List;

import boot.data.dto.CnoticeDto;

public interface CnoticeServiceInter {

	public List<CnoticeDto> getPassMoneyNotices(); //합격축하금 높은순
	public List<CnoticeDto> getReadCountNotices(); //조회수 높은순
	public List<CnoticeDto> getWriteDayNotices(); //등록순
	public List<CnoticeDto> getDeadLineNotices(); //마감순
	public int getTotalCount();
	public List<CnoticeDto> jobList(String [] cnotice_Job); //직종선택데이타
	public List<CnoticeDto> areaList(String cnotice_Area); //지역선택데이타
	public List<CnoticeDto> careerList(String cnotice_Career); //경력선택데이타
	public List<CnoticeDto> academicList(String cnotice_Academic); //학력선택데이타	
	
}
