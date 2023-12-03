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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.searchbox {
	width: 60%;
	height: 60px;
	border: 1px solid lightgray;
	border-radius: 20px;
	padding-bottom: 1%;
	padding-top: 1%;
	margin-left: 20%;
}

.click {
	width: 90%;
	height: 100%;
	margin-left: 3%;
	border: 1px solid white;
}

.mypagemenu {
	width: 100%;
	height: 70px;
	margin-top: 0.5%;
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
}

.idEdit {
	width: 10%;
	height: 70px;
	margin-left: 20%;
	text-align: center;
	padding: 20px 0;
	font-weight: bold;
	cursor: pointer;
	border-bottom: 5px solid purple;
}

.applyEdit {
	width: 10%;
	height: 70px;
	text-align: center;
	padding: 20px 0;
	font-weight: bold;
	cursor: pointer;
}

a {
	text-decoration: none;
	color: black;
}

#basicInfo {
	border: 1px solid black;
	border-radius: 10px;
	width: 40%;
	height: 450px;
	margin-left: 30%;
}

#plusInfo {
	width: 50%;
	float: right;
	height: 200px;
	margin-top: -20%;
	margin-right: 9%;
}

#logobox {
	border: 1px solid black;
	border-radius: 5px;
	width: 20%;
	float: right;
	height: 110px;
	margin-right: 40%;
	margin-top: 8%;
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
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
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
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
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
	background: rgb(255, 151, 0);
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
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5); 7 px 7px
	20px 0px rgba(0,0,0,.1), 4px 4px 5px 0px rgba(0,0,0,.1);
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
</head>
<body>
	<div>
			<form>
				<div class="d-inline-flex searchbox">
					<input type="text" class="form-control click" name="search">&nbsp;&nbsp;&nbsp;
					<div
						style="height: 100%; border: 0.5px solid lightgray; margin-right: 3%;"></div>
					<input type="image" src="${root}/image/search.png" alt="Search"
						style="width: 3%; margin-right: 3%;">
				</div>
			</form>
	</div>
	<div class="d-inline-flex mypagemenu">
		<div class="idEdit">
			<a href="/member/usereditpage?user_num=${user_num }">계정</a>
		</div>
		<div class="applyEdit">
			<a href="/member/userapplypage?user_num=${user_num }">이력서</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="container">
		<h3 style="margin-left: 30%;">| 회원 정보</h3>
		<br>

		<!-- 회원가입 할 때 기업 기본 정보 뜨는 공간 -->
		<div id="basicInfo">
			<div id="logobox">
				<img alt="" src="../applyphoto/${photo}"
					style="width: 100%; height: 100%;">
			</div>
			<form action="/member/usereditupdate" method="post">
			<input type="hidden" name="user_num" value="${user_num }">
			<div style="margin-left: 16%; margin-top: 30%;">

				<%-- <h4><b>${name }</b></h4><br> --%>
				<br>
				<br> <span><img alt="" src="../image/ceo.png"
					style="width: 1.8%; height: 22px;"><b
					style="font-size: 15pt;"> 이름<input type="text" name="user_name"
						value="${dto.user_name }" style="margin-left: 5.8%;"></b></span><br>
				<br> <span><img alt="" src="../image/email.png"
					style="width: 1.8%; height: 15px;"><b
					style="font-size: 15pt;"> 이메일 <input type="text"
						name="user_email" value="${dto.user_email}"></b></span> <br>
				<br>
				<div style="margin-top: 15%; margin-left: 9%;">
					<button type="submit" class="custom-btn btn-15">수정</button>
					<button class="custom-btn btn-14"
						onclick="location.href='/member/usereditpage?user_num=${user_num }'">취소</button>
				</div>
			</div>
			</form>
		</div>
		<br>
</body>
</html>