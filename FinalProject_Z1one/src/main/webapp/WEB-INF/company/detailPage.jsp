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
<script type="text/javascript">
alert(${cnotice_num}+","+${company_num});
</script>
</head>
<body>
<div style="width: 100%; height: 100%; border: 1px solid gray; position: relative; overflow: hidden;" class="container">
<img alt="" src="../noticeImg/${dto.cnotice_image }" style="width: 50%; height: 30vh; margin-top: 3vw;"><br><br><br>
<h4 style="font-weight: bold;">${dto.cnotice_noticename }</h4>
<small>${dto.cnotice_companyname }&emsp;<i class="bi bi-star-fill" style="color: green;"></i>&nbsp;
${dto.cnotice_grade}&emsp;I&emsp;<c:forTokens items="${dto.cnotice_location }" delims=" " begin="0" end="0" var="location">
 ${location }
</c:forTokens></small><br><br>
<b>요약</b><br>
<span style="margin-left: 0.1vw;"><i class="bi bi-calendar4"></i>&nbsp;마감일&emsp;${dto.cnotice_deadline }</span><br>
<span style="margin-left: 0.1vw;"><i class="bi bi-briefcase"></i>&nbsp;직무&emsp;${dto.cnotice_industry2 }</span><br>
<span style="margin-left: 0.1vw;"><i class="bi bi-bar-chart-fill"></i>&nbsp;경력&emsp;${dto.cnotice_career }</span><br>
<span style="margin-left: 0.1vw;"><i class="bi bi-check2-circle"></i>&nbsp;고용형태&emsp;${dto.cnotice_type }</span><br>
<span style="margin-left: 0.1vw;"><i class="bi bi-geo-alt"></i>&nbsp;근무지역&emsp;${dto.cnotice_location }</span><br>
<span style="margin-left: 0.1vw;"><i class="bi bi-hammer"></i>&nbsp;스킬&emsp;${dto.cnotice_skill }</span><br><br>
<b>기업 소개</b><br>
<p>${cdto.cdetail_introduce }</p>
<b>주요 업무</b><br>
<p>${cdto.cdetail_work }</p>
<b>자격 요건</b><br>
<p>${cdto.cdetail_qualify }</p>
<b>우대사항</b><br>
<p>${cdto.cdetail_treat }</p>
<b>채용 절차</b><br>
<p>${cdto.cdetail_procedure }</p>
<b>복리후생</b><br>
<p>${cdto.cdetail_welfare }</p>
<b>기타</b><br>
<p>${cdto.cdetail_etc }</p>
<b>회사위치</b><br>
<p>${dto.cnotice_location}</p>

</div>

</body>
</html>