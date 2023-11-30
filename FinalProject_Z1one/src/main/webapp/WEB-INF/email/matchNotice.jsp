<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
</head>
<style>
    .Top {
        margin-left: 10%;
        border: 1px solid black;
        width: 80%;
        height : 2000px;
    }
</style>
<body>
<h3 style="margin-left:10%; margin-top: 3%;"><b style="color:darkslateblue">${name}</b> 님 맞춤 공고 입니다</h3>
<h6 style="margin-left: 10%;">총 <b>${Total}</b> 개의 공고가 있습니다.</h6>
<br>
<div class="Top">
<c:forEach items="${list1}" var="dto">

</c:forEach>
</div>
</body>
</html>