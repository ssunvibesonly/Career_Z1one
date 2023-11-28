package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.CompanyGaipDto;
import boot.data.dto.UserGaipDto;
import boot.data.service.CompanyGaipService;
import boot.data.service.UserGaipService;
import boot.data.service.UserMyPageService;

@Controller
@RequestMapping("/login")
public class LoginController {

   @Autowired
   UserGaipService uservice;
   @Autowired
   CompanyGaipService cservice;
   @Autowired
   UserMyPageService umypageservice;
   
   @GetMapping("/form")
   public String loginform(HttpSession session,Model model,
		   @RequestParam(required = false,defaultValue = "no") String community,
		   @RequestParam(required = false,defaultValue = "0") String boardnum) 
   {
      String myid=(String)session.getAttribute("myid");
      String loginok=(String)session.getAttribute("loginok");
      String user_num=(String)session.getAttribute("user_num");
      
      if(loginok==null)
         return "/2/login/loginform";
      else if(loginok!=null && !community.equals("yes")){
    	  model.addAttribute("community", community);
          model.addAttribute("boardnum", boardnum);
    	  return "/login/loginsuccess";
      }else {
    	  return "/community/content?board_num="+boardnum;
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
           return "redirect:/community/content?board_num="+boardnum;
       }
      else if(companycheck==1)
      {
         session.setMaxInactiveInterval(60*60*8);
         session.setAttribute("myid", email);
         session.setAttribute("loginok", "yes");
         session.setAttribute("saveok", cbsave);
         
         CompanyGaipDto cdto=cservice.getDataById(email);
         
         return "redirect:/";
      }else      
      return "/login/passfail";
   }
   
   @GetMapping("/logoutaction")
   public String logoutaction(HttpSession session)
   {
	  session.removeAttribute("user_num");
	  session.removeAttribute("user_name");
      session.removeAttribute("loginok");
      session.removeAttribute("myid");
      
      return "redirect:/";
   }
}