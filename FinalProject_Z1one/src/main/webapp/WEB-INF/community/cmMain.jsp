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
	width: 28%;
	height: 65px;
	margin-left: 77.5%;
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
	margin-top: -6%;
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
	border: 1px solid blue;
	margin-left: 3%;
	margin-top: 5%;
}

.box {
	width: 90px;
	height: 90px;
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
  width: 100%;
  height: 42px;
  padding-left: 10px;
  border: 2px solid #8f7cc4;
  border-radius: 5px;
  outline: none;
  background: white;
  color: #9E9C9C;
  margin-left: -10%;
}
.cmlistsearch button {
  position: absolute; 
  top: 0;
  right: 30px;
  width: 42px;
  height: 42px;
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
</style>
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
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
	<div>
		<%--상단 --%>
		<b style="font-size:14px;">✔${sessionScope.myid} 로그인중 </b>
		<button type="button" class="btn btn-info" onclick="location.href='/email/sendemail'">채용 공고 받기
		</button>
		<%--user_num은 로그인이 된다면 세션으로해서 user_num가져오기--%>

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
            <c:forEach items="${oneTitle}" var="dto" varStatus="loop">
            <div class="d-inline-flex list">
                    <div class="d-inline-flex" style="margin-top:0.5%; margin-left: 1%; width: 75%;">&nbsp;
                        <div style="width: 20%;">
                            <b>
                        <a href="제목클릭시 그 글로 넘어가게" style="text-decoration-line: none; color: black;">
                                ${dto.board_category} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <%--나중에 c:if 조건 줘서 내용에 이미지가 있으면 사진뜨고 없으면 안뜨게 만들기.--%>
                        </a>
                            </b>
                        </div>
						<%--아직 컨트롤러에 no 안넘김.--%>
                        <c:if test="${no!=null}">
                            <i class="bi bi-card-image"></i>
                        </c:if>

						<c:set var="limitedTitle" value="${dto.board_title}" />
						<c:if test="${fn:length(limitedTitle) > 15}">
							<c:set var="limitedTitle" value="${fn:substring(limitedTitle, 0, 15)}..." />
						</c:if>
                        <div style="width: 60%; margin-left: 8%">
                        &nbsp;${limitedTitle}
                        </div>

                    </div>
                <div style="margin-top:1%; margin-left: 40%; width: 28%; cursor: pointer;" onclick="location.href='#'">
                    <p style="color: black; font-size: 14px;"><fmt:formatDate value="${dto.board_writeday}" pattern="YYYY-MM-DD"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="bi bi-suit-heart"></i>&nbsp;${dto.board_like}
                    </p>
                </div>
            </div>
            </c:forEach>
         </div>

			<div class="mid1-2">
				<br> <b style="font-size: 18px; margin-left: 10%;">실시간 인기
					공고</b>
				<div class="ingi"
					style="color: darkslategray; width: 85%; height: 300px; margin-left: 12%; margin-top: 2%;">
					<br>
					<c:forEach items="${list1}" var="item" varStatus="loop">
						<div style="width: 100%;">
							<p class="rank">
								<em>${loop.index + 1}</em>&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"
									class style="text-decoration-line: none; color: black;">${item}&nbsp;&nbsp;&nbsp;D
									- </a>
							</p>
						</div>
					</c:forEach>
				</div>


				<div style="margin-top: 36%">
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
	<div class="mid2">
		<c:forEach items="${oneTitle}" var="dto">
			<div class="category1" style="margin-left: 5%;">
				<div class="d-inline-flex subject"
					style="width: 100%; height: 30px; margin-left: -1%; margin-top: 5%;">
					<div style="flex: 1;">
						<img src="${root}/image/${dto.board_num}.png"
							class="categoryimage">&nbsp;&nbsp; <b class="boardcategory">${dto.board_category}</b>
						<a href="/community/list" style="float: right; font-size: 13px;">더보기&nbsp;></a>
					</div>
				</div>
				<hr style="border: 2px solid darkgray;">
				<c:forEach items="${title}" var="dto0">
					<c:if test="${dto.board_category eq dto0.board_category}">
						<div class="cate_subject">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle1" value="${dto0.board_title}" />
								<c:if test="${fn:length(limitedTitle1) > 10}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle1, 0, 10)}..." />
								</c:if>
								<a href="글로들어가기">${limitedTitle1}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto0.board_readcnt}</b>
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
								<a href="글로들어가기">${limitedTitle2}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto1.board_readcnt}</b>
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
								<a href="글로들어가기">${limitedTitle3}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto2.board_readcnt}</b>
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
								<a href="글로들어가기">${limitedTitle4}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto3.board_readcnt}</b>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${title4}" var="dto4">
					<c:if test="${dto.board_category eq dto4.board_category}">
						<div class="cate_subject"
							style="width: 90%; height: 30px; margin-left: 5%; margin-top: 5%">
							<div style="margin-top: 4%">
								<c:set var="limitedTitle5" value="${dto4.board_title}" />
								<c:if test="${fn:length(limitedTitle5) > 10}">
									<c:set var="limitedTitle" value="${fn:substring(limitedTitle5, 0, 10)}..." />
								</c:if>
								<a href="글로들어가기">${limitedTitle5}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto4.board_readcnt}</b>
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
								<a href="글로들어가기">${limitedTitle6}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto5.board_readcnt}</b>
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
								<a href="글로들어가기">${limitedTitle7}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto6.board_readcnt}</b>
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
								<a href="글로들어가기">${limitedTitle8}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto7.board_readcnt}</b>
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
								<a href="글로들어가기">${limitedTitle9}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto8.board_readcnt}</b>
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
								<a href="글로들어가기">${limitedTitle10}</a> <b style="float: right">
								<a href="글로들어가기"></a><i class="bi bi-eye"></i>&nbsp;${dto9.board_readcnt}</b>
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
	<br>



	<%--하단--%>
	<div class="adverti"
		style="margin-top: 6%; cursor: pointer; margin-left: 26%; width: 50%; height: 85px;">
		<img src="${root}/image/Gwango1.JPG"
			style="width: 100%; height: 75px;"
			onclick="location.href='https://www.blindhire.co.kr/events/reward200?utm_source=site&utm_medium=blindweb&utm_campaign=resume23_1'">
	</div>

	<div class="bottom-right fixed box">
		<p>질문 GO</p>
	</div>
</body>

</html>
