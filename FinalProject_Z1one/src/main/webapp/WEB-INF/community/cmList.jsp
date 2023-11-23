<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
form {
  position: relative;
  width: 50%;
  margin: 0 auto;
}
.cmlistsearch input {
  width: 100%;
  height: 42px;
  padding-left: 10px;
  border: 2px solid #8f7cc4;
  border-radius: 5px;
  outline: none;
  background: white;
  color: #9E9C9C;
}
.cmlistsearch button {
  position: absolute; 
  top: 0;   
  right: 0px;
  width: 42px;
  height: 42px;
  border: none;
  background: #8f7cc4;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
}
.cmlistsearch button:before {
  content: "\f002";
  font-family: FontAwesome;
  font-size: 16px;
  color: white;
}
.row{
	text-align: center;
	margin-left: 6%;
	margin-right: 6%;
	/* border: 1px solid green; */
}

.text-secondary{
	font-size: 13px;
	font-weight: bold;
	text-decoration: none;
	position: relative;
	margin-bottom: 2px;
	/* border: 1px solid red; */
}

.text-secondary::before{
	content: "";
	height: 3px;
	width: 0;
	background-color: black;
	border-radius: 10px;
	transition: 0.3s;
	position: absolute;
	bottom: -10px;
	left: 0;
}

.text-secondary:hover::before{
	width: 125%;
	left:-12.5%;
	bottom:-10px;
	background-color: black;
}

.m1{
	margin-left: 5px;
}

.mdetail{
	left:15px;
}

.z1{
	right: 20px;
}

.z12{
	right: 50px;
}

.cmbody{
	border: 1px solid gray;
	left: 100px;
	margin-top:30px;
	
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<div class="cmlistsearch">
		<form>
			<input type="text" placeholder="기업명, 공고명 검색">
			<button type="submit"></button>
		</form>
	</div>
	<br>
	
	
	<!-- 상단 배너 슬라이드_bootstrap  -->
	<div id="carouselExampleIndicators" class="carousel slide w-50 container">
      <div class="carousel-indicators">
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="0" class="active" aria-current="true"
            aria-label="Slide 1"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="1" aria-label="Slide 2"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>

      <div class="carousel-inner rounded">
         <div class="carousel-item active">
            <img src="${root }/image/banner2.png" class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="${root }/image/banner3.png" class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="${root }/image/banner1.png" class="d-block w-100" alt="...">
         </div>
      </div>
      <button class="carousel-control-prev" type="button"
         data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button"
         data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true" ></span> <span
            class="visually-hidden">Next</span>
      </button>
   </div>
   <br>
   
   <!-- 상단바 bootstrap5 grip -->
    <div class="row" style="margin-bottom: 1%;">
      <div class="col-sm-4 bg-white text-dark fw-bold">취업준비</div>|
      <div class="col-sm-2 bg-white text-dark fw-bold">재직중</div>|
      <div class="col-sm-3 bg-white text-dark fw-bold">이직 | 퇴사</div>|
       <div class="col-sm-2 bg-white text-dark fw-bold">&nbsp;&nbsp;&nbsp;&nbsp;자유</div>
    </div>  
    
    <div class="row">
      <div class="col-sm-1 bg-white">
      	<a href="#" class="text-secondary m1 mdetail">자소서</a>
      </div>
      <div class="col-sm-1 bg-white">
      	<a href="#" class="text-secondary m1">인적성</a>
      </div>
      <div class="col-sm-1 bg-white fs-8">
      	<a href="#" class="text-secondary m1">portfolio</a>
      </div>
      <div class="col-sm-1 bg-white">
      	<a href="#" class="text-secondary m1">면접</a>
      </div>
      <div class="col-sm-1 bg-white">
      	<a href="#" class="text-secondary">회사생활</a>
      </div>
      <div class="col-sm-1 bg-white">
      	<a href="#" class="text-secondary">신입꿀팁</a>
      </div>
      <div class="col-sm-2 bg-white">
      	<a href="#" class="text-secondary">이직STORY</a>
      </div>
      <div class="col-sm-1 bg-white">
      	<a href="#" class="text-secondary">퇴사꿀팁</a>
      </div>
      <div class="col-sm-2 bg-white">&nbsp;
      	<a href="#" class="text-secondary z1">Z1맘대로</a>
      </div>
      <div class="col-sm-1 bg-white">
      	<a href="#" class="text-secondary z12">Z1마켓</a>
      </div>
    </div>  

	<!-- 게시판입력버튼 -->
	<div>
	 	<button type="button" class="btn btn-secondary" style="float: right;" onclick="location.href='cmform'">글작성</button>
	</div>
	
	
	<!-- 본문 -->
	<div class="cmbody">
	${totalCount }
		<div class="topic">토픽주제 ${user_BoardDto.board_title}</div>
		<div class="subject">제목</div>
		<div class="content">내용</div>
		<div class="nickname">닉네임</div>
		<div class="view">조회수</div>
		<div class="likes">좋아요</div>
		<div class="talk">댓글수</div>
		<div class="date">날짜</div>
		<div class="save">스크랩</div>
	</div>
</body>
</html>