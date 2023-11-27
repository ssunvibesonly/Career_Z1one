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
</head>
<style type="text/css">
.searchbox{
width: 40%;
height:70px;
border: 1px solid lightgray;
border-radius: 20px;
padding-bottom: 1%;
padding-top: 1%;

}

.click{
width: 90%;
height:100%;
margin-left: 3%;
border: 1px solid white;
}
</style>
<body>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
<hr>
<div>
	<form>
		<div class="d-inline-flex searchbox">
		<input type="text" class="form-control click" name="search">&nbsp;&nbsp;&nbsp;
		<div style="height: 100%;border: 0.5px solid lightgray;margin-right: 3%;"></div>
		<input type="image" src="${root}/image/search.png" alt="Search" style="width: 8%; margin-right: 3%;">
		</div>
	</form>
</div>
<br>
</body>
</html>