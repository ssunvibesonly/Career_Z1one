<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Z1커뮤니티</title>
</head>
<style type="text/css">
a {
	text-decoration: none;
	color: #191919;
}

.mySlides {
	width: 36%;
	height: 65px;
	margin-left: 76.5%;
	margin-top: -7%;
}

.click {
	width: 90%;
	height: 100%;
	margin-left: 3%;
	border: 1px solid white;
}

.top1 {
	width: 61%;
	height: 50px;
	margin-left: 12%;
}

.mid1 {
	width: 85%;
	height: 540px;
	margin-left: 11%;
}

.mid1-1 {
	margin-top: -1.8%;
	width: 100%;
	height: 520px;
}

.mid1-2 {
	background-color: #f2f2f3;
	margin-top: -4%;
	margin-left: 3%;
	width: 38%;
	height: 520px;
}

.list {
	width: 100%;
	height: 43px;
	margin-top: 0.5%;
}

.midone {
	width: 100%;
}

.mid2 {
	width: 85%;
	height: 1100px;
	margin-left: 9%;
	margin-top: 2%;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.category1 {
	width: 25%;
	height: 300px;
}

.categoryimage {
	width: 25px;
	height: 25px;
}

.boardcategory {
	font-size: 17px;
}

.cate_subject {
	margin-left: 3%;
	margin-top: 8%;
}

.box {
	width: 70px;
	height: 70px;
	background: lightgray;
	margin: 4px;
	border-radius: 10px;
}

.fixed {
	position: fixed;
}

.bottom-right {
	bottom: 10px;
	right: 10px;
}
form {
	position: relative;
	width: 50%;
	margin: 0 auto;
}
.cmlistsearch input {
	width: 90%;
	height: 52px;
	padding-left: 10px;
	border: 2px solid #8f7cc4;
	border-radius: 5px;
	outline: none;
	background: white;
	color: #9E9C9C;
	margin-left: -1%;
}
.cmlistsearch button {
	position: absolute;
	top: 0;
	right: 65px;
	width: 42px;
	height: 52px;
	border: none;
	background: #8f7cc4;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
}
.cmlistsearch button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: white;
}
.row{
	text-align: center;
	margin-left: 6%;
	margin-right: 6%;
	/* border: 1px solid green; */
}

.text-secondary{
	font-size: 13px;
	font-weight: bold;
	text-decoration: none;
	position: relative;
	margin-bottom: 2px;
	/* border: 1px solid red; */
}

.text-secondary::before{
	content: "";
	height: 3px;
	width: 0;
	background-color: black;
	border-radius: 10px;
	transition: 0.3s;
	position: absolute;
	bottom: -10px;
	left: 0;
}

.text-secondary:hover::before{
	width: 125%;
	left:-12.5%;
	bottom:-10px;
	background-color: black;
}
.topic{
	font-size: 12px;
	width:70px;
	border: 1px solid #6f42c1;
	border-radius:10px;
	margin-left: 10px;
	margin-top: 10px;
	background-color: #6f42c1;
	cursor: pointer;
}
</style>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
	<div>
		<br>
		<%--상단 --%>
		<form action="search">
			<div class="cmlistsearch">
				<input type="text" class="form-control click" name="searchword"
					placeholder="관심 내용을 검색해보세요!">&nbsp;&nbsp;&nbsp;
				<button type="submit"></button>
			</div>
		</form>

		<br><br><br>
		<div class="additionalDiv">
			<div class="mySlides">
				<img src="${root}/image/adver1.JPG">
			</div>
			<div class="mySlides">
				<img src="${root}/image/adver2.JPG">
			</div>
			<div class="mySlides">
				<img src="${root}/image/adver3.JPG">
			</div>
		</div>
	</div>
	<br>
	<br>
	<hr style="border: 2px solid black;">

	<div class="top1">
		<%--중간 제목--%>
		&nbsp;🔔&nbsp;&nbsp;<b style="font-size: 24px;">카테고리 베스트 토픽</b>
	</div>

	<div class="mid1">
		<%-- 중간 1--%>
		<div class="d-inline-flex midone">

        <%--카테고리별 인기글 띄우기--%>
        <div class="mid1-1"><br>
            <c:forEach items="${oneTitle}" var="dto" varStatus="i">
            <div class="d-inline-flex list">
                    <div class="d-inline-flex" style="margin-top:0.5%; margin-left: 1%; width: 65%;">&nbsp;
                        <div class="topic" onclick="location.href='/community/list'">
							<b style="color:white;">
									${dto.board_category} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</b>
                        </div>

						<c:set var="limitedTitle" value="${dto.board_title}" />
						<c:if test="${fn:length(limitedTitle) > 15}">
							<c:set var="limitedTitle" value="${fn:substring(limitedTitle, 0, 15)}..." />
						</c:if>
                        <div style="width: 60%; margin-left: 8%; cursor: pointer;" onclick="location.href='/community/content?board_num='+${dto.board_num}">
                        &nbsp;${limitedTitle}
                        </div>

                    </div>
                <div class="d-inline-flex" style="margin-top:1%; margin-left: 24%; width: 35%; cursor: pointer;" onclick="location.href='/community/content?board_num='+${dto.board_num}">
                    <div style="color: black; font-size: 14px;">
						<fmt:formatDate value="${dto.board_writeday}" pattern="yyyy-MM-dd"/>
					</div>

					<div style="margin-left: 9.5%; width:25%;">
                        <i class="bi bi-suit-heart"></i>&nbsp;${dto.board_like}
					</div>
						<div style="margin-left:8%;">
						<i class="bi bi-chat-square"></i>&nbsp;
						<c:forEach items="${contentList}" var="cdto" varStatus="j">
							<c:if test="${i.count==j.count}">
							${cdto.count}
							</c:if>
						</c:forEach>
						</div>

                </div>
            </div>
            </c:forEach>
         </div>

			<div class="mid1-2">
				<br> <b style="font-size: 18px; margin-left: 10%;">실시간 인기 공고</b>
				<div class="ingi"
					style="color: darkslategray; width: 95%; height: 300px; margin-left: 12%; margin-top: 2%;">
					<br>
					<c:forEach items="${list1}" var="item" varStatus="loop">
						<div class="ingi-1"style="width: 100%;">
							<p class="rank">
								<em>${loop.index + 1}</em>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/company/detail?cnotice_num=" + ${dto.cnotice_num} style="text-decoration-line: none; color: black;">
									<b>${item}</b>&nbsp;&nbsp;&nbsp;
								</a>
							</p>
						</div>
					</c:forEach>
				</div>


				<div style="margin-top: 28%; margin-left: 5%">
					<i class="bi bi-info-circle"
						style="margin-left: 10%; font-size: 13px;"></i>&nbsp;<b
						style="font-size: 13px;">Z1 에서 실시간으로 많이 클릭된 공고 순위</b>
				</div>
			</div>
		</div>
		<br>
		<br>
	</div>
	<%--중간1 닫기--%>

	<hr style="border: 2px solid black;">

	<%--중간 2 시작--%>
	<button type="button" class="btn btn-outline-dark" style="margin-left: 90%; margin-top: 1%;" onclick="location.href='/community/cmform'"><b>글 작성</b></button>
	<div class="mid2">
		<c:forEach items="${oneTitle}" var="dto">
			<div class="category1" style="margin-left: 5%;">
				<div class="d-inline-flex subject" style="width: 100%; height: 30px; margin-left: -1%; margin-top: 5%;">
					<div style="flex: 1;">
						<img src="${root}/community/${dto.board_num}.png" class="categoryimage">&nbsp;&nbsp; <b class="boardcategory">${dto.board_category}</b>
						<a href="/community/list" style="float: right; font-size: 13px;">더보기&nbsp;></a>
					</div>
				</div>

				<hr style="border: 2px solid darkgray;">

				<c:forEach items="${title}" var="dto0">
					<c:if test="${dto.board_category eq dto0.board_category}">
						<div class="cate_subject">
							<div style="margin-top: -2%;">
								<c:set var="limitedTitle1" value="${dto0.board_title}" />
								<c:if test="${fn:length(limitedTitle1) > 10}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle1, 0, 10)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto0.board_num}">
									${limitedTitle1}</a> <b style="float: right">
								</a>
								<i class="bi bi-eye"></i>&nbsp;${dto0.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title1}" var="dto1">
					<c:if test="${dto.board_category eq dto1.board_category}">

						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle2" value="${dto1.board_title}" />
								<c:if test="${fn:length(limitedTitle2) > 10}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle2, 0, 10)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto1.board_num}">${limitedTitle2}</a> <b style="float: right">
								<i class="bi bi-eye"></i>&nbsp;${dto1.board_readcnt}</b>
							</div>

						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title2}" var="dto2">
					<c:if test="${dto.board_category eq dto2.board_category}">
						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle3" value="${dto2.board_title}" />
								<c:if test="${fn:length(limitedTitle3) > 10}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle3, 0, 10)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto2.board_num}">${limitedTitle3}</a> <b style="float: right">
								<i class="bi bi-eye"></i>&nbsp;${dto2.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title3}" var="dto3">
					<c:if test="${dto.board_category eq dto3.board_category}">
						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle4" value="${dto3.board_title}" />
								<c:if test="${fn:length(limitedTitle4) > 10}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle4, 0, 10)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto3.board_num}">${limitedTitle4}</a> <b style="float: right">
								</a><i class="bi bi-eye"></i>&nbsp;${dto3.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title4}" var="dto4">
					<c:if test="${dto.board_category eq dto4.board_category}">
						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div>
								<c:set var="limitedTitle5" value="${dto4.board_title}" />
								<c:if test="${fn:length(limitedTitle5) > 10}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle5, 0, 10)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto4.board_num}">${limitedTitle5}</a> <b style="float: right">
								<i class="bi bi-eye"></i>&nbsp;${dto4.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title5}" var="dto5">
					<c:if test="${dto.board_category eq dto5.board_category}">
						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle6" value="${dto5.board_title}" />
								<c:if test="${fn:length(limitedTitle6) > 10}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle6, 0, 10)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto5.board_num}">${limitedTitle6}</a> <b style="float: right">
								<i class="bi bi-eye"></i>&nbsp;${dto5.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title6}" var="dto6">
					<c:if test="${dto.board_category eq dto6.board_category}">
						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle7" value="${dto6.board_title}" />
								<c:if test="${fn:length(limitedTitle7) > 10}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle7, 0, 10)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto6.board_num}">${limitedTitle7}</a> <b style="float: right">
								<i class="bi bi-eye"></i>&nbsp;${dto6.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title7}" var="dto7">
					<c:if test="${dto.board_category eq dto7.board_category}">
						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle8" value="${dto7.board_title}" />
								<c:if test="${fn:length(limitedTitle8) > 5}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle8, 0, 5)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto7.board_num}">${limitedTitle8}</a> <b style="float: right">
								<i class="bi bi-eye"></i>&nbsp;${dto7.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title8}" var="dto8">
					<c:if test="${dto.board_category eq dto8.board_category}">
						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle9" value="${dto8.board_title}" />
								<c:if test="${fn:length(limitedTitle9) > 5}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle9, 0, 5)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto8.board_num}">${limitedTitle9}</a> <b style="float: right">
								<i class="bi bi-eye"></i>&nbsp;${dto8.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title9}" var="dto9">
					<c:if test="${dto.board_category eq dto9.board_category}">
						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle10" value="${dto9.board_title}" />
								<c:if test="${fn:length(limitedTitle10) > 5}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle10, 0, 5)}..." />
								</c:if>
								<a href="/community/content?board_num=${dto9.board_num}">${limitedTitle10}</a> <b style="float: right">
								<i class="bi bi-eye"></i>&nbsp;${dto9.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
	<%--중간 2 닫기--%>
	<br>
	<br>
	<br>
	<%--하단--%>
	<div class="adverti" style="margin-top: 6%; cursor: pointer; margin-left: 26%; width: 50%; height: 110px;">
		<div class="footSlides">
		<img src="${root}/community/Gwango1.JPG" style="width: 100%; height: 110px;" onclick="location.href='https://www.blindhire.co.kr/events/reward200?utm_source=site&utm_medium=blindweb&utm_campaign=resume23_1'">
		</div>
		<div class="footSlides">
			<img src="${root}/community/Gwango2.JPG" style="width:100%; height: 110px;" onclick="location.href='#'">
		</div>
		<div class="footSlides">
			<img src="${root}/community/Gwango3.JPG" style="width:100%; height: 110px;" onclick="location.href='#'">
		</div>
	</div>

	<div class="bottom-right fixed box">
		<div style="margin-left: 8.5%; margin-top:4%; cursor:pointer;">
		<img src="../community/chatgpt.png" style="width:90%; height:61px;" onclick="location.href='https://chat.openai.com/'">
		</div>
	</div>
	<script>
		let slideIndex = 0;
		function showSlides() {
			let i;
			const slides = document.getElementsByClassName("mySlides");

			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}

			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1;
			}

			slides[slideIndex - 1].style.display = "block";
			setTimeout(showSlides, 2000); // Change slide every 2 seconds
		}
		showSlides();
	</script>
	<script>
		let slideindex = 0;
		function showSlides() {
			let i;
			const slides = document.getElementsByClassName("footSlides");

			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}

			slideindex++;
			if (slideindex > slides.length) {
				slideindex = 1;
			}

			slides[slideindex - 1].style.display = "block";
			setTimeout(showSlides, 2000); // Change slide every 2 seconds
		}
		showSlides();
	</script>
</body>

</html>
