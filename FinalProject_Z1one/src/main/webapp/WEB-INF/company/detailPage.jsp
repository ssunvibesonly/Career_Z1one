<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
   
    
</style>
</head>
<body>
<div style="width: 70vw; height: 60vh; border: 1px solid gray; position: relative; overflow: hidden;" class="container">
    <div style="width: 30%; position: absolute; right: 0; border: 1px solid gray;">
        <img alt="" src="../noticeImg/${dto.cnotice_Image}" width="99.9%" height="39.1%"><br>
        <!-- 기업정보 -->   
        <a style="font-size: 2vh;">기업정보<br>산업(업종)<br>사원수<br>설립년도<br>기업형태<br>홈페이지</a><br>
        <button style="width: 6vw; font-size: 1.5vh">기업정보</button>&nbsp;<button style="width: 12vw; font-size: 1.5vh">진행중인 채용보기</button>

    </div>
    <div style="display: inline-block; font-size: 1vh; margin-top: 2vw; margin-left: 0.5vw; border: 1px solid gray; width: 20vw;">회사명
        <i class="bi bi-shield-fill-check" style="color: blue;"></i>
        <i class="bi bi-coin"></i>
        <div style="border: 1px solid gray; display: inline-block;">합격축하금 100만원</div>
        <div style="border: 1px solid gray; display: inline-block;"><i class="bi bi-heart"></i>관심기업</div>
        <h2 style="font-size: 2.5vh">공고명</h2>
    </div>
<br><br><br><br>
    <div style="width: 15vw; border: 1px solid gray; font-size: 2vh; margin-left: 1vw;" class="d-inline-flex">
        <a>지원자격<br>경력<br>학력</a>
    </div>
    <div style="width: 15vw; border: 1px solid gray; font-size: 2vh; margin-left: 10vw;" class="d-inline-flex">
        <a>근무조건<br>고용형태<br>급여<br>지역<br>시간</a>
    </div> 
   
</div>

</body>
</html>