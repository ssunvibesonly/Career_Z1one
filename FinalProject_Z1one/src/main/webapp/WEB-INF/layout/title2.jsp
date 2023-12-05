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
	a.nav-link{
	color: gray;
	font-size: 10pt;
	
	}
.dropbtn {
	background-color: white;
	color: white;
	/* padding: 16px; */
	font-size: 16px;
	cursor: pointer;
	width: 30px;
}

.dropdown {
	/* position: absolute; */
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: white;
}
.custom-btn2 {
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
.btn-8 {
  background-color: #f0ecfc;
background-image: linear-gradient(315deg, #f0ecfc 0%, #c797eb 74%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-8 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;

}
.btn-8:before,
.btn-8:after {
  position: absolute;
  content: "";
  right: 0;
  bottom: 0;
  background: #c797eb;
  /*box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);*/
  transition: all 0.3s ease;
}
.btn-8:before{
   height: 0%;
   width: 2px;
}
.btn-8:after {
  width: 0%;
  height: 2px;
}
.btn-8:hover:before {
  height: 100%;
}
.btn-8:hover:after {
  width: 100%;
}
.btn-8:hover{
  background: transparent;
}
.btn-8 span:hover{
  color: #c797eb;
}
.btn-8 span:before,
.btn-8 span:after {
  position: absolute;
  content: "";
  left: 0;
  top: 0;
  background: #c797eb;
  /*box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);*/
  transition: all 0.3s ease;
}
.btn-8 span:before {
  width: 2px;
  height: 0%;
}
.btn-8 span:after {
  height: 2px;
  width: 0%;
}
.btn-8 span:hover:before {
  height: 100%;
}
.btn-8 span:hover:after {
  width: 100%;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
<div class="d-inline-flex">
<div style="max-width: 20%;">
<a href="/"><img alt="" src="${root }/image/final_logo.gif" style="max-width: 70%;"></a>
</div>
<div style="margin-left:1%;padding-top: 2%" class="ulsize">
	<ul class="nav">
    <li class="nav-item">
       <a class="nav-link" href="/company/ban">채용공고</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/company/info">기업정보</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/board/community">커뮤니티</a> <!-- 게시판 -->
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:(0)" onclick="chat()"><img src="../image/chat.png" style="width:30px;"></a>
      <script type="text/javascript">
      function chat(){
    	  window.open("/chat","e","width=400px,height=800px,left=750px,top=100px");
      }
      </script>
    </li>
  </ul>
  </div>
	   <c:if test="${sessionScope.loginok!=null&&sessionScope.companyloginok==null&&sessionScope.myid!='admin' }">
		<div class="dropdown"
			style="position: absolute; top: 30px; right: 300px;">
			<div class="dropbtn">
				<c:if test="${sessionScope.user_photo!='no'}">
				<img src="${root}/applyphoto/${user_photo}"
					style="width: 30px;">
				</c:if>
				<c:if test="${sessionScope.user_photo=='no'}">
				<img src="../image/userphotonull.png"
					style="width: 30px;">
				</c:if>
			</div>
			<div class="dropdown-content">
				<a href="/member/usereditpage?user_num=${user_num }">계정</a> 
				<a href="/member/userapplypage?user_num=${user_num }">이력서</a>
			</div>
		</div>
		</c:if>
		<c:if test="${sessionScope.companyloginok!=null&&sessionScope.loginok==null&&sessionScope.myid!='admin' }">
		<div class="dropdown"
			style="position: absolute; top: 30px; right: 300px;">
			<div class="dropbtn">
				<c:if test="${sessionScope.company_logo!=null}">
				<img src="${root}/membersave/${company_logo}"
					style="width: 30px;">
				</c:if>
				<c:if test="${sessionScope.company_logo==null}">
				<img src="../image/userphotonull.png"
					style="width: 30px;">
				</c:if>
			</div>
			<div class="dropdown-content">
				<a href="/member/companymypage">채용정보</a> 
				<a href="/recruit/titlelist?c_code=${company_num}">채용 진행사항</a>
			</div>
		</div>
		</c:if>
		<c:if test="${sessionScope.companyloginok==null&&sessionScope.loginok!=null&&sessionScope.myid=='admin' }">
		<div class="dropdown"
			style="position: absolute; top: 30px; right: 300px;">
			<div class="dropbtn">
				<c:if test="${sessionScope.user_photo!='no'}">
				<img src="${root}/applyphoto/${user_photo}"
					style="width: 30px;">
				</c:if>
				<c:if test="${sessionScope.user_photo=='no'}">
				<img src="../image/userphotonull.png"
					style="width: 30px;">
				</c:if>
			</div>
			<div class="dropdown-content">
				<a href="/member/adminpage?user_num=${user_num }">회원정보관리</a> 
				<a href="/member/adminnoticecheckpage?user_num=${user_num }">채용공고승인</a>
			</div>
		</div>
		</c:if>
	</div>
	 <c:if test="${sessionScope.loginok==null && sessionScope.companyloginok==null }">
	<button class="custom-btn2 btn-8" style="position: absolute; right: 200px; top:30px; width: 70px; height: 32px; padding: -5px 0px;" onclick="location.href='/login/form'" ><span style="font-size: 0.8em; ">로그인</span></button>
	 </c:if>
	 <c:if test="${sessionScope.loginok!=null || sessionScope.companyloginok!=null }">
	<button class="custom-btn2 btn-8" style="position: absolute; right: 200px; top:30px; width: 70px; height: 32px; padding: -5px 0px;" onclick="location.href='/login/logoutaction'"><span style="font-size: 0.8em; ">로그아웃</span></button>
	</c:if>
</body>
</html>