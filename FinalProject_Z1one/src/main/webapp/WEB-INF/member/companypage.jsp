<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#basicInfo{
	border: 1px solid black;
	border-radius:10px;
	width: 100%;
	height: 450px;
}
#plusInfo{
	width: 50%;
	float: right;
	height: 200px;
	margin-top: -20%;
	margin-right: 9%;
}
#logobox{
	border: 1px solid black;
	border-radius:10px;
	width: 17%;
	float: right;
	height: 200px;
	margin-right: 3%;
	margin-top: -20%;

}
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-15 {
  background: #b621fe;
  border: none;
  z-index: 1;
}
.btn-15:after {
  position: absolute;
  content: "";
  width: 0;
  height: 100%;
  top: 0;
  right: 0;
  z-index: -1;
  background-color: #663dff;
  border-radius: 5px;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  transition: all 0.3s ease;
}
.btn-15:hover {
  color: #fff;
}
.btn-15:hover:after {
  left: 0;
  width: 100%;
}
.btn-15:active {
  top: 2px;
}

.btn-14 {
  background: rgb(255,151,0);
  border: none;
  z-index: 1;
}
.btn-14:after {
  position: absolute;
  content: "";
  width: 100%;
  height: 0;
  top: 0;
  left: 0;
  z-index: -1;
  border-radius: 5px;
  background-color: #eaf818;
  background-image: linear-gradient(315deg, #eaf818 0%, #f6fc9c 74%);
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5);
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  transition: all 0.3s ease;
}
.btn-14:hover {
  color: #000;
}
.btn-14:hover:after {
  top: auto;
  bottom: 0;
  height: 100%;
}
.btn-14:active {
  top: 2px;
}
</style>
<script type="text/javascript">
	function companyuload(){
		var insert=confirm("기업 정보를 게시하시겠습니까?")
		
		if(insert){
			
		}
		
	}
</script>
</head>
<body>
<br><br>
<div class="container">
<h3>| 기업 정보 페이지</h3><br>

<!-- 회원가입 할 때 기업 기본 정보 뜨는 공간 -->
<div id="basicInfo">
	<div style="margin-left: 3%;margin-top: 3%;">
		<h4><b>기업명</b></h4><br>

		<span><img alt="" src="../image/ceo.png" style="width: 1.8%;height: 22px;"><b style="font-size: 15pt;"> 대표자명 : </b></span><br><br>
		<span><img alt="" src="../image/handshake.png" style="width: 1.8%;height: 22px;"><b style="font-size: 15pt;"> 사업자 번호</b></span><br><br>
		<span><img alt="" src="../image/email.png" style="width: 1.3%;height: 18px;"><b style="font-size: 15pt;"> 기업 이메일</b></span>
		<span style="height: 10px;border: 1px solid lightgray; margin-left: 2%;margin-right: 2%;"></span> <!-- 선 -->
		<span><img alt="" src="../image/telephone.png"style="width: 1.5%;height: 20px;"><b style="font-size: 15pt;"> 기업 연락처</b></span><br><br>
		<span><img alt="" src="../image/kindness.png"style="width: 1.8%;height: 22px;"><b style="font-size: 15pt;"> 1차 산업군</b></span>
		<span style="height: 10px;border: 1px solid lightgray; margin-left: 2%;margin-right: 2%;"></span> <!-- 선 -->
		<span><b style="font-size: 15pt;"> 2차 산업군</b></span><br><br>
		<span><img alt="" src="../image/core-value.png"style="width: 1.8%;height: 22px;"><b style="font-size: 15pt;"> 주요사업 : </b></span><br><br>
		<span><img alt="" src="../image/company.png"style="width: 1.8%;height: 22px;"><b style="font-size: 15pt;"> 기업 유형 : </b></span>

	</div>
	<div id="plusInfo">
		<span><img alt="" src="../image/pin.png" style="width: 3%;height: 20px;"><b style="font-size: 15pt;"> 본사 주소 : </b></span><br><br>
		<span><img alt="" src="../image/employee.png" style="width: 4%;height: 22px;"><b style="font-size: 15pt;"> 직원수 : </b></span><br><br>
		<span><img alt="" src="../image/homepage.png" style="width: 4%;height: 22px;"><b style="font-size: 15pt;"> 홈페이지 : </b></span><br><br>
	</div>
	<div id="logobox">
		
	</div>
	<div align="right">
	<span><a href="javascript:void(0)" onclick=companyuload() style="text-decoration: none;margin-right: 5%;">>기업 정보 게시하기<</a></span>
	</div>
</div><br>
	<div align="center">
		<button class="custom-btn btn-15">정보수정</button>
		<button class="custom-btn btn-14">회원탈퇴</button>
	</div>
</div>
</body>
</html>