package boot.data.inter;


import boot.data.dto.CompanyGaipDto;

public interface CompanyGaipServiceInter {
   
   public int getTotalCount();
   public void insertCompanyMember(CompanyGaipDto dto);
   public int getSearchCompanyId(String Company_Email);
   public int loginPassCheck(String Company_Email, String Company_Pass);
   public CompanyGaipDto getDataById(String Company_Email);
}