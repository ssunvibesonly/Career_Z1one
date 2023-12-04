package boot.data.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ApplyDto;
import boot.data.dto.RecruitDto;
import boot.data.dto.TitleDto;
import boot.data.dto.User_ApplyDto;
import boot.data.dto.User_CareerDto;
import boot.data.dto.User_EducationDto;
import boot.data.service.RecruitService;

@Controller
@RequestMapping("/recruit")
public class RecruitController {

	@Autowired
	RecruitService service;
	
	@GetMapping("/level")
	@ResponseBody
	public Map<String, Integer> levelformajax(@RequestParam int cnt) {
		
		cnt++;
		
		Map<String, Integer> map=new HashMap<>();
		map.put("cnt", cnt);
		
		return map;
	}
	
	@GetMapping("/levelinsertform")
	public String levelform(Model model,@RequestParam(defaultValue = "none") String r_title,
			@RequestParam(defaultValue = "0") int c_code,HttpSession session) {
		//c_code=session.getAttribute("로그인한 회사의 시퀀스")==null?0:(int)session.getAttribute("로그인한 회사의 시퀀스");
		
		if(c_code==0&&r_title.equals("none")) {
			model.addAttribute("maxstep", 0);
		} else {
			int maxstep=service.getMaxStepOfCourse(c_code, r_title);
			Timestamp deadlineday=service.getAllRecruitCourse(c_code, r_title).size()==0?null:service.getAllRecruitCourse(c_code, r_title).get(0).getDeadlineday();
			
			String deaddate="";
			String deadtime="";
			if(deadlineday!=null) {
				deaddate=deadlineday.toString().split(" ")[0];
				deadtime=deadlineday.toString().split(" ")[1];
			}
			
			model.addAttribute("maxstep", maxstep);
			model.addAttribute("list", service.getAllRecruitCourse(c_code, r_title).size()==0?null:service.getAllRecruitCourse(c_code, r_title));
			model.addAttribute("deaddate", deaddate);
			model.addAttribute("deadtime", deadtime.length()==0?deadtime:deadtime.substring(0, deadtime.length()-2));
		}
		model.addAttribute("c_code", c_code);
		model.addAttribute("r_title", r_title);
		
		return "/2/recruit/r_levelinsertform";
	}
	
	@PostMapping("/levelupdate")
	public ModelAndView update(@RequestParam int c_code,String r_title,String levels,String steps,
			String deadlineday) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("redirect:titlelist");
		model.addObject("c_code", c_code);
		
		int maxStep=service.getMaxStepOfCourse(c_code, r_title);
		
		levels=levels.substring(0, levels.length()-1);
		steps=steps.substring(0, steps.length()-1);

		if(deadlineday.length()==16) {
			deadlineday+=":00";
		}
		Timestamp deadlinetime=java.sql.Timestamp.valueOf(deadlineday);
		RecruitDto rdto=new RecruitDto();
		rdto.setC_code(c_code);
		rdto.setR_title(r_title);
		rdto.setDeadlineday(deadlinetime);
		
		//model.addObject("company", service.getCompanyNameByCode(c_code));
		String[] levelsarr=levels.split(",");
		String[] stepsarr=steps.split(",");
		int[] stepsintarr=new int[stepsarr.length];
		
		int j=0;
		for(String step:stepsarr) {
			int stepint=Integer.parseInt(step);
			stepsintarr[j]=stepint;
			j++;
		}
		for(int i=0;i<Math.max(maxStep, levelsarr.length);i++) {
			if(i<maxStep&&i<levelsarr.length) {
				rdto.setR_level(levelsarr[i]);
				rdto.setR_step(stepsintarr[i]);
				service.updateRecruitCourse(rdto);
			}else if(maxStep<=i&&i<levelsarr.length) {
				rdto.setR_level(levelsarr[i]);
				rdto.setR_step(stepsintarr[i]);
				service.insertRecruitCourse(rdto);
			}else if(i<maxStep&&levelsarr.length<=i) {
				rdto.setR_step(i+1);
				service.deleteRecruitCourse(rdto);
			}	
		}
		return model;
	}
	
	@GetMapping("/eachlist")
	public ModelAndView courselist(@RequestParam int c_code,String r_title) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("/2/recruit/viewer");
		model.addObject("c_code", c_code);
		model.addObject("r_title", r_title);
		//model.addObject("c_code", 1);
		//model.addObject("r_title", "순영그룹특채");
		
		String c_pass=service.getCompanyPass(c_code);
		model.addObject("c_pass", c_pass);

		List<RecruitDto> levellist=service.getAllRecruitCourse(c_code,r_title);
		//List<RecruitDto> levellist=service.getAllRecruitCourse(1,"순영그룹특채");
		model.addObject("levellist", levellist);
		model.addObject("title", levellist.get(0).getR_title());
		model.addObject("maxstep", levellist.size());
		
		List<ApplyDto> applylist=service.getAllApplier();
		model.addObject("applylist", applylist);
		
		RecruitDto dto=new RecruitDto();
		dto.setC_code(c_code);
		dto.setR_title(r_title);
		dto.setR_step(service.getMaxStepOfCourse(c_code, r_title));
		
		List<ApplyDto> finallist=service.getAllFinalPass(service.getNumOfStep(dto));
		model.addObject("finallist", finallist);
		model.addObject("finalcount", finallist.size());
		
		return model;
	}
	
	@GetMapping("/relist")
	@ResponseBody
	public Map<String, Object> relist(int c_code,String r_title) {
		
		Map<String, Object> map=new HashMap<>();
		map.put("levellist", service.getAllRecruitCourse(c_code,r_title));
		map.put("applylist", service.getAllApplier());
		
		RecruitDto dto=new RecruitDto();
		dto.setC_code(c_code);
		dto.setR_title(r_title);
		dto.setR_step(service.getMaxStepOfCourse(c_code, r_title));
		map.put("finallist", service.getAllFinalPass(service.getNumOfStep(dto)));
		
		return map;
	}
	
	@PostMapping("/passThisStep")
	@ResponseBody
	public void pass(@RequestParam int a_idx) {
		
		RecruitDto rdto=service.getStepCourseByNum(service.getNumByIdx(a_idx));
		int old_step=rdto.getR_step();
		
		if(old_step!=service.getMaxStepOfCourse(rdto.getC_code(), rdto.getR_title())) {
			rdto.setR_step(old_step+1);
			service.passThisStep(service.getNumOfStep(rdto), a_idx);
		} else {
			service.passThisStep(-1, a_idx);
		}
	}
	
	@PostMapping("/fail")
	@ResponseBody
	public void fail(@RequestParam int a_idx) {
		//service.failCourse(a_idx);
		service.failRecord(a_idx);
	}
	
	@GetMapping("/applydetail")
	@ResponseBody
	public Map<String, Object> applydetail(@RequestParam int user_num){
		
		Map<String, Object> map=new HashMap<>();
		
		String email=service.getEmail(user_num);
		List<User_EducationDto> educations=service.getEducation(user_num);
		List<User_CareerDto> careers=service.getCareer(user_num);
		User_ApplyDto applyinfo=service.getApplyInfo(user_num);
		
		map.put("email", email);
		map.put("educations", educations);
		map.put("careers", careers);
		map.put("applyinfo", applyinfo);
		
		return map;
	}
	
	@GetMapping("/titlelist")
	public ModelAndView tlist(@RequestParam int c_code) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("/2/recruit/r_titlelist");
		model.addObject("c_code", c_code);
		model.addObject("c_pass", service.getCompanyPass(c_code));
		
		List<TitleDto> titlelist=service.getAllTitles(c_code);
		
		for(TitleDto t:titlelist) {
			String title=t.getR_title();
			if(title.length()>14) {
				t.setR_title(title.substring(0, 14)+"...");
			}
		}
		model.addObject("titlelist", titlelist);
		model.addObject("titlecount", titlelist.size());
		
		return model;
	}
	
	@GetMapping("/outline")
	@ResponseBody
	public Map<String, Object> outline(@RequestParam int c_code,String r_title) {
		
		Map<String, Object> map=new HashMap<>();
		List<RecruitDto> rlist=service.getAllRecruitCourse(c_code, r_title);
		List<String> levellist=new ArrayList<>();
		List<Integer> outlinelist=service.getOutline(c_code, r_title);
		List<ApplyDto> finallist=service.getAllFinalPass(service.getMaxStepOfCourse(c_code, r_title));
		
		for(RecruitDto dto:rlist) {
			levellist.add(dto.getR_level());
		}
		map.put("levellist", levellist);
		map.put("outlinelist", outlinelist);
		map.put("finalpass", finallist.size());
		
		return map;
	}
	
	@PostMapping("/dragupdate")
	@ResponseBody
	public void dragupdate(@RequestParam int r_num,int a_idx,int isFinal) {
		service.updateDrag(r_num, a_idx,isFinal);
	}
}
