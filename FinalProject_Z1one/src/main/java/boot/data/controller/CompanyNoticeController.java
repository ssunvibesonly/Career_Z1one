package boot.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import boot.data.dto.CompanyNoticeDto;
import boot.data.service.CompanyNoticeService;

@Controller
@RequestMapping("/company")
public class CompanyNoticeController {
	
	@Autowired
	CompanyNoticeService cnservice;
	
	@PostMapping("/companyUpload")
	public String companyNoticeInsert(@ModelAttribute CompanyNoticeDto dto) {
		cnservice.CompanyNoticeInsert(dto);
		
		return "redirect:info";
	}
	
}
