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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 50px 150px;">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td>
					<h4>
						<b>${dto.board_story }</b>
						<span style="font-size: 14pt; color: gray; float: right;">
							<fmt:formatDate value="${dto.board_writeday }" pattern="yyyy-MM-dd HH:mm"/>
						</span>
					</h4>
					
                        <span>작성자: ${displayedEmail}</span>
					
					<c:if test="${dto.board_story!='no' }">
						<span style="float: right;">
							<a href="download?clip=${dto.board_photo }">
								<i class="bi bi-download"></i>&nbsp;&nbsp;
								<b>${dto.board_photo }</b>
							</a>
							<!-- clip은 downloadcontroller에서 만든 걸로 한 것!!-->
						</span>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td>
					<c:if test="${bupload==true }">  <!-- 컨트롤러 content부분에 bupload생성한 이후 -->
						<img alt="" src="../savefile/${dto.board_photo }" style="width: 200px;">
					</c:if>
					<br><br>
					<pre><!-- 엔터 먹는 pre 태그 -->
						${dto.board_story }
					</pre>
					<br>
					<b>조회: ${dto.board_readcnt }</b> &nbsp;&nbsp;&nbsp;
					<b>댓글: <span class="acount"></span></b>  <!-- 댓글 개수를 표현  -->
				</td>
			</tr>
		</table>
	</div>
</body>
</html>