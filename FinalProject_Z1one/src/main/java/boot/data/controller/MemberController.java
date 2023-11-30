package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.security.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ApplyDto;
import boot.data.dto.CompanyGaipDto;
import boot.data.dto.UserGaipDto;
import boot.data.dto.User_ActiveDto;
import boot.data.dto.User_ApplyDto;
import boot.data.dto.User_CareerDto;
import boot.data.dto.User_EducationDto;
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


	// 회원가입창
	@GetMapping("/addform")
	public String addform() {
		return "/2/member/memberaddform";
	}

	// 개인회원가입
	@PostMapping("/userinsert")
	public String userinsert(@ModelAttribute UserGaipDto dto) {
		uservice.insertUserMember(dto);

		return "redirect:/login/form";
	}

	// 기업회원가입
	@PostMapping("/companyinsert")
	public String Companyinsert(@ModelAttribute CompanyGaipDto dto, @RequestParam MultipartFile Logo,
			HttpSession session) {
		String path = session.getServletContext().getRealPath("/membersave");

		String photoName = "";
		if (Logo.getOriginalFilename().equals(""))
			photoName = "no";
		else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			photoName = sdf.format(new Date()) + "_" + Logo.getOriginalFilename();

			try {
				Logo.transferTo(new File(path + "/" + photoName));
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

	// 개인회원 아이디 중복체크
	@GetMapping("/useridcheck")
	@ResponseBody
	public Map<String, Integer> useridcheck(@RequestParam String user_email) {

		Map<String, Integer> map = new HashMap<>();

		int n1 = uservice.getSearchUserId(user_email);
		int n2 = cservice.getSearchCompanyId(user_email);

		map.put("count", ((n1 + n2) == 0) ? 0 : 1);

		return map;
	}

	// 기업회원 아이디 중복체크
	@GetMapping("/companyidcheck")
	@ResponseBody
	public Map<String, Integer> companyidcheck(@RequestParam String company_email) {

		Map<String, Integer> map = new HashMap<>();

		int n1 = cservice.getSearchCompanyId(company_email);
		int n2 = uservice.getSearchUserId(company_email);

		map.put("count", ((n1 + n2) == 0) ? 0 : 1);

		return map;
	}

	// 유저마이페이지
	@GetMapping("/userapplypage")
	public String UserApplyPage(@RequestParam String user_num, HttpSession session, Model model) {
		int applycheck = umypageservice.UserApplyCheck(user_num);
		System.out.println(applycheck);
		if (applycheck == 1) {
			User_ApplyDto ApplyDto = umypageservice.getDataByNum(user_num);
			String apply_name = ApplyDto.getApply_name();
			java.sql.Timestamp apply_writeday = ApplyDto.getApply_writeday();

			model.addAttribute("apply_name", apply_name);
			model.addAttribute("apply_writeday", apply_writeday);
			model.addAttribute("user_num", user_num);
		}

		return "/2/member/userapplypage";
	}

	// 이력서등록창
	@GetMapping("/applyaddform")
	public String Applyaddform(@RequestParam String user_num, Model model) {
		model.addAttribute("user_num", user_num);

		return "/2/member/userapplyaddform";
	}

	// 이력서 등록하기
	@PostMapping("/applyinsert")
	public String Applyinsert(@RequestParam String user_num, 
			@ModelAttribute User_ApplyDto applydto,
			@ModelAttribute User_CareerDto careerdto, 
			@ModelAttribute User_EducationDto edudto,
			@ModelAttribute User_ActiveDto actdto, 
			Model model, 
			@RequestParam MultipartFile userphoto,
			@RequestParam String apply_addr1, 
			@RequestParam String apply_addr2, 
			@RequestParam String career_duration1,
			@RequestParam(defaultValue = " ") String career_duration2, 
			@RequestParam String education_duration1,
			@RequestParam(defaultValue = " ") String education_duration2, 
			@RequestParam String education_score,
			@RequestParam String education_scoreMax, 
			HttpSession session) 
	{
		String apply_name = applydto.getApply_name();
		java.sql.Timestamp apply_writeday = applydto.getApply_writeday();

		String path = session.getServletContext().getRealPath("/applyphoto");

		String photoName = "";
		if (userphoto.getOriginalFilename().equals("")) {
			photoName = "no";
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			photoName = sdf.format(new Date()) + "_" + user_num + "_" + userphoto.getOriginalFilename();

			try {
				userphoto.transferTo(new File(path + "/" + photoName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		applydto.setApply_photo(photoName);
		applydto.setApply_addr(apply_addr1 + "/" + apply_addr2);
		careerdto.setCareer_duration(career_duration1 + "~" + career_duration2);
		edudto.setEducation_duration(education_duration1 + "~" + education_duration2);
		edudto.setEducation_score(education_score + "/" + education_scoreMax);

		umypageservice.insertUserApply(applydto);
		umypageservice.insertUserCareer(careerdto);
		umypageservice.insertUserSchool(edudto);
		umypageservice.insertUserActive(actdto);

		return "redirect:userapplypage?user_num=" + user_num;
	}

	@GetMapping("/applyupdateform")
	public ModelAndView ApplyUpdateform(@RequestParam String user_num) {
		ModelAndView model = new ModelAndView();

		User_ApplyDto applydto = umypageservice.getDataByNum(user_num);
		User_CareerDto careerdto = umypageservice.getCareerDataByNum(user_num);
		User_EducationDto edudto = umypageservice.getEducationDataByNum(user_num);
		User_ActiveDto actdto = umypageservice.getActiveDataByNum(user_num);

		String career_duration = careerdto.getCareer_duration();
		StringTokenizer st1 = new StringTokenizer(career_duration, "~");
		String career_duration1 = st1.nextToken();
		String career_duration2 = st1.nextToken("~");

		
		String education_duration=edudto.getEducation_duration(); StringTokenizer
		st2=new StringTokenizer(education_duration,"~"); String
		education_duration1=st2.nextToken(); String
		education_duration2=st2.nextToken("~");
		 

		String education_score = edudto.getEducation_score();
		StringTokenizer st3 = new StringTokenizer(education_score, "/");
		String education_score1 = st3.nextToken();
		String education_score2 = st3.nextToken("/");
		
		String apply_addr = applydto.getApply_addr();
		StringTokenizer st4 = new StringTokenizer(apply_addr, "/");
		String apply_addr1 = st4.nextToken();
		String apply_addr2 = st4.nextToken("/");

		model.addObject("applydto", applydto);
		model.addObject("careerdto", careerdto);
		model.addObject("edudto", edudto);
		model.addObject("actdto", actdto);
		model.addObject("career_duration1", career_duration1);
		model.addObject("career_duration2", career_duration2);
		model.addObject("education_duration1", education_duration1);
		model.addObject("education_duration2", education_duration2);

		model.addObject("education_score1", education_score1);
		model.addObject("education_score2", education_score2);
		model.addObject("apply_addr1", apply_addr1);
		model.addObject("apply_addr2", apply_addr2);

		model.setViewName("/2/member/userapplyupdateform");

		return model;
	}
	
	@PostMapping("applyupdate")
	public String ApplyUpdate(@RequestParam String user_num,
			@ModelAttribute User_ApplyDto applydto,
			@ModelAttribute User_CareerDto careerdto, 
			@ModelAttribute User_EducationDto edudto,
			@ModelAttribute User_ActiveDto actdto,
			@RequestParam MultipartFile userphoto, 
			HttpSession session,
			@RequestParam String apply_addr1,
			@RequestParam String apply_addr2,
			@RequestParam String career_duration1,
			@RequestParam (defaultValue = "ing")String career_duration2,
			@RequestParam String education_duration1,
			@RequestParam(defaultValue = "ing") String education_duration2,
			@RequestParam String education_score,	
			@ModelAttribute("apply_gender") String apply_gender,
			@ModelAttribute("education_scoreMax") String education_scoreMax,
			@RequestParam String apply_newcomer,
			@RequestParam String apply_primary,
			@RequestParam String career_position,
			@RequestParam String education_degree)
	{
		String path = session.getServletContext().getRealPath("/applyphoto");

		String photoName = "";
		if (userphoto.getOriginalFilename().equals(applydto.getApply_photo())) {
			photoName = applydto.getApply_photo()+ "_" + user_num + "_" +applydto.getApply_photo();
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			photoName = sdf.format(new Date()) + "_" + user_num + "_" + userphoto.getOriginalFilename();

			try {
				userphoto.transferTo(new File(path + "/" + photoName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		applydto.setApply_photo(photoName);
		careerdto.setCareer_duration(career_duration1+"~"+career_duration2);
		edudto.setEducation_duration(education_duration1+"~"+education_duration2);
		edudto.setEducation_score(education_score+"/"+education_scoreMax);
		applydto.setApply_addr(apply_addr1+"/"+apply_addr2);
		applydto.setApply_gender(apply_gender);
		applydto.setApply_newcomer(apply_newcomer);
		applydto.setApply_primary(apply_primary);
		careerdto.setCareer_position(career_position);
		edudto.setEducation_degree(education_degree);
		
		umypageservice.UpdateUserApply(applydto);
		umypageservice.UpdateUserCareer(careerdto);
		umypageservice.UpdateUserSchool(edudto);
		umypageservice.UpdateUserActive(actdto);
		
		return "redirect:userapplypage?user_num=" + user_num;
	}
	
	@GetMapping("/deleteapply")
	@ResponseBody
	public void deleteapply(@RequestParam String user_num)
	{
		umypageservice.DeleteUserApply(user_num);
		umypageservice.DeleteUserCareer(user_num);
		umypageservice.DeleteUserSchool(user_num);
		umypageservice.DeleteUserActive(user_num);
}
   //기업마이페이지 연결 테스트
   @GetMapping("/companymypage")
   public String companyMyPage() {
	   
	   return "/2/member/companyinsert";

   }
   @PostMapping("/plusinsert")
   public ModelAndView companyPlusInsert() {
	   
	   ModelAndView model=new ModelAndView();
	   
	   return model;
   }

}
