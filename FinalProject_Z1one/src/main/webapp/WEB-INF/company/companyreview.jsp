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
<title>기업리뷰</title>
</head>
<style type="text/css">
.input_search{
border: 1px solid purple;
width: 700px;
height: 45px;

}
#glass{
width: 40px;
height: 42px;
cursor: pointer;

}

#c_info_box{
width: 100%;
border: 1px solid black;
height: 200px;
margin-top: 1%;
border-radius: 10px;
}
#c_logo_box{
width: 15%;
height: 170px;
border: 1px solid black;
border-radius: 10px;
margin-top: 1%;
margin-left: 3%;
}

#c_logo_box2{
width: 100%;
border: 1px solid black;
height: 200px;
margin-top: 1%;
border-radius: 10px;
}

.info_div{
width: 100%;
height: 35px;
border:1px solid black;
}
</style>
<body>

<div align="center">
	<form>
	<span class="d-inline-flex">
		<input class="input_search form-control" id="search_bar_search_query" maxlength="201" name="query" 
		onclick="onSearchBar()" placeholder="기업, 채용 공고를 검색해보세요." 
		type="text"><img alt="" src="../image/search.png" id="glass">
	</span>
	</form>
</div>
<div class="container">
	<h3>|기업정보</h3>
	<div id="c_info_box">
		<div>
			<div id="c_logo_box">기업로고 들어올 곳</div>
			<div style="border: 1px solid black;position: absolute; left: 24%; top: 30%; width: 15%; display: flex;">
			<span style="border-radius: 10px; border: 1px solid black">채용중</span><span style="border-radius: 10px; border: 1px solid black;">강소기업</span>
			</div>
			
			<div style="position: absolute; border:5px solid black; left: 24%; top: 35%; width: 15%; height: 10%; margin-top: 1%;">기업명</div>
			<div style="position: absolute; border:5px solid black; left: 24%; top: 40%; width: 15%; margin-top: 4%;">광고홍보전시</div>
			
			<div style="display: flex;">
			<div style="position: absolute; border:1px solid black; right: 35%; top: 31%; width: 22%; height:23%;">
			<div class="info_div">1</div>
			<div class="info_div">1</div>
			<div class="info_div">1</div>
			<div class="info_div">1</div>
			</div>
			
			<div style="position: absolute; border:1px solid black; right: 13%; top: 31%; width: 22%; height:23%;">
			<div class="info_div">5</div>
			<div class="info_div">6</div>
			<div class="info_div">7</div>
			</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>