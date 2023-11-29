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
.input_search{
border: 1px solid purple !important;
width: 300px !important;
height: 45px !important;

}
#glass{
width: 40px;
height: 42px;
cursor: pointer;

}
.scrolling-text-container {
    width: 100%;
    overflow: hidden;
    position: relative;
    background-color: none;
    height: 5vh;
    font-size: 2.3vh;
    font-family: "Noto Serif KR";
    border-radius: 10px;
    
}

.scrolling-text ul {
	width: 20%;
    padding: 0;
    margin: 0;
    list-style: none;
    animation: scroll 30s linear infinite;
    color: black;

    margin-left: 17%;
}

@keyframes scroll {
    0% {
        transform: translateY(0%);
    }
    100% {
        transform: translateY(-100%);
    }
}

.time_new{
	margin-right: 10%;
	font-family: "Noto Serif KR";
	font-size: 2.3vh;
}
</style>
<body>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
<hr>
<div>
	<form>
	<span class="d-inline-flex" style="margin-bottom: 1%;">
		<input class="input_search form-control" id="search_bar_search_query" maxlength="201" name="query" 
		onclick="onSearchBar()" placeholder="기업, 채용 공고를 검색해보세요." 
		type="text"><img alt="" src="../image/search.png" id="glass">
	</span>
	</form>

<div class="scrolling-text-container scrolling-text" style="margin-left: -6%;margin-bottom: 1%;">
    <div class="scrolling-text">
    <div class="time_new"><b style="color: #9986EE;">[실시간 인기 게시글]</b></div>
        <!-- 글을 띄우는 리스트 -->
        	<ul>
            <c:forEach items="${resultlist }" var="dto" varStatus="i">
            	<li style="margin-bottom: 3%;">
            	<span style="margin-left: 20%;">${i.count }. <b>[${dto.board_category }]</b> ${dto.board_title }</span>
            	</li>
            </c:forEach>
        	</ul>
    </div>
</div>
</div>

</body>
</html>