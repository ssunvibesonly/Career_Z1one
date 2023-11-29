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
<body>
<h3 style="margin-left:25%; margin-top: 3%;">${name} 님 맞춤 공고 입니다</h3>
<c:forEach items="${list1}" var="dto">
    1) ${dto.cnotice_Image}
    2) ${dto.cnotice_Name}
    3) ${dto.cnotice_Team}
    4) ${dto.cnotice_Job}
</c:forEach>

</body>
</html>