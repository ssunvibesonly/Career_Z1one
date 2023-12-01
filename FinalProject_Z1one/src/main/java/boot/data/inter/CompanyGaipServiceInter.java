package boot.data.inter;


import java.util.List;

import boot.data.dto.CompanyGaipDto;
import boot.data.dto.CompanyInfoDto;

public interface CompanyGaipServiceInter {
   
   public int getTotalCount();
   public void insertCompanyMember(CompanyGaipDto dto);
   public int getSearchCompanyId(String company_email);
   public int loginPassCheck(String company_email, String company_pass);
   public CompanyGaipDto getDataById(String company_email);
   public List<CompanyGaipDto> CompanyJoinSelect2(int company_num);
}