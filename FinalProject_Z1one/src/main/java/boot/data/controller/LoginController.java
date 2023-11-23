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

@Controller
@RequestMapping("/login")
public class LoginController {

   @Autowired
   UserGaipService uservice;
   @Autowired
   CompanyGaipService cservice;
   
   @GetMapping("/form")
   public String loginform(HttpSession session,Model model) 
   {
      String myid=(String)session.getAttribute("myid");
      String loginok=(String)session.getAttribute("loginok");
      
      if(loginok==null)
         return "/2/login/loginform";
      else {
         return "/login/loginsuccess";
      }
   }
   
   @PostMapping("/loginaction")
   public String loginaction(@RequestParam String email,
         @RequestParam String pass,
         @RequestParam(required = false) String cbsave,
         HttpSession session) 
   {
      Map<String, String> map=new HashMap<>();
      
      int usercheck=uservice.loginPassCheck(email, pass);
      int companycheck=cservice.loginPassCheck(email, pass);
      
      if(usercheck==1)
      {
         session.setMaxInactiveInterval(60*60*8);
         session.setAttribute("myid", email);
         session.setAttribute("loginok", "yes");
         session.setAttribute("saveok", cbsave);
         
         UserGaipDto udto=uservice.getDataById(email);
         String uname=udto.getUser_email();
         System.out.println(uname);
         
         session.setAttribute("uname", uname);
         
         return "redirect:/";
         
      }else if(companycheck==1)
      {
         session.setMaxInactiveInterval(60*60*8);
         session.setAttribute("myid", email);
         session.setAttribute("loginok", "yes");
         session.setAttribute("saveok", cbsave);
         
         CompanyGaipDto cdto=cservice.getDataById(email);
         
         return "/login/loginsuccess";
      }else      
      return "/login/passfail";
   }
   
   @GetMapping("/logoutaction")
   public String logoutaction(HttpSession session)
   {
      session.removeAttribute("loginok");
      
      return "redirect:/login/form";
   }
}