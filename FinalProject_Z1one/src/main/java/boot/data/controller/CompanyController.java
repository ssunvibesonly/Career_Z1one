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
		// System.out.println(gradeLeft+","+gradeRight);

		return nservice.testList(industry, career, location, gradeLeft, gradeRight, type, academy, orderBy);
	}

	// 공고추가폼
	@GetMapping("/addForm")
	public String addForm() {
		return "/company/addNotice";
	}

	/*
	 * @PostMapping("/insert") public String insertNotice(@ModelAttribute CnoticeDto
	 * dto,@RequestParam String cnotice_Area1,
	 * 
	 * @RequestParam String cnotice_Area2,@RequestParam String cnotice_Career1,
	 * 
	 * @RequestParam(required = false) String cnotice_Career2,MultipartFile myImg,
	 * 
	 * @RequestParam int cnotice_Pay, HttpSession session) { //업로드할 경로 //업로드 경로구하기
	 * String path=session.getServletContext().getRealPath("/noticeImg");
	 * SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//시분초까지 표시하므로 이름이
	 * 겹칠일이없음 System.out.println(path);
	 * 
	 * //사진명 구해서 넣기 String fileName=sdf.format(new
	 * Date())+myImg.getOriginalFilename();
	 * 
	 * dto.setCnotice_Image(fileName);
	 * 
	 * //업로드 try { myImg.transferTo(new File(path+"/"+fileName)); } catch
	 * (IllegalStateException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); }
	 * 
	 * String cnotice_Area=cnotice_Area1+" "+cnotice_Area2;
	 * dto.setCnotice_Area(cnotice_Area);
	 * 
	 * String cnotice_Career;
	 * 
	 * if (cnotice_Career1.equals("경력")) { cnotice_Career =
	 * cnotice_Career1+cnotice_Career2; dto.setCnotice_Career(cnotice_Career); }
	 * else { dto.setCnotice_Career(cnotice_Career1); }
	 * 
	 * if (cnotice_Pay==0) { dto.setCnotice_Pay(Integer.parseInt("연봉 협상")); } else {
	 * dto.setCnotice_Pay(cnotice_Pay); }
	 * 
	 * nservice.insertNotice(dto);
	 * 
	 * return "redirect:list"; }
	 */

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
