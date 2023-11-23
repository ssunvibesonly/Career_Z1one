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
   public int getSearchCompanyId(String Company_Email) {
      // TODO Auto-generated method stub
      return cgaipinter.getSearchCompanyId(Company_Email);
   }

   @Override
   public int loginPassCheck(String Company_Email, String Company_Pass) {
      // TODO Auto-generated method stub
      Map<String, String> map=new HashMap<>();
      map.put("Company_Email", Company_Email);
      map.put("Company_Pass", Company_Pass);
      
      return cgaipinter.loginPassCheck(map);
   }

   @Override
   public CompanyGaipDto getDataById(String Company_Email) {
      // TODO Auto-generated method stub
      return cgaipinter.getDataById(Company_Email);
   }

}