package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.data.dto.CompanyNoticeDto;
import boot.data.dto.Company_ReiviewDto;
import boot.data.service.CompanyNoticeService;
import boot.data.service.CompanyReviewService;

@Controller
@RequestMapping("/company")
public class CompanyReviewController {

	@Autowired
	CompanyNoticeService cn_service;
	@Autowired
	CompanyReviewService cr_service;
	
	@GetMapping("/info")
	public String companyInfoMain(Model model,CompanyNoticeDto dto) {
		
		
		List<CompanyNoticeDto> cnInfoList=cn_service.CompanyNoticegetAllData();
		
		model.addAttribute("cnInfoList", cnInfoList);
		
		return "/2/company/companyinfo";
	}
	
	@GetMapping("/review")
	public String companyReview(@RequestParam int cn_idx,Model model) {
		
		CompanyNoticeDto cndto=cn_service.CompanyInfoGetData(cn_idx);
		
		model.addAttribute("cn_idx", cn_idx);
		model.addAttribute("cndto", cndto);
		
		
		return "/2/company/companyreview";
	}
	@PostMapping("/reviewupload")
	@ResponseBody
	public void ReviewInsert(@ModelAttribute Company_ReiviewDto dto) {
		
		cr_service.ReviewInsert(dto);
		
		//System.out.println(dto.getReview_title());
		
	}
	
	@PostMapping("/readReview")
	@ResponseBody
	public List<Company_ReiviewDto> readReview(int cn_idx){
		/* System.out.println("cn_idx:"+cn_idx); */
		
		List<Company_ReiviewDto> reviewList=cr_service.readOneAllReview(cn_idx);
		/* System.out.println("list size = "+reviewList.size()); */
		
				
		return reviewList;
	}
	
	@GetMapping("/sumStar")
	@ResponseBody
	public double sumStar(int cn_idx) {
		
		List<Company_ReiviewDto> reviewList=cr_service.readOneAllReview(cn_idx);
		int listSize=reviewList.size();
		
		double sumStar=cr_service.SumCompanyReview(cn_idx);
		double avgStar=Math.round(sumStar/listSize*100.0)/100.0;
		
		return avgStar;
	}
	
}
