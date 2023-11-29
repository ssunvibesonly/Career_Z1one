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
.searchbox{
width: 60%;
height:60px;
border: 1px solid lightgray;
border-radius: 20px;
padding-bottom: 1%;
padding-top: 1%;
margin-left: 20%;

}

.click{
width: 90%;
height:100%;
margin-left: 3%;
border: 1px solid white;
}

.mypagemenu{
width: 100%;
height:70px;
margin-top:0.5%;
border-bottom: 1px solid lightgray;
border-top: 1px solid lightgray; 
}

.idEdit{
width:10%;
height:70px;
border: 1px solid yellow;
margin-left: 20%;
text-align: center;
padding : 20px 0;
font-weight: bold;

}

.applyEdit{
width:10%;
height:70px;
border: 1px solid yellow;
text-align: center;
padding : 20px 0;
font-weight: bold;

}

.container{
margin:45px 300px; 
}

.apply{
border: 1px solid #F2F2F2;
border-radius:10px;
background-color:#FAFAFA;
width: 85%;
height: 25vh;
margin-top: 1.7%;
}

</style>
<title>Insert title here</title>
</head>
<body>
<div>
   <form>
      <div class="d-inline-flex searchbox">
      <input type="text" class="form-control click" name="search">&nbsp;&nbsp;&nbsp;
      <div style="height: 100%;border: 0.5px solid lightgray;margin-right: 3%;"></div>
      <input type="image" src="${root}/image/search.png" alt="Search" style="width: 3%; margin-right: 3%;">
      </div>
   </form>
</div>
<div class="d-inline-flex mypagemenu">
   <div href="#" class="idEdit">계정</div>
   <div href="#" class="applyEdit">이력서</div>
</div>
<div class="container">
   <h4 style="font-weight: 900;">이력서</h4>
   
   <c:if test="${apply_name!=null }">
   <input type="hidden" name="user_num" value="${user_num}"> 
   <div class="apply" onclick="#">
      <div style="background-color:#9F81F7; width: 4.5%; height: 2.5vh; border: 1px solid #9F81F7; 
      border-radius: 3px;  text-align: center; position: absolute; margin: 20px 20px;">
      <b style="position:absolute; font-size: 8pt; top: 1px; left: 8px; color: WHITE;" >대표 이력서</b>
      </div>
      <h5 style="margin: 60px 20px; font-weight: 900;">${apply_name }님의 이력서</h5>
      <h6 style="margin: 60px 20px;">최종업데이트일 : ${apply_writeday }</h6>
   </div>
   </c:if>
   
   <c:if test="${apply_name==null }">      
   <form action="applyaddform" method="get">
   <input type="hidden" name="user_num" value="${user_num}">
   <div class="apply">   
      <input type="image" src="${root }/image/applyinserticon.png" style="width: 5%; margin: 65px 500px; cursor: pointer;">
   </div>   
   </form>
   </c:if>
   
</div>
</body>
</html>