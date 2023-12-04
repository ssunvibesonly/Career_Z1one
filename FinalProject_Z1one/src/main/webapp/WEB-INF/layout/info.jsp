<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
/* 로그인 CSS */
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

.loginbox{
border: 1px solid lightgray; 
border-radius:20px;
width: 350px;
height: 200px;
margin-left: 10%;


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

.mypagebtn{
position:absolute;
border: none; 
background: none; 
padding: 0; 
margin-left: 280px;
top: 430px;
}

.logoutbtn{
position:absolute;
top: 390px;
right: 165px;
border: none; 
background: none; 
padding: 0; 
float: right; 
margin: 0px 10px;  
z-index: 100;"
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
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<c:if test="${sessionScope.loginok==null && sessionScope.companyloginok==null}">
<div class="loginbox">
   <div style="margin-top: 10%;">
<h6 class="logincontext">Z1one에서 더 많은 정보를 받아가세요!</h6>
   <!-- 로그인 버튼 -->
    <div class="two" id="btnbox" style="margin-top: 30px;">
      <button type="button" id="btn" class="madebtn" onclick="location.href='/login/form'">
        Login
        <div class="fill-two"></div>
        <script type="text/javascript">
        $("#btnbox").click(function(e){
           $("#btn").trigger("click");   
        })
        
        </script>
      </button>
    </div>
    <br>
    <div style="margin-left: 18%;">
    <a href="/member/addform" class="loginplus" style="float: left;">회원가입&nbsp;&nbsp;</a>
    <a href="#" class="loginplus" style="float: left;">아이디 찾기&nbsp;&nbsp;</a>
    <a href="#" class="loginplus" style="float: left;">비밀번호 찾기&nbsp;&nbsp;</a>
    </div>
    </div>
    </div>
</c:if>

<c:if test="${sessionScope.loginok!=null && sessionScope.companyloginok==null}">
<div class="loginbox">
   <div style="margin-top: 10%;">
   <c:if test="${sessionScope.user_photo=='no' }">
   <img src="${root}/image/userphotonull.png" style="width: 70px; margin: 2px 20px;">
   </c:if>
   <c:if test="${sessionScope.user_photo!='no' }">
   <img src="${root}/applyphoto/${user_photo}" style="width: 70px; height:70px; margin: 2px 20px; border-radius: 100px;">
   </c:if>
   <h3 style="margin-left: 120px; margin-top: -70px;"><b>${user_name }</b></h3>
   <button class="logoutbtn"  onclick="location.href='/login/logoutaction'" >
<img src="${root }/image/logoutbutton.png" style="width: 80px; height: auto; border: 1px solid lightgray; border-radius: 10px;"></button>
   <button type="button" class="mypagebtn" onclick="location.href='/member/userapplypage?user_num=${user_num}'"><img src="${root }/image/mypagebutton.png" style="width: 40px; height: auto;"></button>
   
   <c:if test="${sessionScope.myid!=null }">
   <h6 style="margin-left: 121px; color: #A4A4A4; "><b>${sessionScope.myid }</b></h6>
   </c:if>
   <c:if test="${sessionScope.myid==null }">
   <br>
   </c:if>
    </div>
   <!-- 이력서 작성하기 버튼 -->
    <div class="two" id="btnbox">
      <c:if test="${sessionScope.loginok!=null && sessionScope.myid!='admin'}">
      <button type="button" id="btn" class="madebtn" onclick="location.href='/member/applyaddform?user_num=${user_num}'">
        내 이력서 작성하기
      </c:if>
      <c:if test="${sessionScope.loginok!=null && sessionScope.myid=='admin'}">
      <button type="button" id="btn" class="madebtn" onclick="location.href='/member/adminpage?user_num=${user_num}'">
        관리자페이지
      </c:if>
        <div class="fill-two"></div>
        <script type="text/javascript">
        $("#btnbox").click(function(e){
           $("#btn").trigger("click");   
        })
        
        </script>
      </button>
      
      <br>
      <br>
    </div>
    </div>
</c:if>

<c:if test="${sessionScope.companyloginok!=null && sessionScope.loginok==null}">

<div class="loginbox">
   <div style="margin-top: 10%;">
   
   <c:if test="${sessionScope.company_logo!=null }">
   <img src="${root}/membersave/${company_logo}" style="width: 70px; height:70px; border-radius:100px; margin: 2px 20px;">
   </c:if>
   <c:if test="${sessionScope.company_logo==null }">
   <img src="${root}/image/userphotonull.png" style="width: 70px; margin: 2px 20px;">
   </c:if>
   
   <h3 style="margin-left: 120px; margin-top: -70px;"><b>${company_name }</b></h3>
   <button class="logoutbtn"  onclick="location.href='/login/logoutaction'" >
<img src="${root }/image/logoutbutton.png" style="width: 80px; height: auto; border: 1px solid lightgray; border-radius: 10px;"></button>
   
   <c:if test="${sessionScope.myid!=null }">
   <h6 style="margin-left: 121px; color: #A4A4A4; "><b>${sessionScope.myid }</b></h6>
   </c:if>
   <c:if test="${sessionScope.myid==null }">
   <br>
    </c:if>
    </div>
   <!-- 이력서 작성하기 버튼 -->
    <div class="two" id="btnbox1">
      <button type="button" id="btn1" class="madebtn" onclick="location.href='/member/companymypage'">
        기업정보
        <div class="fill-two"></div>
        <script type="text/javascript">
        $("#btnbox1").click(function(e){
           $("#btn1").trigger("click");   
        })
        
        </script>
      </button>
      <br>
      <br>
    </div>
    </div>
</c:if>

</body>
</html>