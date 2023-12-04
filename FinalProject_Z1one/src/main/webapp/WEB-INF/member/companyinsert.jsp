<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#c_infobox {
	width: 500px;
	border: 1px solid lightgray;
	border-radius: 30px;
}

<
style type ="text /css "> /* 로그인 CSS */ .two {
	text-align: center;
	cursor: pointer;
	margin-top: 5%;
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
	z-index: 100;
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

.loginbox {
	border: 1px solid lightgray;
	border-radius: 20px;
	width: 350px;
	height: 200px;
	margin-left: 5%;
}

.logincontext {
	font-size: 10pt;
	text-align: center;
	color: gray;
}

.loginplus {
	text-decoration: none;
	color: gray;
	font-size: 10pt;
}

@
-webkit-keyframes gradient { 0% {
	background-position: 0% 50%;
}

50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
}
@
-moz-keyframes gradient { 0% {
	background-position: 0% 50%;
}

50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
}
@
keyframes gradient { 0% {
	background-position: 0% 50%;
}
50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
</style>
<!-- 주소api -->
<script type="text/javascript">

$(function(){
	start()
	})
	
function start(){
	
	
	}
function openId() {   
         
         window.open("layout/info.jsp","e","left=400px; top=100px,width=260px,height=185px");
      }   
   </script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
</head>

<body>

	<!-- 기업 추가 정보 가입 -->
	<div style="margin-left: 35%; margin-top: 3%;">
		<b>| 기업 추가 정보 입력</b>
	</div>
	<br>
	<div id="loginbox2" align="center">

		<form action="plusinsert" method="post">

			<div id="c_infobox">
				<br> <span>
				<input type="text" class="form-control"
					name="cinfo_ceo" style="width: 300px; height: 47px;"
					placeholder="대표자명" required="required"></span><br> 
					<span><input
					type="text" name="cinfo_realpath" required="required" placeholder="본사주소"
					id="sample6_address" onclick="sample6_execDaumPostcode()"
					style="width: 300px; height: 47px;"
					class="form-control"></span><br>
					 <span><input type="text" name="cinfo_realpath2"
					required="required" placeholder="본사 상세주소" id="sample6_detailAddress"
					style="width: 300px; height: 47px;"
					class="form-control"> </span><br> <span><input
					type="text" class="form-control" name="cinfo_employcnt"
					style="width: 300px; height: 47px;" placeholder="직원수"
					required="required"></span><br> <span><input
					type="text" class="form-control" name="cinfo_mainbusiness"
					style="width: 300px; height: 47px;" placeholder="주요사업"
					required="required"></span><br> <span><input
					type="text" class="form-control" name="cinfo_homepage"
					style="width: 300px; height: 47px;" placeholder="홈페이지"
					required="required"></span><br>
			</div>
			<br>
			<!-- 이력서 작성하기 버튼 -->
			<div class="two" id="btnbox1">
				<button type="submit" id="btn1" class="madebtn">
					회원가입 완료
					<div class="fill-two"></div>
					<script type="text/javascript">
        $("#btnbox1").click(function(e){
           $("#btn1").trigger("click");   
        })
        
        </script>
				</button>
			</div>
		</form>
	</div>

<br>
</body>
</html>