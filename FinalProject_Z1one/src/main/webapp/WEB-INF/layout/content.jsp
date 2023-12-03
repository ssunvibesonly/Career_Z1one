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
<div class="container" style="width: 1000px;">
	<div class="d-inline-flex">
		<h3><b>| 지금 뜨는 공채<img alt="" src="${root }/image/flames.png" style="width: 30px;"></b></h3>
		<a href="/company/ban" style="display: block; margin-top: 4%;" id="more">&nbsp;&nbsp;>채용공고 더보기</a>
	</div>
	<br>
	
	<c:forEach var="plist" items="${popularList }" begin="1" end="6">
		<div style="border: 1px solid black; width: 250px;
		height: 160px; border-radius: 10px;float: left;margin-right: 3%; margin-bottom: 1%;">
			<img alt="" src="../noticeImg/${plist.cnotice_image }" style="width: 250px;height: 120px; border-radius: 10px;float: left;margin-right: 3%; margin-bottom: 1%;">
		</div>
	</c:forEach>
	
</div>

</body>
</html>