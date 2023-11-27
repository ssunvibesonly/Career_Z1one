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
  margin: 20vh -7.5vh; 

}

#areaModal{
position: absolute;
  margin: 31vh -37.75vh;
}

#careerModal{
position: absolute;
  margin: 31vh -27.1vh;
}

#academicModal{
position: absolute;
margin: 31vh -6.6vh;
} 

.notice > div {
  text-align: left;
}

.notice > div > div{
  margin-left: 1vh;
}


</style>

<script type="text/javascript">

$(function() {

   //디폴트리스트호출
   passmoneylist();
   
   //select의 option을 선택했을때 정렬 
    $('#orderBy').change(function() {
       // 선택된 옵션의 클래스를 가져옴
       var selectedClass = $('option:selected', this).attr('class');
      //alert(selectedClass);
      
      if(selectedClass=='passmoney') {

         passmoneylist();
         
      } else if (selectedClass=='readcount') {
         
         readcountlist();
         
      } else if (selectedClass=='writeday') {
         
         writedaylist();
         
      } else if (selectedClass=='deadline') 
         
         deadlinelist();
     }); 

   //직종버튼클릭시 job모달열림
   $(".job").click(function() {
      
      $("#jobModal").modal("show");
      
     });
     
       //각 라벨을 클릭했을 때 처리할 이벤트
       $(".category-label").click(function() {
           //클릭한 라벨의 데이터 속성에서 변수를 가져옵니다.
           var categoryValue = $(this).data("category");
           alert(categoryValue);
           
           //클릭한 변수에 따라 다른 체크박스 보여주기
           showCheckboxes(categoryValue);
       });

       //체크박스를 보여주는 함수
       function showCheckboxes(categoryValue) {
           //모든 결과 숨기기
           $(".jobresult").hide();

           //선택된 결과만 보여주기
           $(".jobresult" + categoryValue).show();
       }
       
   //직종모달열림
   $(".career").click(function() {
      
      $("#careerModal").modal("show");
       
     });
   
   //지역모달열림
   $(".area").click(function () {
      
       $("#areaModal").modal("show");    
   });
   
   //학력모달열림
   $(".academic").click(function() {
      
      $("#academicModal").modal("show");
   });
   
   
   // 초기 설정
   var allBtnClicked = true;
   $(".allbtn").addClass("clicked").css({
       "background-color": "white" ,
       "border":"3px solid black"
   });
   
   function updateAllBtnStyle() {
      $(document).on("click",".allbtn",function(){
         $(".allbtn").addClass("clicked").css({
              "background-color": "white" ,
              "border":"3px solid black"
          });
      })
   }

   // 전체버튼 초기 스타일 설정
   updateAllBtnStyle();

   $(".modalbtn-job").click(function () {
       // 현재 버튼이 allbtn인지 확인
       if ($(this).hasClass("allbtn")) {
           // 클릭 상태에 따라 스타일 변경
           allBtnClicked = !allBtnClicked;
           updateAllBtnStyle();

           // allbtn이 아닌 버튼의 클릭 상태 제거 및 스타일 변경
           $(".otherbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });
           
       } else {
           // allbtn이 아닌 버튼을 클릭한 경우
           // 클릭 상태에 따라 스타일 변경
           $(this).toggleClass("clicked").css({
               "background-color": $(this).hasClass("clicked") ? "white" : "#f8f8f8",
               "border": $(this).hasClass("clicked") ? "3px solid black" : "1px solid gray"
           });

           // allbtn 버튼의 클릭 상태 제거 및 스타일 변경
           $(".allbtn").removeClass("clicked").css({
               "background-color": "#f8f8f8",
               "border": "1px solid gray"
           });
       }
       
   });
   
   $(".apply").click(function () {
       // 클릭된 버튼 변수에 할당
       var clickedButtons = $(".modalbtn-job.clicked");

       // 클릭된 버튼들의 정보를 담을 배열
       var tokkens = [];

       // 각 클릭된 버튼에 대한 정보 확인
       clickedButtons.each(function () {
           // 내가 클릭한 버튼의 text
           var tokken = $(this).text().trim();
           tokkens.push(tokken);
       });

       // 클릭된 버튼들의 정보를 합쳐서 문자열로 만듭니다.
       var tokkenString = tokkens.join(',');

       // alert를 클릭된 버튼 확인 후에 실행
       alert(tokkenString);

       // 전체 버튼의 text
       var alltext = $(".allbtn").text().trim();

       // 내가 선택한 버튼이 tokken에서 가져온 text와 같을 때
       if (tokkenString == alltext) {
           // defaullist 호출
           passmoneylist();
       } else {
           // jobList 호출
           jobList(tokkens);
       }
   });


   // 모달창 내 초기화 버튼
   $(".reset").click(function () {
       // 모든 버튼 초기화
       $(".modalbtn-job").removeClass("clicked").css({
           "background-color": "#f8f8f8",
           "border": "1px solid gray"
       });

       // 전체버튼의 클릭 상태 업데이트 및 스타일 변경
       
       allBtnClicked = true;
       $(".allbtn").addClass("clicked").css({
           "background-color": "white" ,
           "border":"3px solid black"
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
});

//합격축하금 높은순 default
function passmoneylist() {
    $.ajax({
        type: "get",
        dataType: "json",
        url: "/company/passmoney",
        success: function (res) {
            var noticeContainer = $(".notice");
            var s = "";

            $.each(res, function (index, dto) {
                s += "<div style='width: 30vh; height: 40vh; border: 1px solid #333333; margin: 1vh; border-radius: 1vh; overflow: hidden; float: left;' align='center'>";
                s += "<img src='../notice/" + dto.cnotice_Image + "' style='width: 100%; height: 30%;'><br><br>";
                s += "<div style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>";
                s += "  <b>" + dto.cnotice_Name + "</b><br><br>";
                s += "  <small>" + dto.cnotice_Team + "</small><br>";
                s += "  <b style='font-size: 1.5vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + dto.cnotice_Job + " I " + dto.cnotice_Area + "</b><br>";
                s += "  <b style='font-size: 1vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + (dto.cnotice_Info !== "" ? dto.cnotice_Info : "<br>") + "</b>";
                s += "</div>";
                s += "<hr style='margin-right: 1vh;'>";
                s += "<div style='display: flex; justify-content: space-between;'>";
                s += "  <div>";
                s += "    <i class='bi bi-trophy-fill' style='color: gold;'></i>";
                s += "    <b style='font-size: 1.5vh;'>합격축하금 " + dto.cnotice_Passmoney + "만원</b>";
                s += "  </div>";
                
                // 날짜 포맷 변경
                var deadlineDate = new Date(dto.cnotice_Deadline);
                var formattedDeadline = formatDate(deadlineDate, "MM-dd");

                s += "  <div>";
                s += "    <b style='font-size: 1vh; text-align: right; color: gray; margin-right: 1vh; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>~" + formattedDeadline + "</b>";
                s += "  </div>";
                s += "</div>";
                s += "<div style='display: none;'>" + dto.cnotice_Readcount + " " + dto.cnotice_Academic + " " + dto.cnotice_Career + "</div><br>";
                s += "</div>";

                if ((index + 1) % 4 === 0) {
                    s += "<br>";
                }
            });

            noticeContainer.html(s); // 생성된 HTML로 교체
        }
    });
}

// 날짜 형식을 변환하는 함수
function formatDate(date, format) {
    var MM = String(date.getMonth() + 1).padStart(2, '0');
    var dd = String(date.getDate()).padStart(2, '0');
    // 원하는 날짜 형식에 따라 추가적인 처리를 수행할 수 있습니다.

    return format.replace('MM', MM).replace('dd', dd);
}

   //조회수순
   function readcountlist() {
        $.ajax({
              type: "get",
              dataType: "json",
              url: "/company/readcount",
              success: function (res) {
                  var noticeContainer = $(".notice");
                  var s = "";

                  $.each(res, function (index, dto) {
                      s += "<div style='width: 30vh; height: 40vh; border: 1px solid #333333; margin: 1vh; border-radius: 1vh; overflow: hidden; float: left;' align='center'>";
                      s += "<img src='../notice/" + dto.cnotice_Image + "' style='width: 100%; height: 30%;'><br><br>";
                      s += "<div style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>";
                      s += "  <b>" + dto.cnotice_Name + "</b><br><br>";
                      s += "  <small>" + dto.cnotice_Team + "</small><br>";
                      s += "  <b style='font-size: 1.5vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + dto.cnotice_Job + " I " + dto.cnotice_Area + "</b><br>";
                      s += "  <b style='font-size: 1vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + (dto.cnotice_Info !== "" ? dto.cnotice_Info : "<br>") + "</b>";
                      s += "</div>";
                      s += "<hr style='margin-right: 1vh;'>";
                      s += "<div style='display: flex; justify-content: space-between;'>";
                      s += "  <div>";
                      s += "    <i class='bi bi-trophy-fill' style='color: gold;'></i>";
                      s += "    <b style='font-size: 1.5vh;'>합격축하금 " + dto.cnotice_Passmoney + "만원</b>";
                      s += "  </div>";
                      
                      // 날짜 포맷 변경
                      var deadlineDate = new Date(dto.cnotice_Deadline);
                      var formattedDeadline = formatDate(deadlineDate, "MM-dd");

                      s += "  <div>";
                      s += "    <b style='font-size: 1vh; text-align: right; color: gray; margin-right: 1vh; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>~" + formattedDeadline + "</b>";
                      s += "  </div>";
                      s += "</div>";
                      s += "<div style='display: none;'>" + dto.cnotice_Readcount + " " + dto.cnotice_Academic + " " + dto.cnotice_Career + "</div><br>";
                      s += "</div>";

                      if ((index + 1) % 4 === 0) {
                          s += "<br>";
                      }
                  });

                  noticeContainer.html(s); // 생성된 HTML로 교체
              }
          });
      }
   
   //최신순
   function writedaylist() {
        $.ajax({
              type: "get",
              dataType: "json",
              url: "/company/writeday",
              success: function (res) {
                  var noticeContainer = $(".notice");
                  var s = "";

                  $.each(res, function (index, dto) {
                      s += "<div style='width: 30vh; height: 40vh; border: 1px solid #333333; margin: 1vh; border-radius: 1vh; overflow: hidden; float: left;' align='center'>";
                      s += "<img src='../notice/" + dto.cnotice_Image + "' style='width: 100%; height: 30%;'><br><br>";
                      s += "<div style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>";
                      s += "  <b>" + dto.cnotice_Name + "</b><br><br>";
                      s += "  <small>" + dto.cnotice_Team + "</small><br>";
                      s += "  <b style='font-size: 1.5vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + dto.cnotice_Job + " I " + dto.cnotice_Area + "</b><br>";
                      s += "  <b style='font-size: 1vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + (dto.cnotice_Info !== "" ? dto.cnotice_Info : "<br>") + "</b>";
                      s += "</div>";
                      s += "<hr style='margin-right: 1vh;'>";
                      s += "<div style='display: flex; justify-content: space-between;'>";
                      s += "  <div>";
                      s += "    <i class='bi bi-trophy-fill' style='color: gold;'></i>";
                      s += "    <b style='font-size: 1.5vh;'>합격축하금 " + dto.cnotice_Passmoney + "만원</b>";
                      s += "  </div>";
                      
                      // 날짜 포맷 변경
                      var deadlineDate = new Date(dto.cnotice_Deadline);
                      var formattedDeadline = formatDate(deadlineDate, "MM-dd");

                      s += "  <div>";
                      s += "    <b style='font-size: 1vh; text-align: right; color: gray; margin-right: 1vh; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>~" + formattedDeadline + "</b>";
                      s += "  </div>";
                      s += "</div>";
                      s += "<div style='display: none;'>" + dto.cnotice_Readcount + " " + dto.cnotice_Academic + " " + dto.cnotice_Career + "</div><br>";
                      s += "</div>";

                      if ((index + 1) % 4 === 0) {
                          s += "<br>";
                      }
                  });

                  noticeContainer.html(s); // 생성된 HTML로 교체
              }
          });
      }
   
   //마감일순
   function deadlinelist() {
        $.ajax({
              type: "get",
              dataType: "json",
              url: "/company/deadline",
              success: function (res) {
                  var noticeContainer = $(".notice");
                  var s = "";

                  $.each(res, function (index, dto) {
                      s += "<div style='width: 30vh; height: 40vh; border: 1px solid #333333; margin: 1vh; border-radius: 1vh; overflow: hidden; float: left;' align='center'>";
                      s += "<img src='../notice/" + dto.cnotice_Image + "' style='width: 100%; height: 30%;'><br><br>";
                      s += "<div style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>";
                      s += "  <b>" + dto.cnotice_Name + "</b><br><br>";
                      s += "  <small>" + dto.cnotice_Team + "</small><br>";
                      s += "  <b style='font-size: 1.5vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + dto.cnotice_Job + " I " + dto.cnotice_Area + "</b><br>";
                      s += "  <b style='font-size: 1vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + (dto.cnotice_Info !== "" ? dto.cnotice_Info : "<br>") + "</b>";
                      s += "</div>";
                      s += "<hr style='margin-right: 1vh;'>";
                      s += "<div style='display: flex; justify-content: space-between;'>";
                      s += "  <div>";
                      s += "    <i class='bi bi-trophy-fill' style='color: gold;'></i>";
                      s += "    <b style='font-size: 1.5vh;'>합격축하금 " + dto.cnotice_Passmoney + "만원</b>";
                      s += "  </div>";
                      
                      // 날짜 포맷 변경
                      var deadlineDate = new Date(dto.cnotice_Deadline);
                      var formattedDeadline = formatDate(deadlineDate, "MM-dd");

                      s += "  <div>";
                      s += "    <b style='font-size: 1vh; text-align: right; color: gray; margin-right: 1vh; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>~" + formattedDeadline + "</b>";
                      s += "  </div>";
                      s += "</div>";
                      s += "<div style='display: none;'>" + dto.cnotice_Readcount + " " + dto.cnotice_Academic + " " + dto.cnotice_Career + "</div><br>";
                      s += "</div>";

                      if ((index + 1) % 4 === 0) {
                          s += "<br>";
                      }
                  });

                  noticeContainer.html(s); // 생성된 HTML로 교체
              }
          });
      }
   
// jobList 함수 수정
   function jobList(tokkens) {
   //alert(tokkenString);
       $.ajax({
           type: "get",
           dataType: "json",
           url: "/company/joblist",
           traditional: true, // 수정된 부분
           data: {"cnotice_Job": tokkens},
           success: function (res) {
               var noticeContainer = $(".notice");
               var s = "";
               
            $.each(res, function (index, dto) {
                     
                      s += "<div style='width: 30vh; height: 40vh; border: 1px solid #333333; margin: 1vh; border-radius: 1vh; overflow: hidden; float: left;' align='center'>";
                      s += "<img src='../notice/" + dto.cnotice_Image + "' style='width: 100%; height: 30%;'><br><br>";
                      s += "<div style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>";
                      s += "  <b>" + dto.cnotice_Name + "</b><br><br>";
                      s += "  <small>" + dto.cnotice_Team + "</small><br>";
                      s += "  <b style='font-size: 1.5vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + dto.cnotice_Job + " I " + dto.cnotice_Area + "</b><br>";
                      s += "  <b style='font-size: 1vh; color: gray; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>" + (dto.cnotice_Info !== "" ? dto.cnotice_Info : "<br>") + "</b>";
                      s += "</div>";
                      s += "<hr style='margin-right: 1vh;'>";
                      s += "<div style='display: flex; justify-content: space-between;'>";
                      s += "  <div>";
                      s += "    <i class='bi bi-trophy-fill' style='color: gold;'></i>";
                      s += "    <b style='font-size: 1.5vh;'>합격축하금 " + dto.cnotice_Passmoney + "만원</b>";
                      s += "  </div>";
                      
                      // 날짜 포맷 변경
                      var deadlineDate = new Date(dto.cnotice_Deadline);
                      var formattedDeadline = formatDate(deadlineDate, "MM-dd");

                      s += "  <div>";
                      s += "    <b style='font-size: 1vh; text-align: right; color: gray; margin-right: 1vh; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>~" + formattedDeadline + "</b>";
                      s += "  </div>";
                      s += "</div>";
                      s += "<div style='display: none;'>" + dto.cnotice_Readcount + " " + dto.cnotice_Academic + " " + dto.cnotice_Career + "</div><br>";
                      s += "</div>";

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
<div align="center" style="width: 128vh;">
<div align="left">
<b style="font-size: 30px;">직무 전체&nbsp;<i class="bi bi-three-dots-vertical"></i></b>&nbsp;
<b style="color: gray; cursor: pointer;" class="job">직무를 선택해주세요&nbsp;<i class="bi bi-caret-down-square"></i></b>
</div>
<br><br>
<div class="d-flex align-items-center">
    <button type="button" class="btn btn-outline-light area" style="width: 10vh; height: 5vh;"><b style="color: black;">
        지역&nbsp;<i class="bi bi-caret-down-fill"></i></b></button>&nbsp;
    <button type="button" class="btn btn-outline-light career" style="width: 10vh; height: 5vh;"><b style="color: black;">
        경력&nbsp;<i class="bi bi-caret-down-fill"></i></b></button>&nbsp;
    <button type="button" class="btn btn-outline-light academic" style="width: 10vh; height: 5vh;"><b style="color: black;">
        학력&nbsp;<i class="bi bi-caret-down-fill"></i></b></button>&nbsp;
        
    <form action="list" style="margin-left: 63.3vh;" class="d-inline-flex">
        <!-- <select class="form-select" style="width: 150px;" name="searchcolumn"> 컬럼
            <option value="subject">제목</option>
            <option value="content">내용</option>
        </select>&nbsp; -->
   <div class="input-group" style="margin-left: 3vh;">
    <input type="text" name="searchword" class="form-control" style="height: 5vh; width: 25vh;"
        placeholder="기업명, 공고명 검색">
    <div class="input-group-append">
        <span class="input-group-text" style="height: 5vh;">
            <i class="bi bi-search" style="cursor: pointer;"></i>
        </span>
    </div>
   </div>
    </form>
</div>

<hr style="width: 100%;" align="center">

<img src="../image/test.PNG" style="width: 127vh;">
<br><br>
<div align="right">
<select class="form-select" style="width: 150px;" name="sort" id="orderBy">
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
<b style="color: gray;">총 ${totalcount} 건</b><!-- 토탈카운트 -->
</div>
<br>
<br>

<hr style="width: 100%;">

<!-- 합격금높은순 default list -->
<div class="notice"></div>
</div>

<!-- 직종 Modal -->
<div class="modal" id="jobModal">
  <div class="modal-dialog" style="max-width: 91vh;" align="center"> <!-- 원하는 max-width 및 width 값을 설정하세요 -->
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      
<%
    String jobString = "전체,기획⦁전략,법무⦁총무⦁사무,인사⦁HR,회계⦁세무,마케팅⦁광고⦁MD,개발⦁데이터,디자인,물류⦁무역,운전⦁운송⦁배송,영업,고객상담⦁TM,금융⦁보험,식⦁음료,고객서비스⦁리테일,엔지니어링⦁설계,제조⦁생산,교육,건축⦁시설,의료⦁바이오,미디어⦁문화⦁스포츠,공공⦁복지";
    String[] jobArray = jobString.split(",");
    pageContext.setAttribute("jobArray", jobArray);
%>

<c:forEach var="tokken" items="${jobArray}" varStatus="loop">
    <c:set var="index" value="${loop.index + 1}"/>
    <button type="button" 
            style="background-color: #f8f8f8; width: 20vh; border: 1px solid gray;
                   border-radius: 0.5vh; height: 8vh; margin: 5px;" 
            class="modalbtn-job ${tokken == '전체' ? 'allbtn' : 'otherbtn'}"> 
        <!-- "전체"라는 이름을 가진 버튼에 대해서는 allbtn 클래스가 적용 -->
        ${tokken}
    </button>

    <c:if test="${index % 4 == 0}">
        <br>
    </c:if>
</c:forEach>

      </div>

   <!-- Modal footer -->
   <div class="modal-footer d-flex justify-content-center">
   <br><br>
    <button type="button" class="btn btn-light reset" data-dismiss="modal">초기화</button>
    <button type="button" class="btn btn-success apply" data-bs-dismiss="modal">적용하기</button>
    <br><br>
   </div>
    </div>
  </div>
</div>

<!-- 지역 Modal -->
<div class="modal" id="areaModal">
   <div class="modal-dialog" style="max-width: 91vh;" align="center"> <!-- 원하는 max-width 및 width 값을 설정하세요 -->
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">


    <%
      String areaString = "전체,서울,경기,인천,대전,세종,충남,충북,광주,전남,전북,대구,경북,부산,울산,경남,강원,제주,해외";
      pageContext.setAttribute("areaString", areaString);
    %>

   <c:forTokens var="token" items="${areaString}" delims=",">
    <c:set var="index" value="${loop.index + 1}" />
    <button type="button" style="background-color: #f8f8f8; width: 20vh; 
        border-radius: 0.5vh; height: 8vh; margin: 5px;" onclick="showAlert(${index})">
        ${token}
    </button>

    <c:if test="${index % 4 == 0}">
        <br>
    </c:if>
</c:forTokens>




      </div>

   <!-- Modal footer -->
   <div class="modal-footer d-flex justify-content-center">
   <br><br>
    <button type="button" class="btn btn-light" data-dismiss="modal">초기화</button>
    <button type="button" class="btn btn-success" data-bs-dismiss="modal">적용하기</button>
    <br><br>
   </div>
    </div>
  </div>
</div>

<!-- 경력 Modal -->
<div class="modal" id="careerModal">
   <div class="modal-dialog" style="max-width: 69vh;" align="center"> <!-- 원하는 max-width 및 width 값을 설정하세요 -->
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">

    <%
      String careerString = "경력무관,신입,경력";
      pageContext.setAttribute("careerString", careerString);
    %>

   <c:forTokens var="token" items="${careerString}" delims=",">
        <c:set var="index" value="${loop.index + 1}" />
        <button type="button" style="background-color: #f8f8f8; width: 20vh; 
            border-radius: 0.5vh; height: 8vh; margin: 5px;">
            ${token}
        </button>

        <%-- <c:if test="${index % 3 == 0}">
            <br>
        </c:if> --%>
    </c:forTokens>

      </div>

   <!-- Modal footer -->
   <div class="modal-footer d-flex justify-content-center">
   <br><br>
    <button type="button" class="btn btn-light" data-dismiss="modal">초기화</button>
    <button type="button" class="btn btn-success" data-bs-dismiss="modal">적용하기</button>
    <br><br>
   </div>
    </div>
  </div>
</div>

<!-- 학력modal -->
<div class="modal" id="academicModal">
  <div class="modal-dialog" style="max-width: 69vh;" align="center"> <!-- 원하는 max-width 및 width 값을 설정하세요 -->
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">

    <%
      String academicString = "학력무관,고등학교졸업,대학졸업(2-3년),대학교졸업(4년),대학원 석사졸업,대학원 박사졸업";
      pageContext.setAttribute("academicString", academicString);
    %>

   <c:forTokens var="token" items="${academicString}" delims=",">
        <c:set var="index" value="${loop.index + 1}" />
        <button type="button" style="background-color: #f8f8f8; width: 20vh; 
            border-radius: 0.5vh; height: 8vh; margin: 5px;">
            ${token}
        </button>

        <%-- <c:if test="${index % 3 == 0}">
            <br>
        </c:if> --%>
    </c:forTokens>


      </div>

    <!-- Modal footer -->
    <div class="modal-footer d-flex justify-content-center">
    <br><br>
    <button type="button" class="btn btn-light" data-dismiss="modal">초기화</button>
    <button type="button" class="btn btn-success" data-bs-dismiss="modal">적용하기</button>
    <br><br>
   </div>
    </div>
  </div>
</div>

</body>
</html>