package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.security.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ApplyDto;
import boot.data.dto.CompanyGaipDto;
import boot.data.dto.UserGaipDto;
import boot.data.dto.User_ApplyDto;
import boot.data.inter.UserGaipServiceInter;
import boot.data.service.CompanyGaipService;
import boot.data.service.UserGaipService;
import boot.data.service.UserMyPageService;

@Controller
@RequestMapping("/member")
public class MemberController {
   
   @Autowired
   UserGaipService uservice;
   @Autowired
   CompanyGaipService cservice;
   @Autowired
   UserMyPageService umypageservice;
   
   //회원가입창
   @GetMapping("/addform")
   public String addform() 
   {
      return "/2/member/memberaddform";
   }
   
   //개인회원가입
   @PostMapping("/userinsert")
   public String userinsert(@ModelAttribute UserGaipDto dto)
   {
      uservice.insertUserMember(dto);
      
      return "redirect:/login/form";
   }
   
   //기업회원가입
   @PostMapping("/companyinsert")
   public String Companyinsert(@ModelAttribute CompanyGaipDto dto,
         @RequestParam MultipartFile Logo,
         HttpSession session)
   {
      String path=session.getServletContext().getRealPath("/membersave");
      
      String photoName="";
      if(Logo.getOriginalFilename().equals(""))
         photoName="no";
      else {
         SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
         photoName=sdf.format(new Date())+"_"+Logo.getOriginalFilename();
      
      
         try {
            Logo.transferTo(new File(path+"/"+photoName));
         } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      dto.setCompany_logo(photoName);
      cservice.insertCompanyMember(dto);
      
      return "redirect:/login/form";
   }
   
   //개인회원 아이디 중복체크
   @GetMapping("/useridcheck")
   @ResponseBody
   public Map<String, Integer> useridcheck(@RequestParam String user_email){
      
      Map<String, Integer> map=new HashMap<>();

      int n1=uservice.getSearchUserId(user_email);
      int n2=cservice.getSearchCompanyId(user_email);
      
      map.put("count", ((n1+n2)==0)?0:1);
      
      return map;
   }
   
   //기업회원 아이디 중복체크
   @GetMapping("/companyidcheck")
   @ResponseBody
   public Map<String, Integer> companyidcheck(@RequestParam String company_email){
         
      Map<String, Integer> map=new HashMap<>();
      
      int n1=cservice.getSearchCompanyId(company_email);
      int n2=uservice.getSearchUserId(company_email);
         
      map.put("count", ((n1+n2)==0)?0:1);
         
      return map;
   }
      
      
   //유저마이페이지
   @GetMapping("/userapplypage")   
   public String UserApplyPage(@RequestParam String user_num,
		   HttpSession session,Model model)
   {   
	   int applycheck=umypageservice.UserApplyCheck(user_num);
	   System.out.println(applycheck);
	   if(applycheck==1)
	   {
		   User_ApplyDto ApplyDto=umypageservice.getDataByNum(user_num);
		   String apply_name=ApplyDto.getApply_name();
		   java.sql.Timestamp apply_writeday=ApplyDto.getApply_writeday();
		   
		   model.addAttribute("apply_name", apply_name);
		   model.addAttribute("apply_writeday", apply_writeday);
		   model.addAttribute("user_num", user_num);
	   }
	   
	   return "/2/member/userapplypage";
   }
   
   //이력서등록창
   @GetMapping("/applyaddform")
   public String Applyaddform(@RequestParam String user_num,
		   Model model)
   {
	   model.addAttribute("user_num", user_num);
	   
	   return "/2/member/userapplyaddform";
   }
   
   //이력서 등록하기
   @PostMapping("/applyinsert")
   public String Applyinsert(@RequestParam String user_num,@ModelAttribute User_ApplyDto dto,
		   Model model)
   {  
	   String apply_name=dto.getApply_name();
	   java.sql.Timestamp apply_writeday=dto.getApply_writeday();
      
	   umypageservice.insertUserApply(dto);
	   
      return "redirect:userapplypage?user_num="+user_num;
   }
}


   
