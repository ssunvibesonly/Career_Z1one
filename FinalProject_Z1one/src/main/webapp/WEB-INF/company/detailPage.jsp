<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
   div * {
        margin-left: 5%;
    }
</style>
</head>
<body>
<div style="width: 100%; height: 100%; border: 1px solid gray; position: relative; overflow: hidden;" class="container">
<img alt="" src="../noticeImg/${dto.cnotice_image }" style="width: 50%; height: 30%;"><br><br><br>
<h4 style="font-weight: bold;">${dto.cnotice_noticename }</h4>
<small>${dto.cnotice_companyname }&emsp;<i class="bi bi-star-fill" style="color: green;"></i>&nbsp;
<fmt:formatNumber value="${dto.cnotice_grade}" pattern="#,##0.0"/>&emsp;I&emsp;<c:forTokens items="${dto.cnotice_location }" delims=" " begin="0" end="0" var="location">
 ${location }
</c:forTokens></small><br><br>
<b>요약</b><br>
<span>마감일&emsp;${dto.cnotice_deadline }</span><br>
<span>직무&emsp;${dto.cnotice_industry2 }</span><br>
<span>경력&emsp;${dto.cnotice_career }</span><br>
<span>고용형태&emsp;${dto.cnotice_type }</span><br>
<span>근무지역&emsp;${dto.cnotice_location }</span><br>
<span>스킬&emsp;${dto.cnotice_skill }</span><br><br>
<b>기업 소개</b><br>


</div>

</body>
</html>