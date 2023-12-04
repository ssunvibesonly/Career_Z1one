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
margin-left: 20%;
text-align: center;
padding : 20px 0;
font-weight: bold;
cursor: pointer;

}

.applyEdit{
width:10%;
height:70px;
border-bottom:5px solid purple;
text-align: center;
padding : 20px 0;
font-weight: bold;
cursor: pointer;

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
cursor: pointer;
}

a{
text-decoration: none;
color: black;
}

</style>
<title>Insert title here</title>
</head>
<script type="text/javascript">
function updateapply() {
	location.href="/member/applyupdateform?user_num="+${user_num};
}

$(function() {

	$(".applydelete").click(function(){
		
		var user_num=$(this).attr("user_num");
		//alert(user_num);
		
		var ans=confirm("정말로 이력서 삭제하시겠습니까?");
		
		if(ans){
			
			$.ajax({
				
				type:"get",
				dataType:"html",
				url:"deleteapply",
				data:{"user_num":user_num},
				success:function(){
					location.reload();
				}
			})
		}else {
			alert("취소되었습니다.");
			location.reload();
		}
	})
})

</script>
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
   <div class="idEdit"><a href="/member/usereditpage?user_num=${user_num }">계정</a></div>
   <div class="applyEdit"><a href="/member/userapplypage?user_num=${user_num }">이력서</a></div>
</div>
<div class="container">
   <h4 style="font-weight: 900;">이력서</h4>
   	  <c:if test="${apply_name!=null }">
      <button type="button" style="margin-left: 73%;" class="btn btn-info" onclick="location.href='/email/sendEmail?user_email=${sessionScope.myid}&user_num=${sessionScope.user_num}'">맞춤 공고 받기</button>
   	   </c:if>
   <c:if test="${apply_name!=null }">
   <input type="hidden" name="user_num" value="${user_num}"> 
   <div class="apply" onclick="updateapply()">
      <div style="background-color:#9F81F7; width: 4.5%; height: 2.5vh; border: 1px solid #9F81F7; 
      border-radius: 3px;  text-align: center; position: absolute; margin: 20px 20px;">
      <b style="position:absolute; font-size: 8pt; top: 0.5px; left: 6px; color: WHITE;" >대표 이력서</b>
      </div>
      <h5 style="margin: 60px 20px; font-weight: 900;">${apply_name }님의 이력서</h5>
      <h6 style="margin: 60px 20px;">최종업데이트일 : ${apply_writeday }</h6>
   </div>
   <img src="${root }/image/applydelete.png" class="applydelete" style="width: 2%; z-index: 100; position: absolute; top: 387px; right: 119px; cursor: pointer;" user_num="${user_num }">
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