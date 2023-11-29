<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#showImg{
		border: 1px solid gray;
		width: 250px;
		height: 400px;
	}
</style>
<script type="text/javascript">
  $(function() {
	
	  $("#imgChoice").click(function() {
		
		  $("#myImg").trigger("click"); //사진선택버튼을 눌렀을때 id가 myphoto인 input에 트리거발생
	});
	  
	//사진미리보기
      //사진 미리보기
      $("#myImg").on("change", function(event) {

          var file = event.target.files[0];

          var reader = new FileReader();
          reader.onload = function(e) {

              $("#showImg").attr("src", e.target.result);
          }

          reader.readAsDataURL(file);
      });
	
      // select 요소 가져오기
      var careerSelect = document.getElementById('careerSelect');

      // 이벤트 리스너 추가
      careerSelect.addEventListener('change', function() {
          // 선택된 값 가져오기
          var selectedValue = careerSelect.value;
		  var s="";
          
          // 경력이 선택되었을 때의 처리
          if (selectedValue === '경력') {
              // 여기에 원하는 이벤트 처리를 추가하세요
              //alert('경력이 선택되었습니다.');
              s+="<input type='text' name='cnotice_Career2' class='form-control' placeholder='경력상세 ex(5년이상)' required='required' style='width: 180px;'>"
              $(".career").html(s);
          } else {
        	  $(".career").empty();
          }
      });
  });
</script>
</head>
<body>
	<div style="margin: 100px 100px;">
		<form action="insert" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="width: 600px;">
				<caption align="top"><b style="color: black;">공고등록</b></caption>
				
				<tr>
				  <td rowspan="13" align="center">
				    <input type="file" id="myImg" name="myImg" style="display: none;">
				    <br>
					<br>
					<br>
				    <img id="showImg">
				    <br>
				    <br>
				    <button type="button" id="imgChoice" class="btn btn-secondary">사진선택</button>
				  </td>
				  <td>
				  <div class="d-inline-flex">
				    <input type="text" placeholder="회사번호" name="company_Num"
				    class="form-control" required="required" style="width: 90px;">
				   <!--  <span class="idsuccess" style="width: 60px; color: green;"></span>-->
				   </div> 
				  </td>
				</tr>
				
				<tr>
				  <td>
				  	<div class="d-inline-flex">
				    <input type="text" class="form-control" name="cnotice_Name"
				    placeholder="회사명" required="required" style="width: 200px;">
				    <!-- <span class="passsucess" style="width: 60px; color: green;"></span> -->
				    </div>
				  </td>
				</tr>
				<tr>
				  <td>
				    <input type="text" name="cnotice_Team" class="form-control" placeholder="채용포지션" required="required" style="width: 250px;">
				  </td>
				</tr>
				<tr>
				  <td>
				    <input type="text" name="cnotice_Job" class="form-control" placeholder="직종" required="required" style="width: 175px;">
				  </td>
				</tr>
				<tr>
				  <td style="display: flex; align-items: center;">
				  	<select name="cnotice_Area1" style="border-radius: 5px;">
				  	<option value="서울" selected="selected">서울</option><option value="경기">경기</option><option value="인천">인천</option>
				  	<option value="대전">대전</option><option value="세종">세종</option><option value="충남">충남</option>
				  	<option value="충북">충북</option><option value="광주">광주</option><option value="전남">전남</option><option value="전북">전북</option>
				  	<option value="대구">대구</option><option value="경북">경북</option><option value="부산">부산</option><option value="울산">울산</option>
				  	<option value="경남">경남</option><option value="강원">강원</option><option value="제주">제주</option><option value="해외">해외</option>
				  	</select>&nbsp;
				  	<input type="text" name="cnotice_Area2" class="form-control" placeholder="상세주소" required="required" style="width:275px;">
				  </td>
				</tr>
				<tr>
				  <td style="display: flex; align-items: center;">
			<select name="cnotice_Career1" id="careerSelect" style="border-radius: 5px;">
    			<option value="경력무관" selected="selected">경력무관</option>
    			<option value="신입">신입</option>
    			<option value="경력">경력</option>
			</select>&nbsp;
    		 <div class="career"></div>
				  </td>
				</tr>
				<tr>
				<tr>
				  <td>
				    <select name="cnotice_Academic" style="border-radius: 5px;">
				  	<option value="학력무관" selected="selected">학력무관</option>
				  	<option value="고졸이상">고졸이상</option>
				  	<option value="초대졸이상">초대졸이상</option>
				  	<option value="대졸이상">대졸이상</option>
				  	<option value="대학원(석사)이상">대학원(석사)이상</option>
				  	<option value="대학원(박사)이상">대학원(박사)이상</option>
				  	</select>
				  </td>
				</tr>
				<tr>
			<td style="display: flex; align-items: center;">
    			<input type="text" name="cnotice_Pay" class="form-control" placeholder="연봉" required="required" style="width: 100px;">
    			&nbsp;<a>만원</a>
			</td>
				</tr>
				<tr>
				<tr>
				  <td>
				    <input type="text" name="cnotice_Info" class="form-control" placeholder="상세정보" required="required" style="width: 350px;">
				  </td>
				</tr>
				<tr>
				  <td>
				  <a>합격축하금</a>
				  <select name="cnotice_Passmoney" style="border-radius: 5px;">
				  <option value="0" selected="selected">0</option>
				  <option value="50">50만원</option>
				  <option value="100">100만원</option>
				  </select>
				    <!-- <input type="text" name="cnotice_Passmoney" class="form-control" placeholder="합격축하금" required="required"> -->
				  </td>
				</tr>
				<tr>
				  <td style="display: flex; align-items: center;">
				    <a>마감일</a>&nbsp;<input type="date" name="cnotice_Deadline" class="form-control" required="required" style="width: 122.5px;">
				  </td>
				</tr>
				<tr>
				<tr>
				  <td colspan="2" align="center">
				    <button type="submit" class="btn btn-info">등록</button>
				  <button type="button" onclick="history.back()" class="btn btn-danger">취소</button>
				  </td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>