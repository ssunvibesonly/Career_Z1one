package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.CompanyNoticeDto;
import boot.data.service.CompanyNoticeService;

@Controller
@RequestMapping("/company")
public class CompanyReviewController {

	@Autowired
	CompanyNoticeService cn_service;
	
	@GetMapping("/info")
	public String companyInfoMain(Model model,CompanyNoticeDto dto) {
		
		
		List<CompanyNoticeDto> cnInfoList=cn_service.CompanyNoticegetAllData();
		
		model.addAttribute("cnInfoList", cnInfoList);
		
		return "/2/company/companyinfo";
	}
	
	@GetMapping("/review")
	public String companyReview(@RequestParam int cn_idx,Model model) {
		
		CompanyNoticeDto cndto=cn_service.CompanyInfoGetData(cn_idx);
		
		model.addAttribute("cndto", cndto);
		
		return "/2/company/companyreview";
	}
	
}
