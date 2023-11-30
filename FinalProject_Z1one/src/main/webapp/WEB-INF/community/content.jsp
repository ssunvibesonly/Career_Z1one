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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		list();

		// 값 넘어가는 지 확인하는 것
		var boardnum = $("#boardnum").val();

		// insert하기
		$("#btncommentadd").click(
				function() {
					var boardnum = "${boardnum}";
					alert(boardnum)
					var loginok = "${sessionScope.loginok}";
					var myid = "${sessionScope.myid}";
					alert(loginok + "," + myid)
					if (loginok == "") {
						location.href = '/login/form?community=yes&boardnum='
								+ boardnum;
					} else {
						var content = $("#content").val();
						//alert(content);

						if (content.length == 0) {
							alert("댓글을 입력해 주세요");
							return;
						}

						// 게시판에서 댓글 입력했을 때 ajax로 실행하기
						$.ajax({

							type : "post",
							dataType : "html",
							url : "/boardanswer/binsert",
							data : {
								"board_num" : boardnum,
								"content" : content
							},
							success : function() {

								// alert("insert 성공!");

								list();

								// 입력값 초기화
								$("#content").val("");
							}
						});
					}

				});

		$("div.likes").click(
				function() {

					//좋아요 엄지 누르면 색상 변경되게 하는 기능 작업
					var thumb = $(this).find("i").attr("class");
					//alert(thumb);
					var loginok = "${sessionScope.loginok}";
					var myid = "${sessionScope.myid}";
					//alert(loginok+","+myid);
					var boardnum = $("#boardnum").val(); //게시글 번호
					//var isLiked = thumb === 'bi bi-heart-fill';	
					//alert(isLiked); //false

					if (loginok != "") { //로그인 성공하면

						if (thumb == 'bi bi-heart') {
							$(this).find("i").attr("class", "bi bi-heart-fill")
									.css("color", "red");
							//좋아요 증가 기능
							$.ajax({

								type : "get",
								url : "/community/likes",
								dataType : "json",
								data : {
									"board_num" : boardnum
								},
								success : function(res) {
									//alert(res);

									$("div.likes").find("b").text(res); //b태그 찾아서 res로 넘겨받은 likes를 출력하면 좋아요 누르면 증가됨
								}
							});
						} else { //하트 취소할 때

							$(this).find("i").attr("class", "bi bi-heart").css(
									"color", "black");
							//좋아요 숫자 감소 기능
							$.ajax({

								type : "get",
								url : "/community/unlikes",
								dataType : "json",
								data : {
									"board_num" : boardnum
								},
								success : function(res) {

									$("div.likes").find("b").text(res);
								}
							});

						}

					} else {

						location.href = '/login/form?community=yes&boardnum='
								+ boardnum;
					}

				});

		//댓글 수정 ajax1_getnum
		$(document)
				.on(
						"click",
						".commentupdate",
						function() {

							idx = $(this).attr("idx");
							content = $(this).parent().prev().text();
							alert("hoihoho" + content)
							$(this).parent().prev().remove();

							//alert(idx+","+content);
							$(this)
									.parent()
									.before(
											"<input type='text' name='content' class='form-control' value='"+content+"'>");
							$(this)
									.parent()
									.before(
											"<span class='btnupdate' style='font-size:10px; color:gray; cursor:pointer;'>수정 | </span>");
							$(this)
									.parent()
									.before(
											"<span class='close' style='font-size:10px; color:gray; cursor:pointer;' content='"+content+"'>닫기</span>");
							$(this).parent().next().next().hide();
							$(this).parent().hide();

							/* $.ajax({  //$.는 jquery임!
								
								type:"get",
								dataType:"json",
								url:"/boardanswer/bdata",
								data:{"idx":idx},
								success:function(res){
									//alert(res.content);
									$("#updatecmt").val(res.content);
								}
								
							}); */
						});

		$(document).on("click", ".close", function() {
			var content = $(this).attr("content");
			alert(content)
			$(this).prev().prev().remove();
			$(this).prev().before("<span>" + content + "</span>");
			$(this).next().next().next().show();
			$(this).next().show();
			$(this).prev().hide();
			$(this).hide();

		});

		//댓글 수정 ajax2_update
		$(document).on("click", ".btnupdate", function() {

			var content = $(this).prev().val();
			var idx = $(this).next().next().find(".commentupdate").attr("idx");
			$(this).prev

			$.ajax({

				type : "post",
				dataType : "html",
				url : "/boardanswer/bupdate",
				data : {
					"idx" : idx,
					"content" : content
				},
				success : function() { //void라 res로 넘어올 거 없으니깐 빈칸
					//alert("성공")
					list();
					//$("#close").trigger("click");
					//$(".updatecmt").val(res.content);
				}
			});
		});

		//댓글 삭제
		$(document).on("click", ".commentdelete", function() {

			var idx = $(this).attr("idx");
			alert(idx);

			var a = confirm("해당 댓글을 삭제하시겠습니까?");

			if (a) {
				$.ajax({

					type : "get",
					dataType : "html",
					url : "/boardanswer/bdelete",
					data : {
						"idx" : idx
					},
					success : function() { //controller에서 return값 없어서 여기서는 res로 받아오지 않음
						list();
					}
				});
			}

		});

	});

	// 사용자 함수 정의하기 (댓글 목록)
	function list() {

		boardnum = $("#boardnum").val();
		//alert(boardnum);

		// 댓글 작성 숫자 표현 방법
		$
				.ajax({

					type : "get",
					dataType : "json",
					url : "/boardanswer/blist",
					data : {
						"board_num" : boardnum
					},
					success : function(res) {

						$("span.acount").text(res.length);

						// 댓글 실제로 나타내기 작업
						var s = "";

						$
								.each(
										res,
										function(i, dto) {
											//alert('${sessionScope.myid}');
											s += "<b class='emailfont'>"
													+ dto.user_email
															.substring(
																	0,
																	Math
																			.min(
																					dto.user_email.length,
																					3))
													+ "*"
															.repeat(Math
																	.max(
																			0,
																			dto.user_email.length - 3))
													+ "</b><br>"
											s += "&nbsp;&nbsp;<span class='fw-light contentfont'>"
													+ dto.content + "</span>"
											//s += "<span class='btnupdate' style='font-size:10px; color:gray; cursor:pointer;'>수정 | </span>";
											//s += "<span id='close' style='font-size:10px; color:gray; cursor:pointer;'>닫기</span>"
											s += "<span class='fw-light' style='font-size: 8pt; color: gray; float: right;'>";
											if (dto.user_email == '${sessionScope.myid}') {
												s += " <i class='bi bi-eraser commentupdate' idx='"+dto.content_num+"'></i>"
												s += "<i class='bi bi-x-lg commentdelete' idx='"+dto.content_num+"'></i></span><br>"
											} else {
												s += "</span><br>";
											}

											s += "<div class='fw-light' style='font-size: 8pt; color: gray; float: right;'>"
													+ dto.sdf_writeday
													+ "</div><hr>";

										});

						$("div.commentresult").html(s);

					}
				});
	}
</script>
<style type="text/css">
#userimg {
	width: 30px;
	height: 30px;
	border: 2px solid black;
	border-radius: 100%;
	margin-right: 10px;
	margin-left: 10px;
}

.comment {
	display: flex;
	justify-content: flex-start;
	align-items: center;
}

.bi-eraser {
	cursor: pointer;
}

.bi-x-lg {
	cursor: pointer;
}

/* 마우스를 올렸을 때 색상 변경 */
.bi-eraser:hover {
	color: blue;
	cursor: pointer;
}

.bi-x-lg:hover {
	color: red;
	cursor: pointer;
}

.emailfont {
	font-size: 13px;
	color: gray;
}

.contentfont {
	font-size: 13px;
}

.ataglist:link {
	text-decoration-line: none;
	width: 900px;
	justify-content: center;
	align-items: center;
	display: flex;
}

.ataglist:hover {
	color: green;
}
</style>
</head>
<body>
	<div style="margin: 50px 150px;">
		<table class="table table-bordered" style="width: 900px;">
			<tr>
				<td>
					<h4>
						<b style="font-size: 25px;">${dto.board_title }</b> <span
							style="font-size: 8pt; color: gray; float: right;"> <i
							class="bi bi-calendar"></i>&nbsp;<fmt:formatDate
								value="${dto.board_writeday }" pattern="yyyy-MM-dd HH:mm" /> <%-- <span style="font-size: 8pt; color: gray; float: right;"><i class="bi bi-eye"></i> ${dto.board_readcnt }</span> --%>
						</span>

					</h4> <span class="fw-bolder" style="font-size: 12px; color: #6f42c1;">작성자 │ </span><span style="font-size: 12px;">${displayedEmail}</span> 
						<span style="font-size: 8pt; color: gray;"><i class="bi bi-eye"></i>${dto.board_readcnt }</span> <c:if test="${dto.board_story!='no' }">
						<span style="float: right;"> 
						<c:forTokens items="${dto.board_photo}" delims="," var="photo">
								<a href="download?clip=${photo }"> <i class="bi bi-download"></i>&nbsp;&nbsp;
									<b>${photo }</b>
								</a>
								<br>
						</c:forTokens> <!-- clip은 downloadcontroller에서 만든 걸로 한 것!!-->
						</span>
					</c:if>
				</td>
			</tr>

			<tr>
				<td><c:if test="${bupload!=null }">
						<!-- 컨트롤러 content부분에 bupload생성한 이후 -->
						<span> <c:forTokens items="${dto.board_photo}" delims=","
								var="photo">
								<img alt="" src="../savefile/${photo}" style="width: 200px;">
							</c:forTokens> <%-- <c:forEach var="photo" items="${dto.board_photo }">
						<img alt="" src="../savefile/${photo }" style="width:200px;">
					</c:forEach> --%>
						</span>
					</c:if> <br> <span style="width: 600px;"><div>
							<pre>
								<!-- 엔터 먹는 pre 태그 -->${dto.board_story }
					</pre>
						</div></span> <br> <%-- <b>조회: ${dto.board_readcnt }</b> &nbsp;&nbsp;&nbsp; --%>
					<!-- <b>댓글: <span class="acount"></span></b>  댓글 개수를 표현  -->
					<div>
						<!-- 좋아요 -->
						<div class="d-inline-flex">
							<div class="likes">
								<span><i class="bi bi-heart" style="cursor: pointer;"></i><b
									style="font-size: 12px;"> ${dto.board_like }</b></span>
							</div>
							<div>
								&nbsp;<span><b><i class="bi bi-chat-left">&nbsp;</i><span
										style="font-size: 12px;" class="acount"></span></b></span>
								<!-- 댓글개수 -->
							</div>
						</div>
					</div></td>
			</tr>
			<tr>
				<th>
					<div class="commentresult"></div>
					<!-- 댓글 보이는 창 --> <input type="hidden" id="boardnum"
					value="${dto.board_num }">
					<div class="comment">
						<span><img alt="" src="../../image/user.png" id="userimg"></span>
						<span><textarea id="content" rows="" cols=""
								style="width: 750px; height: 80px; margin-right: 10px;"></textarea></span>
						<span><button type="button" class="btn btn-success"
								id="btncommentadd">등록</button></span>
					</div>
				</th>
			</tr>
		</table>
		<div>
			<a class="ataglist" href="list">목록</a>
		</div>
	</div>
</body>
</html>