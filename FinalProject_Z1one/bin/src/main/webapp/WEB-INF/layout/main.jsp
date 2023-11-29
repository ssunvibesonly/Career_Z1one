<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<style>
.notice_box{
	
	width: 500px;
	margin: 0px 3% 0px 3%;
	border-radius: 20px;
}
.mainlogo{
width: 100%;
height: 120px;
border-radius: 20px;
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
	margin-right: 25%;
	font-family: "Noto Serif KR";
	font-size: 2.3vh;
}
</style>
<script>
$(function(){
	//페이지 로드 시 랜덤 이미지 삽입 호출하는 함수
	loadRandomImage();

})

//각 notice_box div에 이미지 삽입
function loadRandomImage(){
	
	//이미지 배열에 담기
	//const는 업데이트하거나 다시 선언할 수 없다.
	const imgArray=[
			'${root}/image/mainlogo1.png',
			'${root}/image/mainlogo2.png',
			'${root}/image/mainlogo3.png',
			'${root}/image/mainlogo4.png',
			'${root}/image/mainlogo5.png',
			'${root}/image/mainlogo6.png',
	]
	
	
	const boxes=document.querySelectorAll(".notice_box");
	const selectImg=[];
	
	//랜덤 이미지 선택
	for(var i=0;i<boxes.length;i++){
		
		var randomIndex;
		var randomImg;
	
	
	//중복되지 않는 이미지 선택
	do{
		randomIndex=Math.floor(Math.random()*imgArray.length); //Math.floor소수점 이하를 버림
		randomImg=imgArray[randomIndex];
	}while(selectImg.includes(randomImg)); //selectedImg 배열에 이미 randomImg가 있는지 확인합니다. .includes() 메서드는 배열에 특정 요소가 포함되어 있는지 여부를 확인합니다.
	
	selectImg.push(randomImg);
	
	//이미지 삽입
	//이미지 요소 추가
	const imgElement=document.createElement("img");
	imgElement.src=imgArray[randomIndex];
	imgElement.classList.add("mainlogo"); //classList.add() 메서드를 사용하여 클래스를 추가
	boxes[i].appendChild(imgElement);
	}
}


</script>

<body>
<div class="container">
<div style="display: flex;height: 150px;">
				<div class="notice_box" id="box1"></div>
				<div class="notice_box" id="box2"></div>
				<div class="notice_box" id="box3"></div>
</div>	
<div class="scrolling-text-container scrolling-text">
    <div class="scrolling-text">
    <div class="time_new"><b style="color: red;">[실시간 인기 게시글]</b></div>
        <!-- 글을 띄우는 리스트 -->
        	<ul>
            <c:forEach items="${resultlist }" var="dto" varStatus="i">
            	<li style="margin-bottom: 3%;">
            	<span>${i.count }. <b>[${dto.board_category }]</b> ${dto.board_title }</span>
            	</li>
            </c:forEach>
        	</ul>
    </div>
</div>

</div>
</body>
</html>