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
<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin: 30px 400px;">
<h5><b>회원가입</b></h5>
<hr style="margin-top: 2%; width: 600px; margin-bottom: 2%">
<img src="${root }/image/gaipsuccess2.png" style="width: 500px; height: auto;">
<br>
<div style="margin-left: 13%;">
<button type="button" class="btn btn-outline-info" onclick="location.href='/login/form'">로그인</button>
<button type="button" class="btn btn-outline-danger" onclick="location.href='/'">메인</button>
</div>
</div>
</body>
</html>