package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NaverLoginController {
	
	@RequestMapping("/naver.do")
	public String naver() {
		return "naver_login";
	}
}
