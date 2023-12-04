package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import boot.data.dto.CnoticeDto;
import boot.data.dto.Company_DetailDto;
import boot.data.dto.RecruitDto;
import boot.data.service.CnoticeSerivce;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	CnoticeSerivce nservice;

	// 채용공고
	@GetMapping("/ban")
	public ModelAndView detail() {
		ModelAndView model = new ModelAndView();

		model.setViewName("/2/company/notice");

		return model;
	}

// 직종세부분류
	@ResponseBody
	@GetMapping("/testList")
	public List<CnoticeDto> testList(@RequestParam(required = false) String[] industry,
			@RequestParam(required = false) String[] career, @RequestParam(required = false) String[] location,
			@RequestParam(required = false) String gradeLeft, @RequestParam(required = false) String gradeRight,
			@RequestParam(required = false) String[] type, @RequestParam(required = false) String[] academy,
			@RequestParam(required = false) String orderBy) {

		return nservice.testList(industry, career, location, gradeLeft, gradeRight, type, academy, orderBy);
	}

	// 공고추가폼
	@GetMapping("/addNoticeForm")
	public ModelAndView addNoticeForm(HttpSession session) {

		ModelAndView model = new ModelAndView();

		int company_num = (int) session.getAttribute("company_num");

		String company_name = (String) session.getAttribute("company_name");

		//int r_step = 1;

		/*
		 * RecruitDto dto=nservice.getRecruitData(company_num, r_step, company_name);
		 * 
		 * model.addObject("r_title", dto.getR_title()); model.addObject("deadline",
		 * dto.getDeadlineday());
		 */
		
		model.addObject("company_num", company_num);
		model.addObject("company_name", company_name);

		model.setViewName("/company/addNotice");
		return model;

	}
	

	@PostMapping("/noticeInsert")
	public String insertNotice(@ModelAttribute CnoticeDto dto, 
			@RequestParam String cnotice_location1,@RequestParam String cnotice_location2,  
			MultipartFile myImg,HttpSession session,Model model) {

		//업로드 경로구하기
		String path=session.getServletContext().getRealPath("/noticeImg");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//시분초까지 표시하므로 이름이 겹칠일이없음
		System.out.println(path);

			//사진명 구해서 넣기
			String fileName=sdf.format(new Date())+myImg.getOriginalFilename();

			dto.setCnotice_image(fileName);
					
			//업로드
			try {
				myImg.transferTo(new File(path+"/"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		int company_num = (int) session.getAttribute("company_num");
		dto.setCompany_num(company_num);
		
		String company_name = (String) session.getAttribute("company_name");
		dto.setCnotice_companyname(company_name);
			
		String cnotice_location = cnotice_location1 + " " + cnotice_location2;
		dto.setCnotice_location(cnotice_location);

		String cnotice_career;		

		nservice.insertNotice(dto);

		model.addAttribute("cnotice_num", nservice.getMaxNum());
		System.out.println(nservice.getMaxNum()+"!!!!!!!!!!!!!!!!!!");
		
		
		return "redirect:addDetailForm?cnotice_num="+nservice.getMaxNum()+"&company_num="+company_num;
	}
	
	//상세정보추가폼
		@GetMapping("/addDetailForm")
		public ModelAndView addDetailForm(HttpSession session,@RequestParam int cnotice_num) {

			ModelAndView model = new ModelAndView();

			int company_num = (int) session.getAttribute("company_num");

			String company_name = (String) session.getAttribute("company_name");
			
			model.addObject("company_num", company_num);
			model.addObject("company_name", company_name);
			model.addObject("cnotice_num", cnotice_num);
			//model.addObject("cnotice_noticename", cnotice_noticename);
			model.addObject("cnotice_num", cnotice_num);
			model.setViewName("/company/addDetail");
			return model;

		}
	
		@PostMapping("/detailInsert")
		public String insertNotice(@ModelAttribute Company_DetailDto dto,HttpSession session,Model model) {

				

				int company_num = (int) session.getAttribute("company_num");

				dto.setCompany_num(company_num);
				
				dto.getCnotice_num();
				
				
			nservice.insertDetail(dto);

			return "/company/notice";
		}

	// 디테일페이지
	@GetMapping("/detail")
	public ModelAndView detailPage(@RequestParam int cnotice_num) {
		ModelAndView model = new ModelAndView();

		CnoticeDto dto = nservice.getNoticeData(cnotice_num);

		model.addObject("dto", dto);

		model.setViewName("/company/detailPage");

		return model;
	}

}
