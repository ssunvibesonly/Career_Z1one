package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.CompanyGaipDto;
import boot.data.dto.UserGaipDto;
import boot.data.service.CompanyGaipService;
import boot.data.service.SocialService;
import boot.data.service.UserGaipService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/login")
public class LoginController {

   @Autowired
   UserGaipService uservice;
   @Autowired
   CompanyGaipService cservice;
   @Autowired
   SocialService socialService;


   @GetMapping("/kakao")
   public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession httpSession, UserGaipDto userGaipDto) throws Exception {
      System.out.println("카카오 코드 : " + code);
      String access_Token = socialService.getAccessToekn(code);
      System.out.println("카카오 토큰 : " + access_Token);

      return "redirect:/";
   }

   @GetMapping("/kakaLogout")
   public String kakaLogout(HttpSession httpSession) {
      String access_token = (String)httpSession.getAttribute("access_token");

      Map<String, String> map = new HashMap<String, String>();
      map.put("Authorization", "Bearer "+access_token);

      if(access_token != null && !"".equals(access_token)) {
         socialService.kakaoLogout(access_token);
         httpSession.invalidate();
      }
      if(access_token==null) {
         System.out.println("access_token is null");
      }
      return "/";
   }
   /*현규*/
   @GetMapping("/form")
   public String loginform(HttpSession session,Model model,
         @RequestParam(required = false,defaultValue = "no") String community,
         @RequestParam(required = false,defaultValue = "0") String boardnum) 
   {
      String myid=(String)session.getAttribute("myid");
      String loginok=(String)session.getAttribute("loginok");
      String user_num=(String)session.getAttribute("user_num");
      System.out.println(community+","+boardnum);
      if(loginok==null && !community.equals("yes"))
         return "/2/login/loginform";
      else if(loginok==null && community.equals("yes")){
         System.out.println(boardnum);
         model.addAttribute("community", community);
         model.addAttribute("boardnum", boardnum);
         return "/2/login/loginform";
      }else{
         return "/login/loginsuccess";
      }
   }

   
   @PostMapping("/loginaction")
   public String loginaction(@RequestParam String email,
         @RequestParam String pass,
         @RequestParam(required = false) String cbsave,
         HttpSession session,
         @RequestParam(required = false,defaultValue = "no") String community,
         @RequestParam(required = false,defaultValue = "0") String boardnum) 
   {
      Map<String, String> map=new HashMap<>();
      
      int usercheck=uservice.loginPassCheck(email, pass);
      int companycheck=cservice.loginPassCheck(email, pass);
      
      if(usercheck==1 && !community.equals("yes"))
      {
         session.setMaxInactiveInterval(60*60*8);
         session.setAttribute("myid", email);
         session.setAttribute("loginok", "yes");
         session.setAttribute("saveok", cbsave);
         
         UserGaipDto udto=uservice.getDataById(email);
         String uname=udto.getUser_email();
         session.setAttribute("uname", uname);
         String user_num=udto.getUser_num();
         session.setAttribute("user_num", user_num);
         String user_name=udto.getUser_name();
         session.setAttribute("user_name", user_name);
         
         return "redirect:/";
         
      }else if(usercheck==1 && community.equals("yes")) {
    	  System.out.println(boardnum+"!!!!");
    	  session.setMaxInactiveInterval(60*60*8);
          session.setAttribute("myid", email);
          session.setAttribute("loginok", "yes");
          session.setAttribute("saveok", cbsave);
          
          UserGaipDto udto=uservice.getDataById(email);
          String uname=udto.getUser_email();
          System.out.println(uname);
          
          session.setAttribute("uname", uname);
          //model.addAttribute("board_num", boardnum);
          return "redirect:/community/content?board_num="+boardnum;
      }else if(companycheck==1)
      {
         session.setMaxInactiveInterval(60*60*8);
         session.setAttribute("myid", email);
         session.setAttribute("companyloginok", "yes");
         session.setAttribute("saveok", cbsave);
         
         CompanyGaipDto cdto=cservice.getDataById(email);
         int company_num=cdto.getCompany_num();
         session.setAttribute("company_num", company_num);
         String company_name=cdto.getCompany_name();
         session.setAttribute("company_name", company_name);
         
         return "/login/loginsuccess";
      }else      
      return "/login/passfail";
   }
   
   @GetMapping("/logoutaction")
   public String logoutaction(HttpSession session)
   {
      session.removeAttribute("loginok");
      session.removeAttribute("companyloginok");
      
      return "redirect:/login/form";
   }
   
   @RequestMapping("/naver.do")
	public String naver() {
		return "naver_login";
	}
   
}