<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.info{

margin-right: 20%;
}
/* title 작은 화면 크기에 대한 스타일 (예: 모바일) */
@media (max-width: 768px) {
    .title {
        margin-top: 2%;
        margin-left: 1%;
        
    }
}

/* title 중간 화면 크기에 대한 스타일 (예: 태블릿) */
@media (min-width: 769px) and (max-width: 1024px) {
    .title {
        margin-top: 2%;
        margin-left: 1%;
    }
}

/* title 큰 화면 크기에 대한 스타일 (예: 데스크탑) */
@media (min-width: 1025px) {
    .title {
       margin-left: 1%;
       margin-top: 1%;
    }
}
/* info 작은 화면 크기에 대한 스타일 (예: 모바일) */
@media (max-width: 768px) {
    .info {
        margin-right: 5%;
        
    }
}

/* info 중간 화면 크기에 대한 스타일 (예: 태블릿) */
@media (min-width: 769px) and (max-width: 1024px) {
    .info {
        margin-right: 5%;
 		
    }
}

/* info 큰 화면 크기에 대한 스타일 (예: 데스크탑) */
@media (min-width: 1025px) {
    .info {
      	margin-right: 5%;

    }
}
</style>
</head>
<body>
<div class="layout">
	<div class="title">
		<tiles:insertAttribute name="title" />
	</div>
	<div class="header" align="center">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="main" >
		<tiles:insertAttribute name="main"/>
	</div>
<div class="d-inline-flex" >
	<div class="content" style="width: 840px; margin-left: 12%;">
		<tiles:insertAttribute name="content"/>
	</div>
	<div class="info">
		<tiles:insertAttribute name="info"/>
	</div>
</div>
</div>
</body>
</html>