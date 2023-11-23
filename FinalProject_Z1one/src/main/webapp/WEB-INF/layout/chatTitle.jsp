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
.chatheader{
border: 1px solid gray;
border-radius: 10px;
margin: 5%;
}

.hbox{
margin-top: 10px;
}
</style>
</head>
<body>
<div class="hbox">
<img alt="" src="../image/final_logo.gif" style="width: 60px;">
<b style="font-size: 10pt;font-family:Noto Serif KR;color: gray;">기업별 채팅방</b>
</div>
<div align="center"  class="search">
<div style="margin-top: 3%;width: 200px;" class="d-inline-flex">
<input type="text" class="form-control" placeholder="기업명 검색" style="font-size: 10pt;">&nbsp;
<input type="image" src="../image/search.png" style="width: 30px;height: 30px;">
</div>
</div>
<br>
<!-- <div class="chatheader" align="center">채팅방</div> -->
</body>
</html>