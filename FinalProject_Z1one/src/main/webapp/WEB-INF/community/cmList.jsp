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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
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
	/* margin-left: 6%; */
	margin-right: 6%;
	margin-left: 12.5%;
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

/* .m1{
	margin-left: 5px;
} */

.mdetail{
	left:15px;
}

.z1{
	right: 20px;
}

.z12{
	right: 50px;
}

/* .cmbody{
	border: 1px solid gray;
	left: 100px;
	margin-top:30px;
	
}
 */
 
.mid1 {
        width: 80%;
        height: 1800px;
        margin-left: 12.5%;
    }
.cmbody {
        display: flex;
        flex-wrap: wrap; /* 자식 요소들을 한 줄에 정렬하되, 넘칠 경우 다음 줄로 넘어가게 설정 */
    }

.cmbody-each {
        width: 50%; /* 한 줄에 두 개의 요소만 나타나도록 설정 */
        height: 250px;
    }
</style>
<script type="text/javascript">
 function goContent(boardnum){
	 location.href="/community/content?board_num="+boardnum;
 }
</script>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<form action="search">
		<div class="cmlistsearch">
		
			<input type="text" placeholder="관심 내용을 검색해보세요!">
			<button type="submit"></button>
		</div>
	</form>
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

	
	<div class="mid1"><!-- mid1 시작-->
	<!-- 본문시작 -->
	<hr style="border: 2px solid black; margin-top: 15px;">
		<!-- 게시판입력버튼 -->
		<div>
			총 게시글 : ${totalCount }
		 	<button type="button" class="btn btn-secondary btn-sm" style="float: right;" onclick="location.href='cmform'">글작성</button>
		</div>
	<div class="cmbody" style="width: 100%;">
	<c:forEach items="${list }" var="userboardDto">
	<div class="cmbody-each" style="border: 1.5px solid lightslategray; cursor: pointer;" onclick="goContent(${userboardDto.board_num})">
		<!-- cmbody 상단 -->
		<div class="cmbody-top" style="height: 70px;">
			<div class="topic"><b style="color: gray">${userboardDto.board_category}</b></div>
			<span class="subject">제목 ${userboardDto.board_title}</span>
			<span class="save">스크랩</span>
		</div>
		<!-- cmbody 중간 -->
		<div class="cmbody-middle" style="height: 100px;">
			<span class="content">내용 ${userboardDto.board_title}</span>
			<span><img alt="" src="../savefile/${userboardDto.board_photo}" style="width: 20%;"></span>
		</div>
		<!-- cmbody 하단 -->
		<div class="cmbody-bottom" style="height: 70px;">
			<span class="nickname"><i class="bi bi-person-circle"></i>${userboardDto.user_email}</span>
			<span class="view"><i class="bi bi-eye"></i> ${userboardDto.board_readcnt}</span>
			<span class="like"><i class="bi bi-hand-thumbs-up"></i> ${userboardDto.board_like}</span>
			<span class="dislike"><i class="bi bi-hand-thumbs-down"></i> ${userboardDto.board_dislike}</span>
			<span class="talk"><i class="bi bi-chat-left"></i> </span>
			<span class="date"><fmt:formatDate value="${userboardDto.board_writeday}" pattern="yyyy-MM-dd"/>
			</span>
		</div>
	</div>
	</c:forEach>
	${sessionScope.myid }
	</div>
	<!-- 본문끝 -->
	</div><!-- mid1 종료 -->
</body>
</html>