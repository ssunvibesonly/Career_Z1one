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
    $(".delete-member-btn").click(function() {
        var user_num = $(this).data("user_num");
        var ans = confirm("해당 회원을 추방하시겠습니까?");
        
        if (ans) {
            $.ajax({
                type: "get",
                dataType: "html",
                url: "deletemember",
                data: {"user_num":user_num},
                success: function() {
                	alert("추방되었습니다");
                    location.reload();
                }
            });
        } else {
            alert("취소되었습니다.");
            location.reload();
        }
    });
});

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
   <div class="idEdit"><a href="/member/adminnoticecheckpage?user_num=${user_num }">채용공고승인</a></div>
   <div class="applyEdit"><a href="/member/adminpage?user_num=${user_num }">회원정보관리</a></div>
</div>
<table class="table table-bordered" style="width: 70%; margin-left: 15%;">
	<tr align="center">
	<th>이메일</th><th>회원명</th><th>비밀번호</th><th>가입일</th><th>추방</th>
	<c:forEach var="user" items="${list }">
	<tr align="center" valign="middle">
		<td>${user.user_email }</td>
		<td>${user.user_name}</td>
		<td>${user.user_pass }</td>
		<td><fmt:formatDate value="${user.user_gaipday }" pattern="yyyy-MM-dd"/></td>
		<td>
			<button type="button"  class="btn btn-danger delete-member-btn" data-user_num="${user.user_num}">추방</button>
		</td>
	</tr>
	</c:forEach>
	</tr>
</table>
</div>
</body>
</html>