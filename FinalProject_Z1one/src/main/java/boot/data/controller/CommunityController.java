package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
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

import boot.data.dto.Board_ContentDto;
import boot.data.dto.UserGaipDto;
import boot.data.dto.User_BoardDto;
import boot.data.mapper.CmBoardMapperInter;
import boot.data.service.BoardAnswerService;
import boot.data.service.BoardSearchService;
import boot.data.service.BoardService;
import boot.data.service.CmBoardService;
import boot.data.service.UserGaipService;


@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	CmBoardService service;
	
	@Autowired
	UserGaipService uservice;
	
	
	@Autowired
	BoardAnswerService bservice;
	
	@Autowired
	BoardSearchService boardSearchService;
	   
	@Autowired
	BoardService boardService;

	
	/*
	 * @GetMapping("/list")
	 * public String cmlist() 
	 *{ 
	 *	return "/2/community/cmList";
	 *}
	 */
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "") String board_category, HttpSession httpSession)
	{
		ModelAndView model = new ModelAndView();
		
		//int totalCount=service.getTotalCount();
		
		// 페이징 처리에 필요한 변수 선언
	      int totalCount = service.getTotalCount(board_category); // 글의 전체 개수
	      int totalPage; // 총 페이지수
	      int startPage; // 각블럭에서 보여질 시작페이지
	      int endPage; // 각블럭에서 보여질 끝페이지
	      int startNum; // db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
	      int perPage = 6; // 한페이지당 보여질 글의 갯수
	      int perBlock = 5; // 한블럭당 보여질 페이지 개수
		
	      // 총페이지수 구하기
	      // 총글의 갯수/한페이지당 보여질 개수로 나눔(7/5=1)
	      // 나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
	      totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

	      // 각블럭당 보여야할 시작페이지
	      // perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
	      // 현재페이지 13 시작:11 끝:15
	      startPage = (currentPage - 1) / perBlock * perBlock + 1;

	      endPage = startPage + perBlock - 1;

	      // 총페이지가 23일경우 마지막블럭은 25가아니라 23이다
	      if (endPage > totalPage)
	         endPage = totalPage;

	      // 각페이지에서 보여질 시작번호
	      // 1페이지: 0,2페이지:5 3페이지:10....
	      startNum = (currentPage - 1) * perPage;

	      // 각페이지당 출력할 시작번호 구하기 no
	      // 총글개수가 23이면 1페이지 23,2페이지는 18,3페이지 13.....
	      // 출력시 1씩 감소하며 출력
	      int no = totalCount - (currentPage - 1) * perPage;

	    //이메일
	    String id =(String)httpSession.getAttribute("myid"); //session 설정하면 get으로 
	    System.out.println(id);
	    
	    //id가 null이어도 그대로 페이지 이동하도록 설정
	    if(id != null) {  //로그인 했을 경우
	    	//나머지 코드 생략
	    	
	    	String displayedEmail = id.substring(0, Math.min(id.length(), 3)) + "*".repeat(Math.max(0, id.length() - 3));
	    	model.addObject("displayedEmail", displayedEmail);
	    	model.setViewName("/2/community/cmList");
	    }

		
		//select
	      List<User_BoardDto> list;
		
		if(!board_category.equals("")) {
			list = service.getBoardsByCategory(startNum, perPage,board_category);
		}else {
			list = service.getBoards(startNum, perPage);
		}
		
		for(User_BoardDto user:list) {
			//1.user_num을 통해서 user_email을 찾아옴
			String userEmail = service.getEmail(user.getUser_num());
			//2.userEmail에 마스킹처리
			String displayedEmail = userEmail.substring(0, Math.min(userEmail.length(), 3)) + "*".repeat(Math.max(0, userEmail.length() - 3));
			System.out.println(displayedEmail);
			//3.User_BoarDto에 user_email에 값으로 설정해준다.
			user.setUser_email(displayedEmail);
		}
		//다중 이미지 대표 이미지 1개만 주기하려고 했으나 list에 이미 담아놔서 controller에 처리하지 않음
		
		//성신 게시판 list 댓글 수
		List<Board_ContentDto> contentList = new ArrayList<>();
		for(int i =0 ;i<list.size();i++) {
			contentList.add(bservice.getAnswerCount(list.get(i).getBoard_num()));
			System.out.println("보드넘 : "+list.get(i).getBoard_num()+",댓글수 : "+contentList.get(i).getCount());
		}
		//System.out.println(contentList.size());
		//System.out.println(list.size());
		
		
		

		model.addObject("contentList",contentList);
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);
		model.addObject("board_category", board_category);


		model.setViewName("/2/community/cmList");
		
		return model;
	}
	
	
	@GetMapping("/cmform")
	public String cmform()
	{
		return "/2/community/cmForm";
	}
	
	@GetMapping("/originallist")
	public ModelAndView originallist()
	{
		ModelAndView model=new ModelAndView();
		
		model.setViewName("redirect:list");
		return model;
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute User_BoardDto dto,List<MultipartFile> upload,HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/savefile");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		
		String photo="";
		
		//사진 업로드 할 때 이름만 바꿔주기
		//업로드 안 한경우 no
		if(upload.get(0).getOriginalFilename().equals(""))
			photo="no";//no라고 저장하겠다
		else { //업로드 한 경우
			
			
			for(MultipartFile f:upload) {
				String fileName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				photo+=fileName+",";
				
				try {
					f.transferTo(new File(path+"\\"+fileName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			photo=photo.substring(0,photo.length()-1);

		}
		dto.setBoard_photo(photo);
		
		//세션에서 user_Num 얻기 위해 dto에 저장 (CmBoardMapper.xml에서 insert부분에 user_num값을 가져오기 위해 하는 작업)
		//1.session을 통해서 myid, 즉 사용자 이메일을 받아옴
		String user_email=(String)session.getAttribute("myid");
		//2.이메일(이게 즉 id때문에 겹칠일이 없죠)을 통해서 사용자의 user_num
		String userNum=uservice.getDataById(user_email).getUser_num();
		dto.setUser_num(userNum);
		
		
		//insert 시키기
		service.insertCmBoard(dto);
		
		return "redirect:content?board_num="+service.getMaxNum();
	}
	
	@GetMapping("/content")
	public ModelAndView content(@RequestParam String board_num,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		
		ModelAndView model=new ModelAndView();
		
		
		//조회수 증가
		service.updateReadCount(board_num);
		
		User_BoardDto dto=service.getData(board_num);
		model.addObject("boardnum", board_num);
		
		//게시판 작성자: 이메일 마스킹 처리
		String email=service.getEmail(dto.getUser_num());
		String displayedEmail = email.substring(0, Math.min(email.length(), 3));
		displayedEmail += "*".repeat(Math.max(0, email.length() - 3));
				
				
		model.addObject("dto", dto);
		model.addObject("email", email);
		model.addObject("displayedEmail", displayedEmail);
		
		//업로드 파일의 확장자 얻기
		int dotLoc=dto.getBoard_photo().lastIndexOf('.');  // 업로드 파일에서 마지막 점(.)의 위치를 잡아낸다
		String ext=dto.getBoard_photo().substring(dotLoc+1); //substring이 다음 글자부터 끝 글자까지 추출해준다. (.의 다음부터 끝까지)
		
		
		if(ext.equalsIgnoreCase("jpg")||ext.equalsIgnoreCase("gif")
				||ext.equalsIgnoreCase("png")||ext.equalsIgnoreCase("jpeg"))//확장자가 이미지일 것 같은 것 다 ||또는으로 해놓기
			model.addObject("bupload", true); //확장자가 위와 같으면 bupload라는 이름으로 true값을 보내도록 지정한다  => content 페이지로 가서 작성하기
		else {
			model.addObject("bupload", false); //확장자가 위와 같지 않으면 bupload라는 이름으로 false값을 보내도록 지정한다
		}
		
		model.addObject("currentPage", currentPage); 
		model.setViewName("/2/community/content"); 
		
		return model;
	}

	//좋아요 증가
	@GetMapping("/likes")
	@ResponseBody
	public int likes(@RequestParam String board_num)
	{
		service.updateLikes(board_num);
		int likes=service.getData(board_num).getBoard_like();
		return likes;
	}
	
	//좋아요 감소
	@GetMapping("/unlikes")
	@ResponseBody
	public int unlikes(@RequestParam String board_num)
	{
		service.updateunLikes(board_num);
		int unlikes=service.getData(board_num).getBoard_like();
		
		return unlikes;
	}
	
	//게시판 업데이트1
	@GetMapping("/uform")
	public String updateform(Model model, String board_num)
	{
		User_BoardDto dto=service.getData(board_num);
		
		model.addAttribute("dto", dto);
		
		return "/2/community/updateForm";
	}
	
	//게시판 업데이트2...insert 복붙 후 쿼리문만 바꿔주기
	@PostMapping("/update")
	public String updateBoard(@ModelAttribute User_BoardDto dto,List<MultipartFile> upload,HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/savefile");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		
		String photo="";
		
		//사진 업로드 할 때 이름만 바꿔주기
		//업로드 안 한경우 no
		if(upload.get(0).getOriginalFilename().equals(""))
			photo="no";//no라고 저장하겠다
		else { //업로드 한 경우
			
			
			for(MultipartFile f:upload) {
				String fileName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				photo+=fileName+",";
				
				try {
					f.transferTo(new File(path+"\\"+fileName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			photo=photo.substring(0,photo.length()-1);

		}
		dto.setBoard_photo(photo);
		
		//세션에서 user_Num 얻기 위해 dto에 저장 (CmBoardMapper.xml에서 update부분에 user_num값을 가져오기 위해 하는 작업)
		//1.session을 통해서 myid, 즉 사용자 이메일을 받아옴
		String user_email=(String)session.getAttribute("myid");
		System.out.println(user_email);
		//2.이메일(이게 즉 id때문에 겹칠일이 없죠)을 통해서 사용자의 user_num
		String userNum=uservice.getDataById(user_email).getUser_num();
		dto.setUser_num(userNum);
		
		
		//update 시키기
		service.upadateBoard(dto);
		
		return "redirect:content?board_num="+dto.getBoard_num();
	}
	
	//게시판 삭제
	@GetMapping("/delete")
	public String deleteBoard(String board_num, HttpServletRequest request)  //@requestparam은 생략 가능  // HttpServletRequest나 HttpSession 써도 가능!(대신 쓰는 법 다름)
	{
		String photo=service.getData(board_num).getBoard_photo(); //num에 해당하는 photo 가져오기
		
		//사진 없으면 파일 삭제할 게 없을 수도 있어서 조건 주기 + 사진 있으면 파일에서 삭제하기
		if(!photo.equals("no"))  //null로 하게 되면 equals가 못 받는다
		{
			String path = request.getServletContext().getRealPath("/save");
			
			File file=new File(path+"\\"+photo);
			file.delete();
		}
		
		service.deleteBoard(board_num);   //기존에는 mapper.deleteMarket(num);인데 day1024 오늘 service 배워서 바꿔 봄!
		System.out.println("게시글 삭제 보드넘: "+board_num);     //num값 넘어갔는 지 확인해봄(생략 가능)!
		
		return "redirect:list";
	}

	//현규검색창
	  @GetMapping("/search")
	   public String searchBoardByTitle(@RequestParam(required = false) String searchword, Model model) {

	      //댓글 수 뽑기
	      List<User_BoardDto> getList = boardService.getAllData();
	      List<Board_ContentDto> contentList = new ArrayList<Board_ContentDto>();
	      for (int i = 0; i <getList.size() ; i++) {
	         contentList.add(boardService.getContentCount(getList.get(i).getBoard_num()));
	      }
	      model.addAttribute("contentList",contentList);

	      if(searchword==null) {
	         List<User_BoardDto> getAllResults = boardSearchService.getAllSearch();
	         model.addAttribute("getAllResults", getAllResults);
	      }
	      List<User_BoardDto> searchResults = boardSearchService.searchTitle(searchword);
	      model.addAttribute("searchResults", searchResults);
	      model.addAttribute("resultCount", searchResults.size());
	      model.addAttribute("searchword", searchword);
	      return "/2/community/searchResult"; // 검색 결과를 보여줄 페이지로 이동
	   }
	
}
