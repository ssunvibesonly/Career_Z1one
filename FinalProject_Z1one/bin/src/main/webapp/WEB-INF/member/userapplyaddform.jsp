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
width: 88%;
height: 27vh;
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

#showimg{
width: 120px;
height: 140px;
border: 1px solid #F2F2F2; 
margin: 10px 10px; 
background-color: #FAFAFA;
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
<form action="applyinsert" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_num" value="${user_num}">
<div class="container">
   <h5><b>인적사항</b></h5>
   <div class="info">
      <div class="d-inline-flex">
      <input type="text" required="required" name="apply_name" value="${user_name}" placeholder="이름" style="width: 170px; height: 60px; margin: 10px 10px" class="form-control">
      <input type="date" required="required" name="apply_birth" data-placeholder="생년월일" required style="width: 190px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)"> 
      <select name="apply_gender" required="required" style="width: 100px; height: 60px; margin: 10px 10px" class="form-control">
         <option value="" selected disabled>성별</option>
         <option value="남자">남자</option>
         <option value="여자">여자</option>
      </select> 
      <select name="apply_newcomer" required="required" style="width: 100px; height: 60px; margin: 10px 10px" class="form-control">
         <option value="" selected disabled>경력여부</option>
         <option value="신입">신입</option>
         <option value="경력">경력</option>
      </select> 
      <input type="file" name="userphoto" id="userphoto" style="display: none;">
        <img id="showimg">  	 
   	  </div>
   	  <button type="button" id="btnphoto" required="required" class="btn btn-secondary" style="width: 60px; height: 30px; padding: 1px 3px; margin: -20px 683px;"><b style="font-size: 0.6em">사진선택</b></button> 
   	  <br>
   	  <div class="d-inline-flex" style="position: absolute; top: 270px;">
   	  <input type="text" name="apply_hp"  required="required" placeholder="휴대폰번호" style="width: 200px; height: 60px; margin: 10px 10px" class="form-control">
   	  <input type="text" name="apply_addr1" required="required" placeholder="주소" id="sample6_address" onclick="sample6_execDaumPostcode()"  style="width: 170px; height: 60px; margin: 10px 10px" class="form-control">
      <input type="text" name="apply_addr2" required="required" placeholder="상세주소" id="sample6_detailAddress" style="width: 170px; height: 60px; margin: 10px 10px" class="form-control">
   	  </div>
   </div>
</div>
<br>
<script type="text/javascript">
	$(function() {
		
		$("#btnphoto").click(function() {
			$("#userphoto").trigger("click");
		});
		
		$("#userphoto").on("change", function(event) {
            var file = event.target.files[0];
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#showimg").attr("src", e.target.result);
            }
            reader.readAsDataURL(file);
        });
	});
</script>
<div class="container">
	<h5><b>희망근무조건</b></h5>
	<div class="job">
		<div class="d-inline-flex">
			<select name="apply_primary" required="required" id="apply_primary" placeholder="1차 직종" style="width: 225px; height: 60px; margin: 10px 10px; border: 1px solid lightgray; border-radius: 6px" onchange="optionChange();">
			    <option selected disabled>1차 직종</option>
	            <option value="IT/웹/통신">IT/웹/통신</option>
	            <option value="서비스업">서비스업</option>
	            <option value="제조/화학">제조/화학</option>
	            <option value="교육">교육</option>
	            <option value="미디어/디자인">미디어/디자인</option>  
		    </select>
		    <select name="apply_secondary" required="required" id="apply_secondary" placeholder="2차 직종" style="width: 225px; height: 60px; margin: 10px 10px; border: 1px solid lightgray; border-radius: 6px" >
		        <option selected disabled>2차 직종</option>
		    </select>  
		</div>
		
		<div class="d-inline-flex">
			<input type="text" name="apply_salary" required="required" placeholder="희망연봉" style="width: 100px; height: 60px; margin: 10px 10px" class="form-control">
			<label for="career_salary" style="margin: 45px -5px; font-size: 0.7em"><b>만원</b></label>
			<input type="text" name="apply_region" required="required" placeholder="희망근무지" style="width: 330px; height: 60px; margin: 10px 20px" class="form-control">
		</div>
	</div>
</div>
<br>
<div class="container">
	<h5><b>경력</b></h5>
	<div class="career">
		<div class="d-inline-flex">
			<input type="text" name="career_companyname" required="required" placeholder="기업명" style="width: 230px; height: 60px; margin: 10px 10px" class="form-control">
			<input type="text" name="career_team" required="required" placeholder="부서" style="width: 200px; height: 60px; margin: 10px 10px" class="form-control">
			<input type="text" name="career_job" required="required" id="career_job" placeholder="직무" style="width: 200px; height: 60px; margin: 10px 10px" class="form-control">
		</div>
		<div class="d-inline-flex">
			<select name="career_position" required="required" style="width: 100px; height: 60px; margin: 10px 10px; border: 1px solid lightgray; border-radius: 6px" >
				<option selected disabled>직급</option>
		        <option value="주임/계장">주임/계장</option>
		        <option value="대리">대리</option>
		        <option value="과장">과장</option>
		        <option value="차장">차장</option>
		        <option value="부장">부장</option>
		        <option value="임원">임원</option>
			</select>
			<input type="text" name="career_salary" required="required" id="career_salary" placeholder="연봉" style="width: 100px; height: 60px; margin: 10px 10px" class="form-control">
			<label for="career_salary" style="margin: 45px -5px; font-size: 0.7em"><b>만원</b></label>
			<input type="date" name="career_duration1" required="required" data-placeholder="입사일" required style="width: 130px; height: 60px; margin:10px 50px" class="form-control" oninput="updateInput(this)">
			<b style="margin: 25px -38px;">~</b>
			<input type="date" name="career_duration2" required="required" data-placeholder="퇴사일" required style="width: 130px; height: 60px; margin:10px 45px" class="form-control" oninput="updateInput(this)" disabled>
			<input type="checkbox" name="career_check" id="career_check" value="재직중" style=" margin:-100px -15px" onchange="toggleCareerDuration()">
			<label for="career_check" style="margin: 40px 20px;">재직중</label>
		</div>
		<textarea name="career_story" required="required" class="story" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."></textarea>
	</div>
</div>
<br>
<div class="container">
	<h5><b>최종학력</b></h5>
	<div class="education">
		<div class="d-inline-flex">
			<select name="education_degree" required="required" style="width: 100px; height: 60px; margin: 10px 10px; border: 1px solid lightgray; border-radius: 6px" >
				<option value="0" selected disabled>학교구분</option>
		        <option value="중학교">중학교</option>
		        <option value="고등학교">고등학교</option>
		        <option value="대학교">대학교</option>
		        <option value="대학원">대학원</option>
			</select>
			<input type="text" name="education_name" required="required" placeholder="학교명" style="width: 200px; height: 60px; margin: 10px 0px" class="form-control">
			<input type="date" name="education_duration1" required="required" data-placeholder="입학날짜" required style="width: 130px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)">
			<b style="margin: 25px -5px;">~</b>
			<input type="date" name="education_duration2" required="required" data-placeholder="졸업날짜" required style="width: 130px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)" disabled>
			<input type="checkbox" name="education_check" id="education_check" value="재학중" style=" margin:10px 5px" onchange="toggleEducationDuration()">
			<label for="education_check" style="margin: 30px 0px;">재학중</label>
		</div>
		<div class="d-inline-flex">
			<input type="text" name="education_major" required="required" placeholder="전공명" style="width: 313px; height: 60px; margin: 10px 10px" class="form-control">
			<input type="text" name="education_score" required="required" placeholder="학점" style="width: 100px; height: 60px; margin: 10px 10px" class="form-control">
			<select name="education_scoreMax" required="required" style="width: 100px; height: 60px; margin: 10px -10px; border: 1px solid lightgray; border-radius: 6px">
				<option value="0" selected disabled>총점</option>
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
			<input type="text" name="active_name" required="required" placeholder="활동명" style="width: 313px; height: 60px; margin: 10px 10px" class="form-control">
			<input type="date" name="active_duration" required="required" data-placeholder="활동일" required style="width: 130px; height: 60px; margin:10px 10px" class="form-control" oninput="updateInput(this)">
			<input type="checkbox" name="active_awards" id="active_awards" value="수상" style=" margin:10px 5px">
			<label for="active_awards" style="margin: 30px 0px;">수상여부</label>
		</div>
		<textarea name="active_story" required="required" class="story" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."></textarea>
	</div>
</div>
<div class="two" id="btnbox">
      <button type="submit" id="mbtn" class="madebtn">
        작성완료
        <div class="fill-two"></div></button></div><br>
</form>
</body>

<!-- 1,2차 산업군 동적 select -->
      <script type="text/javascript">
         function optionChange(){
            var it= ['게임','보안/백신','쇼핑몰/오픈마켓','네트워크/통신/모바일','솔루션/SI/ERP/CRM'];
            var service=['호텔/여행/항공','뷰티/미용','레저/스포츠/여가'];
            var make=['전기/전자/제어','석유/화학/에너지','식품가공/개발','화장품/뷰티'];
            var edu=['초중고/대학','유아/유치원','학원/어학원'];
            var design=['실내/인테리어/조경','환경설비','부동산/임대']
            
            
            var primary=$('#apply_primary').val();
            
            var secondary;
            
            if(primary=='IT/웹/통신')
            {
               secondary=it;
            }else if (primary=='서비스업') {
               secondary=service;
         }else if (primary=='제조/화학') {
               secondary=make;
         }else if (primary=='교육') {
               secondary=edu;
         }else if (primary=='미디어/디자인') {
               secondary=design;
         }
            else{
            secondary=[];
         }
            $('#apply_secondary').empty();
            $('#apply_secondary').append('<option>2차 직종</option>');
            for ( var i = 0; i < secondary.length; i++ ) {
                $('#apply_secondary').append('<option>'+secondary[i]+'</option>');
            }
        }    
</script>
<!-- 주소api -->
<script type="text/javascript">
      function openId() {   
         
         window.open("layout/info.jsp","e","left=400px; top=100px,width=260px,height=185px");
      }   
   </script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
    // window의 load 이벤트에 이벤트 리스너를 추가합니다.
    window.addEventListener('load', function () {
        // 페이지가 로드될 때 toggleCareerDuration 함수와 toggleEducationDuration 함수를 실행합니다.
        toggleCareerDuration();
        toggleEducationDuration();
        
        // career_check 체크박스에 change 이벤트 리스너를 추가합니다.
        document.getElementById('career_check').addEventListener('change', toggleCareerDuration);
        
        // education_check 체크박스에 change 이벤트 리스너를 추가합니다.
        document.getElementById('education_check').addEventListener('change', toggleEducationDuration);
    });

    function toggleCareerDuration() {
        var checkbox = document.getElementById('career_check');
        var careerDuration2Input = document.getElementsByName('career_duration2')[0];

        // checkbox가 체크되었을 때 퇴사일 입력 필드 활성화
        careerDuration2Input.disabled = checkbox.checked;
    }

    function toggleEducationDuration() {
        var checkbox2 = document.getElementById('education_check');
        var educationDuration2Input = document.getElementsByName('education_duration2')[0];

        // checkbox가 체크되어 있지 않으면 졸업 날짜 필드를 활성화합니다.
        educationDuration2Input.disabled = checkbox2.checked;
    }
</script>

</html>