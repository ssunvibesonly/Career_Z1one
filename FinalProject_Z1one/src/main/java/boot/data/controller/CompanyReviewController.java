package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyReviewController {

	@GetMapping("/company/review")
	public String reviewMain() {
		return "/2/company/companyreview";
	}
}
