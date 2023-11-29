package boot.data.inter;

import java.util.List;
import boot.data.dto.CnoticeDto;

public interface CnoticeServiceInter {
	public int getTotalCount();
	public List<CnoticeDto> allList(String[] cnotice_Job_List,String[] cnotice_Area_List,
			String[] cnotice_Career_List,String[] cnotice_Academic_List,String orderBy); //세부분류 리스트
	public CnoticeDto getNoticeData(String cnotice_Num); //디테일페이지
	public void insertNotice(CnoticeDto dto); //공고 추가
	public void deleteNotice(String cnotice_Num); //공고 삭제
	public void updateNotice(CnoticeDto dto); //공고 수정
}
