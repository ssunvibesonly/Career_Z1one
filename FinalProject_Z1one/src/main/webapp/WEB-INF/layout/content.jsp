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
#more{
	text-decoration: none;
	font-size: 1.7vh;
}
</style>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
</head>
<body>
<div class="container" style="width: 880px;">
	<div align="right" style="margin-right: 7%;">
	<a href="/company/ban" style="display: block; margin-top: 4%;" id="more">&nbsp;&nbsp;>채용공고 더보기</a>
	</div>
	<br>
	
	<c:forEach var="plist" items="${popularList }">
		<a href="/company/detail?cnotice_num=${plist.cnotice_num }" style="text-decoration: none;color: gray;">
		<div style="border: 1px solid lightgray; width: 252px;
		height: 370px; border-radius: 10px;float: left;margin-right: 3%; margin-bottom: 1%;">
			<img alt="" src="../noticeImg/${plist.cnotice_image }" style="width: 250px;height: 170px; border-radius: 10px;float: left;margin-right: 3%; margin-bottom: 3%;"><br>
			<input type="hidden" ntname="${plist.cnotice_noticename }" class="gtext">
			&nbsp;&nbsp;<span style="font-size: 12pt;font-weight: bold;" class="noticetext"></span><br>
			<span>&nbsp;&nbsp;${plist.cnotice_industry1 } | ${plist.cnotice_industry2 }</span><br>
			<span>&nbsp;&nbsp;${plist.cnotice_career } | ${plist.cnotice_type }</span><br>
			<span>&nbsp;&nbsp;마감일 : ${plist.cnotice_deadline}</span>
			<hr style="width: 220px;margin-left: 6%;">
			<span>&nbsp;&nbsp;<img alt="" src="../image/won.png" style="width: 25px;">&nbsp;합격축하금 : <b>${plist.cnotice_congratulate }만원</b></span>
		</div></a>
	</c:forEach>
	
</div>
<script type="text/javascript">

var noticeTexts = document.querySelectorAll("span.noticetext");

noticeTexts.forEach(nt => {
    var ntname = $(nt).prev(".gtext").attr("ntname"); // jQuery를 사용하여 해당 요소의 ntname 속성 값을 가져옵니다.

    var originalText = ntname; // 가져온 텍스트를 originalText에 할당합니다.
    var maxLength = 15;

    if (originalText.length > maxLength) {
        var truncatedText = originalText.substring(0, maxLength) + "(...)"; // 텍스트를 일정 길이로 자릅니다.
        nt.textContent = truncatedText; // 자른 텍스트를 출력합니다.
    } else {
        nt.textContent = originalText; // 최대 길이보다 짧은 경우 그대로 출력합니다.
    }
});
</script>
</body>
</html>