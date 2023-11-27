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
<script type="text/javascript">
$(function(){

    list();

    // 값 넘어가는 지 확인하는 것
    var boardnum = $("#boardnum").val();
    
    

    // insert하기
    $("#btncommentadd").click(function(){

        var content = $("#content").val();
        //alert(content);

        if(content.length == 0){
            alert("댓글을 입력해 주세요");
            return;
        }

        // 게시판에서 댓글 입력했을 때 ajax로 실행하기
        $.ajax({

            type: "post",  
            dataType: "html",  
            url: "/boardanswer/binsert", 
            data: {"board_num": boardnum, "content": content},
            success: function(){

                // alert("insert 성공!");

                list();

                // 입력값 초기화
                $("#content").val("");
            }
        }); 
    });
    
    
	$("div.likes").click(function(){
			
			//좋아요 엄지 누르면 색상 변경되게 하는 기능 작업
			var thumb=$(this).find("i").attr("class");
			//alert(thumb);
			
			if(thumb=='bi bi-hand-thumbs-up'){
				$(this).find("i").attr("class","bi bi-hand-thumbs-up-fill").css("color","black");
				
			}else{
				$(this).find("i").attr("class","bi bi-hand-thumbs-up").css("color","black");
			}
			
			
			//좋아요 증가 기능
			 $.ajax({
				
				type:"get",
				url:"/community/likes",
				dataType:"json",
				data:{"board_num":boardnum},
				success:function(res){
					//alert(res);
					$("div.likes").find("b").text(res);  //b태그 찾아서 res로 넘겨받은 likes를 출력하면 좋아요 누르면 증가됨
				}
			}); 
		});
    
});



    // 사용자 함수 정의하기 (댓글 목록)
    function list(){

        boardnum = $("#boardnum").val();
		alert(boardnum);
        
        // 댓글 작성 숫자 표현 방법
         $.ajax({

            type: "get",
            dataType: "json",
            url: "/boardanswer/blist",
            data: {"board_num": boardnum},
            success: function(res){

                $("span.acount").text(res.length);

                // 댓글 실제로 나타내기 작업
                var s = "";

                $.each(res, function(i, dto){

                    s += "<b>익명</b>: " + dto.content;
                    s += "<span style='font-size: 14pt; color: gray; float: right;'>";
					s += dto.sdf_writeday+"</span><br>";
						
                });

                $("div.commentresult").html(s);

            }
        });
    } 

</script>
<style type="text/css">
	#userimg{
		width: 30px;
		height: 30px;
		border: 2px solid black;
		border-radius: 100%;
		margin-right: 10px;
		margin-left: 10px;
		
	}
	
	.comment{
		display: flex;
    	justify-content: flex-start;
   		align-items: center;
	}
</style>
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
					<!-- <b>댓글: <span class="acount"></span></b>  댓글 개수를 표현  -->
					<div>
						<div class="likes">
							<i class="bi bi-hand-thumbs-up" style="cursor: pointer;"></i><b>${dto.board_like }</b>
						</div>
						<%-- <span class="dislike" style="cursor: pointer;"><i class="bi bi-hand-thumbs-down"></i>${dto.board_dislike }</span> --%>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<b>댓글: <span class="acount"></span></b><!-- 댓글개수 -->
					<div class="commentresult">댓글보이는창</div>
					<input type="hidden" id="boardnum" value="${dto.board_num }">
					<div class="comment">
						<span><img alt="" src="../../image/user.png" id="userimg"></span>
						<span><textarea id="content" rows="" cols="" style="width: 450px; height: 80px; margin-right: 10px;"></textarea></span>
						<span><button type="button" class="btn btn-success" id="btncommentadd">등록</button></span>
					</div>
				</th>
			</tr>
		</table>
	</div>
</body>
</html>