package boot.data.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.CompanyGaipDto;
import boot.data.inter.CompanyGaipServiceInter;
import boot.data.mapper.CompanyGaipMapperInter;

@Service
public class CompanyGaipService implements CompanyGaipServiceInter {

   @Autowired
   CompanyGaipMapperInter cgaipinter;
   
   @Override
   public int getTotalCount() {
      // TODO Auto-generated method stub
      return cgaipinter.getTotalCount();
   }

   @Override
   public void insertCompanyMember(CompanyGaipDto dto) {
      // TODO Auto-generated method stub
      cgaipinter.insertCompanyMember(dto);
   }

   @Override
   public int getSearchCompanyId(String company_email) {
      // TODO Auto-generated method stub
      return cgaipinter.getSearchCompanyId(company_email);
   }

   @Override
   public int loginPassCheck(String company_email, String company_pass) {
      // TODO Auto-generated method stub
      Map<String, String> map=new HashMap<>();
      map.put("company_email", company_email);
      map.put("company_pass", company_pass);
      
      return cgaipinter.loginPassCheck(map);
   }

   @Override
   public CompanyGaipDto getDataById(String company_email) {
      // TODO Auto-generated method stub
      return cgaipinter.getDataById(company_email);
   }

}