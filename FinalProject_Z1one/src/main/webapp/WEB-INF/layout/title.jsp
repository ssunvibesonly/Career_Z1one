
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<title>Insert title here</title>
<style type="text/css">
a.nav-link {
	color: gray;
	font-size: 10pt;
}

.dropbtn {
	background-color: white;
	color: white;
	/* padding: 16px; */
	font-size: 16px;
	cursor: pointer;
	width: 30px;
}

.dropdown {
	/* position: absolute; */
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: white;
}
</style>

</head>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<body>

	<div class="d-inline-flex">
		<div style="max-width: 20%;">
			<a href="/"><img alt="" src="${root }/image/final_logo.gif"
				style="max-width: 70%;"></a>
		</div>
		<div style="margin-left: 1%; padding-top: 2%" class="ulsize">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link" href="/company/ban">채용공고</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/company/info">기업정보</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="/board/community">커뮤니티</a> <!-- 게시판 --></li>
				<li class="nav-item"><a class="nav-link" href="javascript:(0)"
					onclick="chat()"><img src="../image/chat.png"
						style="width: 30px;"></a> <script type="text/javascript">
							function chat() {
								window.open("/chat", "e","width=400px,height=800px,left=750px,top=100px");
							}
						</script></li>
			</ul>
		</div>
		<c:if test="${sessionScope.loginok!=null }">
		<div class="dropdown"
			style="position: absolute; top: 30px; right: 300px;">
			<div class="dropbtn">
				<c:if test="${apply_photo!=null}">
				<img src="../applyphoto/${apply_photo }"
					style="width: 30px;">
				</c:if>
				<c:if test="${apply_photo==null}">
				<img src="../image/userphotonull.png"
					style="width: 30px;">
				</c:if>
			</div>
			<div class="dropdown-content">
				<a href="#">계정</a> 
				<a href="/member/userapplypage?user_num=${user_num }">이력서</a>
			</div>
		</div>
		</c:if>
	</div>

</body>
</html>