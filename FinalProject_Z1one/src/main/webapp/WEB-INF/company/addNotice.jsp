<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#showImg {
	border: 1px solid gray;
	width: 250px;
	height: 400px;
}
</style>
<script type="text/javascript">
$(function () {
    $("#imgChoice").click(function () {
        $("#myImg").trigger("click");
    });

    $("#myImg").on("change", function (event) {
        var file = event.target.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#showImg").attr("src", e.target.result);
        }
        reader.readAsDataURL(file);
    });

     var careerSelect = document.getElementById('careerSelect');

    careerSelect.addEventListener('change', function () {
        var selectedValue = careerSelect.value;
        var s = "";

        if (selectedValue === '경력') {
            s += "<input type='text' name='cnotice_career2' class='form-control' placeholder='ex(5년 이상)' required='required' style='width: 160px;'>";
            $(".career2").html(s);
        } else {
            $(".career2").empty();
        }
    }); 

    var industrySelect1 = document.querySelector('select[name="cnotice_industry1"]');

    industrySelect1.addEventListener('change', function () {
        var selectedValue1 = industrySelect1.value;

            var h = "";

            if (selectedValue1 === 'IT/웹/통신') {
                h += "<option value='0' selected>2차 직종</option>";
                h += "<option value='게임'>게임</option>";
                h += "<option value='보안/백신'>보안/백신</option>";
                h += "<option value='쇼핑몰/오픈마켓'>쇼핑몰/오픈마켓</option>";
                h += "<option value='네트워크/통신/모바일'>네트워크/통신/모바일</option>";
                h += "<option value='솔루션/SI/ERP/CRM'>솔루션/SI/ERP/CRM</option>";
            } else if (selectedValue1 === '서비스업') {
                h += "<option value='0' selected>2차 직종</option>";
                h += "<option value='호텔/여행/항공'>호텔/여행/항공</option>";
                h += "<option value='뷰티/미용'>뷰티/미용</option>";
                h += "<option value='레저/스포츠/여가'>레저/스포츠/여가</option>";
            } else if (selectedValue1 === '제조/화학') {
                h += "<option value='0' selected>2차 직종</option>";
                h += "<option value='전기/전자/제어'>전기/전자/제어</option>";
                h += "<option value='석유/화학/에너지'>석유/화학/에너지</option>";
                h += "<option value='식품가공/개발'>식품가공/개발</option>";
                h += "<option value='화장품/뷰티'>화장품/뷰티</option>";
            } else if (selectedValue1 === '교육') {
                h += "<option value='0' selected>2차 직종</option>";
                h += "<option value='초중고/대학'>초중고/대학</option>";
                h += "<option value='유아/유치원'>유아/유치원</option>";
                h += "<option value='학원/어학원'>학원/어학원</option>";
            } else if (selectedValue1 === '미디어/디자인') {
                h += "<option value='0' selected>2차 직종</option>";
                h += "<option value='실내/인테리어/조경'>실내/인테리어/조경</option>";
                h += "<option value='환경설비'>환경설비</option>";
                h += "<option value='부동산/임대'>부동산/임대</option>";
            }

            $("select[name='cnotice_industry2']").html(h);
    });
    
});

</script>
</head>
<body>
	<div style="margin: 100px 100px;" align="center">
	<input type="hidden" name="company_num" value="${company_num }">
		<form action="noticeInsert" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="width: 1000px;">
				<caption align="top">
					<b style="color: black;">공고등록</b>
				</caption>
				<!-- 공고이미지 -->
				<tr>
					<td rowspan="18" align="center"><input type="file" id="myImg"
						name="myImg" style="display: none;" required="required"> <br> <br> <br>
						<img id="showImg"> <br> <br>
						<button type="button" id="imgChoice" class="btn btn-secondary">사진선택</button>
					</td>
				</tr>

				<tr><td><b>회사번호</b> ${company_num }</td></tr>

				<!-- 회사명 -->
				<tr>
					<td style="display: flex; align-items: center;"><b>회사명</b>&nbsp;
						${company_name }
					</td>
				</tr>
				
				<!-- 공고명 -->
				<tr>
					<td  style="align-items: center; display: flex;"><b>공고명</b>&nbsp;<input
						type="text" name="cnotice_noticename" class="form-control"
						placeholder="공고명" required="required" style="width: 250px;">
					</td>	
				</tr>
				
				<!-- 1차산업군 -->
				<tr>
					<td><b>1차 산업군</b> <select name="cnotice_industry1"
						style="border-radius: 5px;" required="required">
							<option value="0" selected>1차 직종</option>
							<option value="IT/웹/통신">IT/웹/통신</option>
							<option value="서비스업">서비스업</option>
							<option value="제조/화학">제조/화학</option>
							<option value="교육">교육</option>
							<option value="미디어/디자인">미디어/디자인</option>
					</select></td>
				</tr>

				<!-- 2차산업군 -->
				<tr>
					<td><b>2차 산업군</b>&nbsp;<select name="cnotice_industry2"
						id="industry2" style="border-radius: 5px;" required="required"></select></td>
				</tr>

				<!-- 근무 지역 -->
				<tr>
					<td style="display: flex; align-items: center;"><b>근무지역</b>&nbsp;
						<select name="cnotice_location1" style="border-radius: 5px;" required="required">
							<option value="서울" selected="selected">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="대전">대전</option>
							<option value="세종">세종</option>
							<!-- <option value="충남">충남</option>
				  	<option value="충북">충북</option><option value="광주">광주</option><option value="전남">전남</option><option value="전북">전북</option>
				  	<option value="대구">대구</option><option value="경북">경북</option><option value="부산">부산</option><option value="울산">울산</option>
				  	<option value="경남">경남</option><option value="강원">강원</option><option value="제주">제주</option><option value="해외">해외</option> -->
					</select>&nbsp; <input type="text" name="cnotice_location2"
						class="form-control" placeholder="상세주소" required="required"
						style="width: 275px;"></td>
				</tr>

				<!-- 직무스킬 -->
				<tr>
					<td  style="align-items: center; display: flex;"><b>직무스킬</b>&nbsp;<input
						type="text" name="cnotice_skill" class="form-control"
						placeholder="직무스킬" required="required" style="width: 250px;">
					</td>	
				</tr>
				
				<!-- 고용형태 -->
				<tr>
				<td style="display: flex; align-items: center;"><b>고용형태</b>&nbsp;
						<select name="cnotice_type" id="typeSelect"
						style="border-radius: 5px;" required="required">
							<option value="정규직" selected="selected">정규직</option>
							<option value="계약직">계약직</option>
					</select>&nbsp;
				</tr>
				
				<!-- 경력 -->
				<tr>
					<td style="display: flex; align-items: center;"><b>경력</b>&nbsp;
						<select name="cnotice_career1" id="careerSelect"
						style="border-radius: 5px;" required="required">
							<option value="경력무관" selected="selected">경력무관</option>
							<option value="신입">신입</option>
							<option value="경력">경력</option>
					</select>&nbsp;
					<div class="career2"></div>
				</tr>

				<!-- 학력 -->
				<tr>
				<tr>
					<td><b>주소</b> <select name="cnotice_academy"
						style="border-radius: 5px;" required="required">
							<option value="학력무관" selected="selected">학력무관</option>
							<option value="고등학교 졸업">고등학교 졸업</option>
							<option value="대학졸업 (2-3년)">대학졸업 (2-3년)</option>
							<option value="대학교졸업 (4년)">대학교졸업 (4년)</option>
							<option value="대학원졸업">대학원졸업</option>
							<option value="석사">석사</option>
							<option value="박사">박사</option>
					</select></td>
				</tr>

				<!-- 연봉 -->
				<tr>
					<td style="display: flex; align-items: center;"><b>연봉</b>&nbsp;<input
						type="number" name="cnotice_pay" class="form-control" required="required"
						placeholder="연봉" style="width: 95px;"
						min="2000" max="9900" step="100"> &nbsp;<a>만원</a></td>
				</tr>

				<!-- 축하금 -->

				<tr>
					<td style="display: flex; align-items: center;"><b>축하금</b>&nbsp;<input
						type="number" min="0" max="200" step="50"
						name="cnotice_congratulate" class="form-control" placeholder="축하금"
						required="required" style="width: 95px;">&nbsp;<a>만원</a></td>
				</tr>
				
				<!-- 마감일 -->
				<tr>
					<td style="display: flex; align-items: center;"><b>마감일</b>&nbsp;<input
						type="date" name="cnotice_deadline" class="form-control" placeholder="축하금" required="required"
						 style="width: 125px;"></td>
				</tr>
				<!-- 평점 -->
				<tr>
					<td style="display: flex; align-items: center;"><b>평점</b>&nbsp;<input
						type="text" name="cnotice_grade" class="form-control" placeholder="평점"
						style="width: 125px;" required="required"></td>
				</tr>
				<!-- 추천수 -->
				<tr>
					<td style="display: flex; align-items: center;"><b>추천수</b>&nbsp;<input
						type="text" name="cnotice_recommend" class="form-control" placeholder="추천수"
						style="width: 125px;" required="required"></td>
				</tr>
				<!-- 조회수 -->
				<tr>
					<td style="display: flex; align-items: center;"><b>조회수</b>&nbsp;<input
						type="text" name="cnotice_readcount" class="form-control" placeholder="조회수"
						style="width: 125px;" required="required"></td>
				</tr>
				
				<!-- 등록,취소 -->
				<tr>
					<td colspan="2" align="center">
						<button type="submit">등록</button>
						<button type="button" onclick="history.back()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>