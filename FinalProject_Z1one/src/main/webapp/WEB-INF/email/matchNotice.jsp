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
<style type="text/css">
    .Top {
        width: 80%;
        height : 2000px;
        margin-left: 8%;
        border: 1px solid black;
    }
    .All {
        margin-left: 2%;
        margin-top: 2%;
        width:30%;
        height:450px;
        border-radius: 10px;
        cursor: pointer;
        border: 1px solid lavender;
    }
</style>


<body>
<h3 style="margin-left:8%; margin-top: 3%;"><b style="color:darkslateblue">${name}</b> 님 맞춤 공고 입니다</h3>
<h6 style="margin-left: 8%;">총 <b>${Total}</b> 개의 공고가 있습니다.</h6>
<br>
<%--전체를 감싸는 div--%>

<div class="Top">
    <c:forEach var="dto" items="${list}" varStatus="i">
        <div class="All" onclick="location.href='/company/detail/cnotice_num?=' + ${dto.cnotice_num}">
            <div class="image">
                <img src="../noticeImg/${dto.cnotice_image}" style="width: 100%; height: 200px;">
            </div>
            <hr style="border: 1.3px solid gray;">
            <div class="content">
                <div class="content-1" style="margin-left: 4%;">
                <h4><b>${dto.cnotice_noticename}</b></h4>
                <span>#${dto.cnotice_industry2}</span>&nbsp;
                    <span>#${dto.cnotice_career}</span>&nbsp;
                    <span>#${dto.cnotice_skill}</span>&nbsp;
                </div>
                <div class="content-2" style="border: 1px solid blue; width: 100%;">
                    <img src="../noticeImg/${dto.cnotice_image}" style="width: 30%; height: 25px;">
                    <b>${dto.cnotice_companyname}&nbsp;(${dto.cnotice_grade})&nbsp;(${dto.cnotice_readcount})</b>
                </div>
                <div class="content-3">
                    <b>회사 위치: ${dto.cnotice_location}</b>
                    <hr style="border :1.2px solid gray;">
                    <b>🎁 취업 축하금 : ${dto.cnotice_congratulate}만원</b>
                </div>
            </div>
        </div><%--All닫는것--%>
    </c:forEach>
</div><%--Top 닫는 것--%>

</body>
</html>