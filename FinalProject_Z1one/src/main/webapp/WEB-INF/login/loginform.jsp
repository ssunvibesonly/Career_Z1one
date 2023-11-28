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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#loginbox{
border: 1px solid lightgray;
border-radius:20px;
width: 350px;
height: 500px;
}
.two {
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
  letter-spacing: 0.2em;
  overflow: hidden;
  box-shadow: 0 4px 12px 0 rgba(152, 160, 180, 10);
  z-index: 100;
  font-weight: bold;
  color: white;
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

#loginbox{
border: 1px solid lightgray; 
border-radius:20px;
width: 350px;
height: 530px;


}
.logincontext{
font-size: 10pt;
text-align: center;
color: gray;
}
.loginplus{
text-decoration: none;
color: gray;
font-size: 10pt;
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
</style>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
</head>
<body>
<br>
<div class="container">
<div align="center">
<img alt="" src="${root }/image/final_logo.gif" style="width: 150px;margin-bottom: 1%;">
<div id="loginbox">
<form action="loginaction" method="post">
   <div align="left" 
   style="margin-left: 5%; margin-top: 5%;font-weight: bold;">로그인</div><br>
   
   <!-- 로그인 버튼 -->
      <input type="text" class="form-control" name="email"
      style="width: 250px;height: 47px;margin-bottom: 1%;" placeholder="이메일 주소" required="required">
      <input type="password" class="form-control" name="pass"
      style="width: 250px;height: 47px;" placeholder="비밀번호" required="required">
       <div class="two" id="btnbox">
      <input type="hidden" name="boardnum" value="${boardnum }">
      <input type="hidden" name="community" value="${community }">
      <button type="submit" id="btn" class="madebtn">
        Login
        <div class="fill-two"></div>
        <script type="text/javascript">
        $("#btnbox").click(function(e){
           $("#btn").trigger("click");   
        })    
        </script>
      </button></div><br><br>
      <input type="checkbox">이메일 주소 저장하기 
      <hr style="margin-left: 5%;margin-right: 5%;">
      <img alt="" src="${root }/image/naverloginbtn.png" style="width: 200px;height: 47px;margin-bottom: 1%;"><br>
     <img alt="" src="${root }/image/kakaologinbtn.png" style="width: 200px;height: 47px;">
      <hr style="margin-bottom: 12%">
      <div style="font-size: 10pt;">아직 회원이 아니세요?&nbsp;
      <a href="/member/addform" style="text-decoration: none;font-size: 10pt;">회원가입</a></div>
   
</form>
</div>
</div>
</div>
<br><br>
</body>
</html>