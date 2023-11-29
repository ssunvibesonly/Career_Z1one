package boot.data.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.CompanyGaipDto;

@Mapper
public interface CompanyGaipMapperInter {
   public int getTotalCount();
   public void insertCompanyMember(CompanyGaipDto dto);
   public int getSearchCompanyId(String company_email);
   public int loginPassCheck(Map<String, String> map);
   public CompanyGaipDto getDataById(String company_email);
}