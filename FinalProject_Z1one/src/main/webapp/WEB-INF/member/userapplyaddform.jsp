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
<style type="text/css">
.container{
width: 60%; 
}

.info{
border: 1px solid #F2F2F2;
width: 68%;
height: 23vh;
border-radius: 10px;
background-color: #F2F2F2;
}

.job{
border: 1px solid #F2F2F2;
width: 57%;
height: 24vh;
border-radius: 10px;
background-color: #F2F2F2;
}

.career{
border: 1px solid #F2F2F2;
width: 100%;
height: 45vh;
border-radius: 10px;
background-color: #F2F2F2;
}

.education{
border: 1px solid #F2F2F2;
width: 100%;
height: 24vh;
border-radius: 10px;
background-color: #F2F2F2;
}

.active{
border: 1px solid #F2F2F2;
width: 100%;
height: 30vh;
border-radius: 10px;
background-color: #F2F2F2;
}

/* date 형식에 기본 연도 placeholder 커스텀 */
input[type='date']::before {
  content: attr(data-placeholder);
  width: 100%;
}

input[type='date']:valid::before {
  display: none;
}
input[data-placeholder]::before{
  color: lightgray;
}

.story{
  padding: 10px; /* 상하 여백 조정 */
  width: 97%;
  height: 100px;
  margin: 10px 10px;
  vertical-align: top; /* 추가된 부분 */
  resize: none; /* textarea 크기 조절 비활성화 */
  border: 1px solid lightgray;
}

.two {
  text-align: center;
  cursor: pointer;
  margin-top: 1%;
 
}

.madebtn {
  position: relative;
  height: 50px;
  width: 280px;
  border: 0;
  border-radius: 20px;
  text-transform: uppercase;
  font-size: 1.1em;
  overflow: hidden;
  box-shadow: 0 4px 12px 0 rgba(152, 160, 180, 10);
  font-weight: bold;
  color: white;
  z-index:100;
}


.fill-two {
  position: absolute;
  background-image: linear-gradient(to right, #E040FB, #00BCD4);
  background-size: 150% 150%;
  height: 70px;
  width: 420px;
  border-radius: 20px;
  margin: -40px 0 0 -140px;
  z-index: -1;
  transition: all 0.4s ease;
}

.two:hover .fill-two {
  -webkit-animation: gradient 3s ease infinite;
  -moz-animation: gradient 3s ease infinite;
  animation: gradient 3s ease infinite;
}


@-webkit-keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

@-moz-keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
  }

</style>
<title>Insert title here</title>
</head>
<body>
<br><br>
<form action="applyinsert" method="post">
<input type="hidden" name="user_num" value="${user_num}">
<div class="container">
   <h5><b>인적사항</b></h5>
   <div class="info">
      <div class="d-inline-flex">
      <input type="text" name="apply_name" value="${user_name}" placeholder="이름" style="width: 150px; height: 60px; margin: 10px 10px" class="form-control">
      <input type="date" name="apply_birth" data-placeholder="생년월일" required style="width: 150px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)"> 
      <select name="apply_gender" placeholder="성별" style="width: 100px; height: 60px; margin: 10px 10px" class="form-control">
         <option value="남자">남자</option>
         <option value="여자">여자</option>
      </select> 
      <div class="photo123" style="width: 120px; height: 140px; border: 1px solid #F2F2F2; margin: 10px 10px; background-color: #FAFAFA;" ></div>
   	  </div>
   	  <br>
   	  <div class="d-inline-flex" style="position: absolute; top: 270px;">
   	  <input type="text" name="apply_hp" placeholder="휴대폰번호" style="width: 200px; height: 60px; margin: 10px 10px" class="form-control">
   	  <input type="text" name="apply_addr" placeholder="주소" style="width: 217px; height: 60px; margin: 10px 10px" class="form-control">
   	  </div>
   </div>
</div>
<br>

<div class="container">
	<h5><b>희망근무조건</b></h5>
	<div class="job">
		<div class="d-inline-flex">
			<select name="apply_primary" placeholder="1차 직종" style="width: 225px; height: 60px; margin: 10px 10px; border: 1px solid lightgray; border-radius: 6px" oninput="updateInput(this)">
		        <option value="1차 직종">1차 직종</option>
		        <option value="여자">여자</option>
		    </select>
		    <select name="apply_secondary" placeholder="2차 직종" style="width: 225px; height: 60px; margin: 10px 10px; border: 1px solid lightgray; border-radius: 6px" >
		        <option value="2차 직종">2차 직종</option>
		        <option value="여자">여자</option>
		    </select>  
		</div>
		<div class="d-inline-flex">
			<input type="text" name="apply_salary" placeholder="희망연봉" style="width: 100px; height: 60px; margin: 10px 10px" class="form-control">
			<label for="career_salary" style="margin: 45px -5px; font-size: 0.7em"><b>만원</b></label>
			<input type="text" name="apply_region" placeholder="희망근무지" style="width: 330px; height: 60px; margin: 10px 20px" class="form-control">
		</div>
	</div>
</div>
<br>
<div class="container">
	<h5><b>경력</b></h5>
	<div class="career">
		<div class="d-inline-flex">
			<input type="text" name="career_companyname" placeholder="기업명" style="width: 230px; height: 60px; margin: 10px 10px" class="form-control">
			<input type="text" name="career_team" placeholder="부서" style="width: 200px; height: 60px; margin: 10px 10px" class="form-control">
			<input type="date" name="apply_duration1" data-placeholder="입사일" required style="width: 130px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)">
			<b style="margin: 25px -5px;">~</b>
			<input type="date" name="apply_duration2" data-placeholder="퇴사일" required style="width: 130px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)">
			<input type="checkbox" name="apply_check" id="apply_check" value="재직중" style=" margin:10px 5px">
			<label for="apply_check" style="margin: 30px 0px;">재직중</label>
		</div>
		<div class="d-inline-flex">
			<select name="apply_position" style="width: 100px; height: 60px; margin: 10px 10px; border: 1px solid lightgray; border-radius: 6px" >
				<option value="0">직급</option>
		        <option value="주임/계장">주임/계장</option>
		        <option value="대리">대리</option>
		        <option value="과장">과장</option>
		        <option value="차장">차장</option>
		        <option value="부장">부장</option>
		        <option value="임원">임원</option>
			</select>
			<input type="text" name="career_salary" id="career_salary" placeholder="연봉" style="width: 100px; height: 60px; margin: 10px 10px" class="form-control">
			<label for="career_salary" style="margin: 45px -5px; font-size: 0.7em"><b>만원</b></label>
			<select name="apply_primary" placeholder="1차 직종" style="width: 200px; height: 60px; margin: 10px 35px; border: 1px solid lightgray; border-radius: 6px">
		        <option value="1차 직종">1차 직종</option>
		        <option value="여자">여자</option>
		    </select>
		    <select name="apply_secondary" placeholder="2차 직종" style="width: 250px; height: 60px; margin: 10px -30px; border: 1px solid lightgray; border-radius: 6px" >
		        <option value="2차 직종">2차 직종</option>
		        <option value="여자">여자</option>
		    </select> 
		</div>
		<textarea name="career_story" class="story" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."></textarea>
	</div>
</div>
<br>
<div class="container">
	<h5><b>최종학력</b></h5>
	<div class="education">
		<div class="d-inline-flex">
			<select name="education_degree" style="width: 100px; height: 60px; margin: 10px 10px; border: 1px solid lightgray; border-radius: 6px" >
				<option value="0">학교구분</option>
		        <option value="주임/계장">주임/계장</option>
		        <option value="대리">대리</option>
		        <option value="과장">과장</option>
		        <option value="차장">차장</option>
		        <option value="부장">부장</option>
		        <option value="임원">임원</option>
			</select>
			<input type="text" name="education_name" placeholder="학교명" style="width: 200px; height: 60px; margin: 10px 0px" class="form-control">
			<input type="date" name="education_duration1" data-placeholder="입학날짜" required style="width: 130px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)">
			<b style="margin: 25px -5px;">~</b>
			<input type="date" name="education_duration2" data-placeholder="졸업날짜" required style="width: 130px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)">
			<input type="checkbox" name="apply_check" id="education_check" value="재학중" style=" margin:10px 5px">
			<label for="check" style="margin: 30px 0px;">재학중</label>
		</div>
		<div class="d-inline-flex">
			<input type="text" name="education_major" placeholder="전공명" style="width: 313px; height: 60px; margin: 10px 10px" class="form-control">
			<input type="text" name="education_score" placeholder="학점" style="width: 100px; height: 60px; margin: 10px 10px" class="form-control">
			<select name="education_score" style="width: 100px; height: 60px; margin: 10px -10px; border: 1px solid lightgray; border-radius: 6px">
				<option value="0">총점</option>
				<option value="4.5">4.5</option>
				<option value="100">100</option>				
			</select>
		</div>
	</div>
</div>
<br>
<div class="container">
	<h5><b>활동/수상</b></h5>
	<div class="active">
		<div class="d-inline-flex">
			<input type="text" name="active_name" placeholder="활동명" style="width: 313px; height: 60px; margin: 10px 10px" class="form-control">
			<input type="date" name="active_duration" data-placeholder="활동일" required style="width: 130px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)">
			<input type="checkbox" name="active_awards" id="active_awards" value="재학중" style=" margin:10px 5px">
			<label for="active_awards" style="margin: 30px 0px;">수상여부</label>
		</div>
		<textarea name="active_story" class="story" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."></textarea>
	</div>
</div>
<div class="two" id="btnbox">
      <button type="submit" id="mbtn" class="madebtn">
        작성완료
        <div class="fill-two"></div></button></div><br>
</form>
<c:if test="${sessionScope.myid !=null}">
	<b style="font-size:14px;">✔${sessionScope.myid} 로그인중 </b>
	<button type="button" id="btn" class="btn btn-info" onclick="location.href='/email/sendEmail?user_email=${sessionScope.myid}'">채용 공고 받기
	</button>
</c:if>
</body>



</html>