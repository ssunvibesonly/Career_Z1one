package boot.data.inter;


import boot.data.dto.CompanyGaipDto;

public interface CompanyGaipServiceInter {
   
   public int getTotalCount();
   public void insertCompanyMember(CompanyGaipDto dto);
   public int getSearchCompanyId(String company_email);
   public int loginPassCheck(String company_email, String company_pass);
   public CompanyGaipDto getDataById(String company_email);
}