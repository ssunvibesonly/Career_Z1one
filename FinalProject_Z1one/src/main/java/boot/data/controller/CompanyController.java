package boot.data.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.CnoticeDto;
import boot.data.service.CnoticeSerivce;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	CnoticeSerivce nservice;
	
	//채용공고~
	@GetMapping("/ban")
	public ModelAndView detail()
	{
		ModelAndView model=new ModelAndView();

		int totalcount=nservice.getTotalCount();

		model.addObject("totalcount", totalcount);
		
		model.setViewName("/2/company/notice");
		
		return model;
	}
	
	//합격축하금 높은순
	@ResponseBody
	@GetMapping("/passmoney")
	public List<CnoticeDto> passlist()
	{
		
		return nservice.getPassMoneyNotices();
	}
	
	
	//조회수 높은순
	@ResponseBody
	@GetMapping("/readcount")
	public List<CnoticeDto> readlist()
	{
			
		return nservice.getReadCountNotices();
	}
	
	//최신순
	@ResponseBody
	@GetMapping("/writeday")
	public List<CnoticeDto> writelist()
	{
				
		return nservice.getWriteDayNotices();
	}
		
	//마감일적게남은순
	@ResponseBody
	@GetMapping("/deadline")
	public List<CnoticeDto> deadlist()
	{
				
		return nservice.getDeadLineNotices();
	}
		
	@ResponseBody
	@GetMapping("/joblist")
	public List<CnoticeDto> jobList(@RequestParam(name = "cnotice_Job") String[] cnotice_Job) {
	    // cnotice_Job 배열을 처리하는 로직을 작성
	    // 배열을 사용하여 필요한 작업 수행
	    // ...
	    return nservice.jobList(cnotice_Job);
	}
	

	
	/*@ResponseBody
	@GetMapping("/sanglist")
	public Map<String, String> sanglist()
	{
		Map<String, String> map=new HashMap<>();
		
		
		
		return map;
	}*/
	
}
