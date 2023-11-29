<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
body {
   font-size: 2vh;
}

#jobModal{
  position: absolute;
  margin: 9vw -3.5vw; 

}

#areaModal{
position: absolute;
  margin: 15.5vw -22.4vw;
}

#careerModal{
position: absolute;
  margin: 15.5vw -13.1vw;
}

#academicModal{
position: absolute;
margin: 15.5vw 1.3vw;
} 

.notice > div {
  text-align: left;
}

.notice > div > div{
  margin-left: 1vh;
} 

.input_search{
border: 1px solid purple !important;
width: 300px !important;
height: 45px !important;

}
#glass{
width: 40px;
height: 42px;
cursor: pointer;

}
</style>
<script type="text/javascript">
//전역변수(list에 data로 넘기기위함)
jobTokens = []; //직종
areaTokens = []; //지역
careerTokens =[]; //경력
academicTokens =[]; //학력

$(function() {
   //디폴트리스트호출
   list();
   
   //select의 option을 선택했을때 정렬 
    $('#orderBy').change(function() {
       // 선택된 옵션의 클래스를 가져옴
       var selectedClass = $('option:selected', this).attr('class');
      //alert(selectedClass);
      var orderBy; //지역변수
      //합격축하금
      if(selectedClass=='passmoney') {
          orderBy='passmoney'; //값을 대입할때는 = 값이 같을때는 ==
          list(orderBy);
        //조회수 
      } else if (selectedClass=='readcount') { 
    	  orderBy='readcount';
    	  list(orderBy);
        //작성일 
      } else if (selectedClass=='writeday') { 
    	  orderBy='writeday';
    	  list(orderBy);
    	//마감일 
      } else if (selectedClass=='deadline')  
    	  orderBy='deadline';
      	  list(orderBy);
     }); 
      
    //직업모달열림
    $(".job").click(function() {
    	jobTokens = []; //모달창 열릴때 배열 초기화
      $("#jobModal").modal("show");    
     });    
       
   //지역모달열림
   $(".area").click(function () {
	   areaTokens = []; //모달창 열릴때 배열 초기화
      $("#areaModal").modal("show");    
   });
   
   //경력모달열림
   $(".career").click(function() {
	   careerTokens =[]; //모달창 열릴때 배열 초기화
      $("#careerModal").modal("show"); 
     });
   
   //학력모달열림
   $(".academic").click(function() {
	   academicTokens =[]; //모달창 열릴때 배열 초기화
      $("#academicModal").modal("show");
   });
   
   //직종-전체버튼 초기 설정
   //클릭상태부여
   var allJobBtnClicked = true;
   $(".job-allbtn").addClass("clicked").css({
       "background-color": "white" ,
       "border":"3px solid black"
   });
   //직종-전체버튼 업데이트 함수
   function updateAllJobBtnStyle() {
      $(document).on("click",".job-allbtn",function(){
         $(".job-allbtn").addClass("clicked").css({
              "background-color": "white" ,
              "border":"3px solid black"
          });
      })
   }
   //직종-전체버튼 업데이트 함수호출
   updateAllJobBtnStyle();
   //직종버튼클릭시이벤트
   $(".modalbtn-job").click(function () {
       //현재 버튼이 allbtn인 경우
       if ($(this).hasClass("job-allbtn")) {
           //클릭 상태에 따라 스타일 변경
           allJobBtnClicked = !allJobBtnClicked;
           updateAllJobBtnStyle();
           // otherbtn만 버튼의 클릭 상태 제거 및 스타일 변경
           $(".job-otherbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });   
       } else {
           //otherbtn일경우
           //클릭 상태에 따라 스타일 변경
           $(this).toggleClass("clicked").css({
               "background-color": $(this).hasClass("clicked") ? "white" : "#f8f8f8",
               "border": $(this).hasClass("clicked") ? "3px solid black" : "1px solid gray"
           });

           //allbtn 버튼의 클릭 상태 제거 및 스타일 변경
           $(".job-allbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });
       }
       
   });
   
   //직종-적용하기버튼이벤트
   $(".job-apply").click(function () {
       //클릭된 버튼 변수에 할당
       var clickedJobButtons = $(".modalbtn-job.clicked");
       //각 클릭된 버튼에 대한 정보 확인
       clickedJobButtons.each(function () {
           //내가 클릭한 버튼의 text
           jobToken = $(this).text().trim();
           //토큰을 토큰즈에 누적
           jobTokens.push(jobToken);
       });
       //전체 버튼의 text
       var allJobText = $(".job-allbtn").text().trim();
       
	    // 내가 선택한 버튼이 token에서 가져온 text와 같을 때
	    if (jobTokens == allJobText) {
	    	//배열 초기화
	    	jobTokens=[];
	    	//전체조회 리스트호출
	        list();
	       	//text를 전체로 변경
			$(".job").html("<b style='color: black; font-size: 0.8em'>전체\t<i class='bi bi-caret-down-fill'></i></b>");
	    } else {
	    	//리스트호출
	    	list();
	    	//누적방지
		    $(".job").empty();
	    	//text를 선택한 tokens로 변경
		   	$(".job").html("<b style='color: black; font-size: 0.8em'>" + jobTokens + "\t<i class='bi bi-caret-down-fill'></i></b>");
		    //jobTokens=[];


	    }
	    
	   
   });

   //모달창 내 초기화 버튼
   $(".job-reset").click(function () {
       // 모든 버튼 초기화
       $(".modalbtn-job").removeClass("clicked").css({
           "background-color": "#f8f8f8",
           "border": "1px solid gray"
       });

       // 전체버튼의 클릭 상태 업데이트 및 스타일 변경
       allJobBtnClicked = true;  // 변수명 수정
       $(".job-allbtn").addClass("clicked").css({
           "background-color": "white",
           "border": "3px solid black"
       });
   });

/////////////////////////////////////////////////////////////

   //area의 전체버튼 초기 설정
   var allAreaBtnClicked = true;
   $(".area-allbtn").addClass("clicked").css({
       "background-color": "white" ,
       "border":"3px solid black"
   });
   //area의 전체버튼 업데이트 함수
   function updateAllAreaBtnStyle() {
      $(document).on("click",".area-allbtn",function(){
         $(".area-allbtn").addClass("clicked").css({
              "background-color": "white" ,
              "border":"3px solid black"
          });
      })
   }
   //area전체버튼 초기 스타일 설정
   updateAllAreaBtnStyle();

   //area버튼클릭이벤트
   $(".modalbtn-area").click(function () {
       //현재 버튼이 allbtn인지 확인
       if ($(this).hasClass("area-allbtn")) {
           //클릭 상태에 따라 스타일 변경
           allAreaBtnClicked = !allAreaBtnClicked;
           updateAllAreaBtnStyle();
           //otherbtn버튼의 클릭 상태 제거 및 스타일 변경
           $(".area-otherbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });   
       } else {
           //otherbtn인경우
           //클릭 상태에 따라 스타일 변경
           $(this).toggleClass("clicked").css({
               "background-color": $(this).hasClass("clicked") ? "white" : "#f8f8f8",
               "border": $(this).hasClass("clicked") ? "3px solid black" : "1px solid gray"
           });
           // allbtn 버튼의 클릭 상태 제거 및 스타일 변경
           $(".area-allbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });
       }    
   });
   
   //지역-적용하기버튼이벤트
   $(".area-apply").click(function () {
	    // 클릭된 버튼 변수에 할당
	    var clickedAreaButtons = $(".modalbtn-area.clicked");
	    // 각 클릭된 버튼에 대한 정보 확인
	    clickedAreaButtons.each(function () {
	        // 내가 클릭한 버튼의 text
	        var areaToken = $(this).text().trim();
	        //토큰을 토큰즈에 누적
	        areaTokens.push(areaToken);
	    });   	
	    // 전체 버튼의 text
	    var allAreaText = $(".area-allbtn").text().trim();
	    
	    // 내가 선택한 버튼이 token에서 가져온 text와 같을 때
	    if (areaTokens == allAreaText) {
	    	//배열 초기화
	    	areaTokens=[];
	    	//전체조회 리스트호출
	        list();
	       	//text를 전체로 변경
			$(".area").html("<b style='color: black; font-size: 0.8em'>전체\t<i class='bi bi-caret-down-fill'></i></b>");
	    } else {
	    	//리스트호출
	    	list();
	    	//누적방지
		    $(".area").empty();
	    	//text를 선택한 tokens로 변경
		    $(".area").html("<b style='color: black; font-size: 0.8em'>" + areaTokens + "\t<i class='bi bi-caret-down-fill'></i></b>");
			//areaTokens=[];
	    }
	});

   //모달창 내 초기화 버튼
   $(".area-reset").click(function () {
       // 모든 버튼 초기화
       $(".modalbtn-area").removeClass("clicked").css({
           "background-color": "#f8f8f8",
           "border": "1px solid gray"
       });

       // 전체버튼의 클릭 상태 업데이트 및 스타일 변경
       allAreaBtnClicked = true;  // 변수명 수정
       $(".area-allbtn").addClass("clicked").css({
           "background-color": "white",
           "border": "3px solid black"
       });
   });
/////////////////////////////////////////////////////////////////////////////
 //career의 전체버튼 초기 설정
   var allCareerBtnClicked = true;
   $(".career-allbtn").addClass("clicked").css({
       "background-color": "white" ,
       "border":"3px solid black"
   });
   //career의 전체버튼 업데이트 함수
   function updateAllCareerBtnStyle() {
      $(document).on("click",".career-allbtn",function(){
         $(".career-allbtn").addClass("clicked").css({
              "background-color": "white" ,
              "border":"3px solid black"
          });
      })
   }
   //career전체버튼 초기 스타일 설정
   updateAllCareerBtnStyle();

   //area버튼클릭이벤트
   $(".modalbtn-career").click(function () {
       //현재 버튼이 allbtn인지 확인
       if ($(this).hasClass("career-allbtn")) {
           //클릭 상태에 따라 스타일 변경
           allCareerBtnClicked = !allCareerBtnClicked;
           updateAllCareerBtnStyle();
           //otherbtn버튼의 클릭 상태 제거 및 스타일 변경
           $(".career-otherbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });   
       } else {
           //otherbtn인경우
           //클릭 상태에 따라 스타일 변경
           $(this).toggleClass("clicked").css({
               "background-color": $(this).hasClass("clicked") ? "white" : "#f8f8f8",
               "border": $(this).hasClass("clicked") ? "3px solid black" : "1px solid gray"
           });
           // allbtn 버튼의 클릭 상태 제거 및 스타일 변경
           $(".career-allbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });
       }    
   });
   
   //경력-적용하기버튼이벤트
   $(".career-apply").click(function () {
	    // 클릭된 버튼 변수에 할당
	   
	    var clickedCareerButtons = $(".modalbtn-career.clicked");
	    // 각 클릭된 버튼에 대한 정보 확인
	    clickedCareerButtons.each(function () {
	        // 내가 클릭한 버튼의 text
	        var careerToken = $(this).text().trim();
	        //토큰을 토큰즈에 누적
	        careerTokens.push(careerToken);
	        //alert(careerToken);
	    });   	
	    //전체 버튼의 text
	    var allCareerText = $(".career-allbtn").text().trim();
	    
	    // 내가 선택한 버튼이 token에서 가져온 text와 같을 때
	    if (careerTokens == allCareerText) {
	    	//배열 초기화
	    	//careerTokens=[];
	    	//전체조회 리스트호출
	        list();
	       	//text를 전체로 변경
			$(".career").html("<b style='color: black; font-size: 0.8em''>경력무관\t<i class='bi bi-caret-down-fill'></i></b>");
		
	    } else {
	    	//리스트호출
	    	list();
	    	//누적방지
		    $(".career").empty();
	    	//text를 선택한 tokens로 변경
		    $(".career").html("<b style='color: black; font-size: 0.8em''>" + careerTokens + "\t<i class='bi bi-caret-down-fill'></i></b>");
			//careerTokens=[];
	    }
	});

   //모달창 내 초기화 버튼
   $(".career-reset").click(function () {
       // 모든 버튼 초기화
       $(".modalbtn-career").removeClass("clicked").css({
           "background-color": "#f8f8f8",
           "border": "1px solid gray"
       });

       // 전체버튼의 클릭 상태 업데이트 및 스타일 변경
       allCareerBtnClicked = true;  // 변수명 수정
       $(".career-allbtn").addClass("clicked").css({
           "background-color": "white",
           "border": "3px solid black"
       });
   });
//////////////////////////////////////////////////////////////////////////////////////////////
 //academic의 전체버튼 초기 설정
   var allAcademicBtnClicked = true;
   $(".academic-allbtn").addClass("clicked").css({
       "background-color": "white" ,
       "border":"3px solid black"
   });
   //academic의 전체버튼 업데이트 함수
   function updateAllAcademicBtnStyle() {
      $(document).on("click",".academic-allbtn",function(){
         $(".academic-allbtn").addClass("clicked").css({
              "background-color": "white" ,
              "border":"3px solid black"
          });
      })
   }
   //academic전체버튼 초기 스타일 설정
   updateAllAcademicBtnStyle();

   //area버튼클릭이벤트
   $(".modalbtn-academic").click(function () {
       //현재 버튼이 allbtn인지 확인
       if ($(this).hasClass("academic-allbtn")) {
           //클릭 상태에 따라 스타일 변경
           allAcademicBtnClicked = !allAcademicBtnClicked;
           updateAllAcademicBtnStyle();
           //otherbtn버튼의 클릭 상태 제거 및 스타일 변경
           $(".academic-otherbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });   
       } else {
           //otherbtn인경우
           //클릭 상태에 따라 스타일 변경
           $(this).toggleClass("clicked").css({
               "background-color": $(this).hasClass("clicked") ? "white" : "#f8f8f8",
               "border": $(this).hasClass("clicked") ? "3px solid black" : "1px solid gray"
           });
           // allbtn 버튼의 클릭 상태 제거 및 스타일 변경
           $(".academic-allbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });
       }    
   });
   
   //지역-적용하기버튼이벤트
   $(".academic-apply").click(function () {
	    // 클릭된 버튼 변수에 할당
	   
	    var clickedAcademicButtons = $(".modalbtn-academic.clicked");
	    // 각 클릭된 버튼에 대한 정보 확인
	    clickedAcademicButtons.each(function () {
	        // 내가 클릭한 버튼의 text
	        var academicToken = $(this).text().trim();
	        //토큰을 토큰즈에 누적
	        academicTokens.push(academicToken);
	        //alert(careerToken);
	    });   	
	    // 전체 버튼의 text
	    var allAcademicText = $(".academic-allbtn").text().trim();
	    
		//tokens의 길이가 1보다 크면 css 변경
		if(academicTokens.length==1){
	    	$(".academic").css({
		    	'width' : '15%'
		    });
	    } else {
	    	$(".academic").css({
		    	'width' : '30%'
		    });
	    }
	    // 내가 선택한 버튼이 token에서 가져온 text와 같을 때
	    if (academicTokens == allAcademicText) {
	    	//배열 초기화
	    	//academicTokens=[];
	    	//전체조회 리스트호출
	        list();
	       	//text를 전체로 변경
			$(".academic").html("<b style='color: black; font-size: 0.8em'>학력무관\t<i class='bi bi-caret-down-fill'></i></b>");
	    } else {
	    	//리스트호출
	    	list();
	    	//누적방지
		    $(".academic").empty();
	    	//text를 선택한 tokens로 변경
		    $(".academic").html("<b style='color: black; font-size: 0.8em'>" + academicTokens + "\t<i class='bi bi-caret-down-fill'></i></b>");
			//careerTokens=[];
	    }
	});

   //모달창 내 초기화 버튼
   $(".academic-reset").click(function () {
       // 모든 버튼 초기화
       $(".modalbtn-academic").removeClass("clicked").css({
           "background-color": "#f8f8f8",
           "border": "1px solid gray"
       });

       // 전체버튼의 클릭 상태 업데이트 및 스타일 변경
       allAcademicBtnClicked = true;  // 변수명 수정
       $(".academic-allbtn").addClass("clicked").css({
           "background-color": "white",
           "border": "3px solid black"
       });
   });
   //디테일페이지에서 쓸거임
     /*$(".sangbtn").click(function(){
        let location = $("#out1").offset().top; // jQuery를 사용하여 위치를 얻습니다
        var s = "";
        
        $.ajax({
           type: "get",
           dataType: "json",
           url: "/company/sanglist",
           success: function(res) {
            s += res.sogae + "<br><br>";
            s += res.damdang + "<br><br>";
            s += res.jagyuk + "<br><br>";
            s += res.woodae + "<br><br>";
            s += res.bokji + "<br><br>";
            s += res.jeonhyung + "<br><br>";
            
            $("#out1").html(s);
            
            // scrollMove 함수를 호출하여 원하는 위치로 스크롤합니다
            scrollMove();
           }
        });

        // scrollMove 함수를 정의합니다
        const scrollMove = () => {
          $('html, body').animate({
            scrollTop: location
          }, 0); // 스크롤 애니메이션의 지속 시간을 조절할 수 있습니다 (밀리초 단위)
        };
     }); */
     
}); //$(function)

// 날짜 형식을 변환하는 함수
function formatDate(date, format) {
    var MM = String(date.getMonth() + 1).padStart(2, '0');
    var dd = String(date.getDate()).padStart(2, '0');
    // 원하는 날짜 형식에 따라 추가적인 처리를 수행할 수 있습니다.
    return format.replace('MM', MM).replace('dd', dd);
}
	
   function list(orderBy) {
	
	    $.ajax({
	        type: "get",
	        dataType: "json",
	        url: "/company/allList",
	        traditional: true, // 중간에 &를 ,로 변경하는 옵션
	        data: { "cnotice_Job_List": jobTokens, "cnotice_Area_List": areaTokens, 
	        	"cnotice_Career_List": careerTokens, "cnotice_Academic_List" : academicTokens,
	        	"orderBy":orderBy },
           success: function (res) {
               var noticeContainer = $(".notice");
               var s = "";
               
            $.each(res, function (index, dto) {
                	  
            		  s +="<a href='detail?cnotice_Num="+dto.cnotice_Num+"' style='text-decoration: none; color:black;'>";
                      s += "<div style='width: 30vh; height: 40vh; border: 1px solid #333333; margin: 1vh; border-radius: 1vh; overflow: hidden; float: left;'>";
                      s += "<img src='../noticeImg/" + dto.cnotice_Image + "' style='width: 100%; height: 30%;'><br><br>";
                      s += "<div style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>";
                      s += "  <b>" + dto.cnotice_Name + "</b><br><br>";
                      s += "  <small>" + dto.cnotice_Team + "</small><br>";
                      s += "  <b style='font-size: 1.5vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + dto.cnotice_Job + " I " + dto.cnotice_Area + "</b><br>";
                      s += "  <b style='font-size: 1vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + (dto.cnotice_Info !== "" ? dto.cnotice_Info : "<br>") + "</b>";
                      s += "</div>";
                      s += "<hr style='margin-right: 1vh;'>";
                      s += "<div style='display: flex; justify-content: space-between;'>";
                      s += "  <div>";
                      s += "    <b style='font-size: 1.5vh;'>" + 
                      (dto.cnotice_Passmoney !== 0 ? 
                          "<i class='bi bi-trophy-fill' style='color: gold;'></i> 합격축하금 " + dto.cnotice_Passmoney + "만원" : 
                          "<i class='bi bi-emoji-frown-fill' style='color: red;'></i> 합격축하금 없음") + 
                      "</b>";


                      s += "  </div>";
                      
                      // 날짜 포맷 변경
                      var deadlineDate = new Date(dto.cnotice_Deadline);
                      var formattedDeadline = formatDate(deadlineDate, "MM-dd");

                      s += "  <div>";
                      s += "    <b style='font-size: 1vh; text-align: right; color: gray; margin-right: 1vh; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>~" + formattedDeadline + "</b>";
                      s += "  </div>";
                      s += "</div>";
                      s += "<div style='display: none;'>" + dto.cnotice_Readcount + " " + dto.cnotice_Academic + " " + dto.cnotice_Career + "</div><br>";
                      s += "</div></a>";
                      
                      if ((index + 1) % 4 === 0) {
                          s += "<br>";
                      }
                  });
            
                  noticeContainer.html(s); // 생성된 HTML로 교체
              
              }
          });
      }
</script>
</head>
<body>
<!-- 각버튼마다 정렬이다른 list호출-->
<!-- 왜 if문 밖에서는 margin-left와 border-radius만 적용되고 if문 안에서는 margin-top만 적용되는지:
if문 밖에서는 각각의 <div>가 가로로 나열되는데, 그때는 margin-top이 필요하지 않습니다. 그래서 if문 밖에서는 margin-left와 border-radius만 설정하였습니다.
if문 안에서는 세 번째 <div>가 나타날 때까지의 간격을 주기 위해 margin-top을 사용하였습니다. margin-left와 border-radius는 이미 첫 번째 <div>에서 설정되었기 때문에 if문 안에서는 따로 설정할 필요가 없습니다 -->
<div style="width: 130vh;" class="container">
<div align="left">

<b style="font-size: 2em;">직무 전체&nbsp;<i class="bi bi-three-dots-vertical"></i></b>&nbsp;
<b style="color: gray; cursor: pointer;" class="job">직무를 선택해주세요&nbsp;<i class="bi bi-caret-down-square"></i></b>
<button type="button" onclick="location.href='addForm'" class="btn btn-primary">채용공고등록</button>
</div>
<br><br>
<div class="d-flex align-items-center">
    <button type="button" class="btn btn-outline-light area" style="width: 15%; border: 1px solid gray;"><b style="color: black; font-size: 0.8em;">
        지역&nbsp;<i class="bi bi-caret-down-fill"></i></b></button>&nbsp;
    <button type="button" class="btn btn-outline-light career" style="width: 15%; border: 1px solid gray;"><b style="color: black; font-size: 0.8em">
        경력&nbsp;<i class="bi bi-caret-down-fill"></i></b></button>&nbsp;
    <button type="button" class="btn btn-outline-light academic" style="width: 15%; border: 1px solid gray;"><b style="color: black; font-size: 0.8em">
        학력&nbsp;<i class="bi bi-caret-down-fill"></i></b></button>&nbsp;
</div>

<hr style="width: 100%;">

<!-- <img src="../image/test.PNG" style="width: 127vh;"> -->
<br><br>
<div align="right">
<select class="form-select" style="width: 15vw; text-align: center;" name="sort" id="orderBy">
    <option class="passmoney" selected="selected">합격축하금 높은 순</option>
    <option class="readcount">조회수 높은 순</option>
    <option class="writeday">최신순</option>
    <option class="deadline">마감임박순</option>
     
  </select>
</div>

<br>
<br>
<br>
<div align="left">
<b style="color: gray;">총 ? 건</b><!-- 토탈카운트 -->
</div>
<br>
<br>

<hr style="width: 100%;" align="center">

<!-- list 출력 div -->
<div class="notice" style="width: 130vh;"></div>
</div>

<!-- 직종 Modal -->
<div class="modal" id="jobModal">
  <div class="modal-dialog" style="max-width: 31vw;" align="center"> <!-- 원하는 max-width 및 width 값을 설정하세요 -->
    <div class="modal-content">
      <!-- 직종 Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- 직종 Modal body -->
      <div class="modal-body">  
<%
    String jobString = "전체,기획⦁전략,법무⦁총무⦁사무,인사⦁HR,회계⦁세무,마케팅⦁광고⦁MD,개발⦁데이터,디자인,물류⦁무역,운전⦁운송⦁배송,영업,고객상담⦁TM,금융⦁보험,식⦁음료,고객서비스⦁리테일,엔지니어링⦁설계,제조⦁생산,교육,건축⦁시설,의료⦁바이오,미디어⦁문화⦁스포츠,공공⦁복지";
    String[] jobArray = jobString.split(",");
    pageContext.setAttribute("jobArray", jobArray);
%>
<c:forEach var="token" items="${jobArray}" varStatus="loop">
    <c:set var="index" value="${loop.index + 1}"/>
    <button type="button" style="background-color: #f8f8f8; border: 1px solid gray; 
    margin-top: 1vw; border-radius: 0.5vh;" 
            class="modalbtn-job ${token == '전체' ? 'job-allbtn' : 'job-otherbtn'}"> 
        <!-- "전체"라는 이름을 가진 버튼에 대해서는 allbtn 클래스가 적용 -->
        ${token}
    </button>
    <c:if test="${index % 4 == 0}">
        <br>
    </c:if>
</c:forEach>
      </div>
   <!-- 직종 Modal footer -->
   <div class="modal-footer d-flex justify-content-center">
   <br><br>
    <button type="button" class="btn btn-light job-reset" data-dismiss="modal">초기화</button>
    <button type="button" class="btn btn-success job-apply" data-bs-dismiss="modal">적용하기</button>
    <br><br>
   </div>
    </div>
  </div>
</div>
<!-- ---------------------------------------------------------------------------------------------------------- -->
<!-- 지역 Modal -->
<div class="modal" id="areaModal">
   <div class="modal-dialog" style="max-width: 16vw;" align="center"> <!-- 원하는 max-width 및 width 값을 설정하세요 -->
    <div class="modal-content">
      <!-- 지역 Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- 지역 Modal body -->
      <div class="modal-body">
    <%
      String areaString = "전체,서울,경기,인천,대전,세종,충남,충북,광주,전남,전북,대구,경북,부산,울산,경남,강원,제주,해외";
      String[] areaArray = areaString.split(",");
      pageContext.setAttribute("areaArray", areaArray);
    %>
   <c:forEach var="token" items="${areaArray}" varStatus="loop">
    <c:set var="index" value="${loop.index + 1}"/>
    <button type="button" 
            style="background-color: #f8f8f8; border: 1px solid gray;
                   border-radius: 0.5vh; margin-top: 1vw;" 
            class="modalbtn-area ${token == '전체' ? 'area-allbtn' : 'area-otherbtn'}"> 
        <!-- "전체"라는 이름을 가진 버튼에 대해서는 allbtn 클래스가 적용 -->
        ${token}
    </button>
    <c:if test="${index % 4 == 0}">
        <br>
    </c:if>
</c:forEach>
      </div>
   <!-- 지역 Modal footer -->
   <div class="modal-footer d-flex justify-content-center">
   <br><br>
    <button type="button" class="btn btn-light area-reset" data-dismiss="modal">초기화</button>
    <button type="button" class="btn btn-success area-apply" data-bs-dismiss="modal">적용하기</button>
    <br><br>
   </div>
    </div>
  </div>
</div>
<!-- -------------------------------------------------------------------------------------------------- -->
<!-- 경력 Modal -->
<div class="modal" id="careerModal">
   <div class="modal-dialog" style="max-width: 16vw;" align="center"> <!-- 원하는 max-width 및 width 값을 설정하세요 -->
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
    <%
      String careerString = "경력무관,신입,경력";
      String[] careerArray = careerString.split(",");
      pageContext.setAttribute("careerArray", careerArray); 
    %>
<c:forEach var="token" items="${careerArray}" varStatus="loop">
    <c:set var="index" value="${loop.index + 1}"/>
    <button type="button" 
            style="background-color: #f8f8f8; border: 1px solid gray;
                   border-radius: 0.5vh; margin-top: 1vw;" 
            class="modalbtn-career ${token == '경력무관' ? 'career-allbtn' : 'career-otherbtn'}"> 
        <!-- "전체"라는 이름을 가진 버튼에 대해서는 allbtn 클래스가 적용 -->
        ${token}
    </button>
    <c:if test="${index % 3 == 0}">
        <br>
    </c:if>
</c:forEach>
      </div>
   <!-- Modal footer -->
   <div class="modal-footer d-flex justify-content-center">
   <br><br>
    <button type="button" class="btn btn-light career-reset" data-dismiss="modal">초기화</button>
    <button type="button" class="btn btn-success career-apply" data-bs-dismiss="modal">적용하기</button>
    <br><br>
   </div>
    </div>
  </div>
</div>
<!-- ------------------------------------------------------------------------------------------------------------ -->
<!-- 학력modal -->
<div class="modal" id="academicModal">
  <div class="modal-dialog" style="max-width: 25vw;" align="center"> <!-- 원하는 max-width 및 width 값을 설정하세요 -->
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
    <%
      String academicString = "학력무관,고졸이상,초대졸이상,대졸이상,대학원(석사)이상,대학원(박사)이상";
      String[] academicArray = academicString.split(",");
      pageContext.setAttribute("academicArray", academicArray);
    %>
<c:forEach var="token" items="${academicArray}" varStatus="loop">
    <c:set var="index" value="${loop.index + 1}"/>
    <button type="button" 
            style="background-color: #f8f8f8; border: 1px solid gray;
                   border-radius: 0.5vh; margin-top: 1vw;" 
            class="modalbtn-academic ${token == '학력무관' ? 'academic-allbtn' : 'academic-otherbtn'}"> 
        <!-- "전체"라는 이름을 가진 버튼에 대해서는 allbtn 클래스가 적용 -->
        ${token}
    </button>
    <c:if test="${index % 3 == 0}">
        <br>
    </c:if>
</c:forEach>
      </div>
    <!-- Modal footer -->
    <div class="modal-footer d-flex justify-content-center">
    <br><br>
    <button type="button" class="btn btn-light academic-reset" data-dismiss="modal">초기화</button>
    <button type="button" class="btn btn-success academic-apply" data-bs-dismiss="modal">적용하기</button>
    <br><br>
   </div>
    </div>
  </div>
</div>
</body>
</html>