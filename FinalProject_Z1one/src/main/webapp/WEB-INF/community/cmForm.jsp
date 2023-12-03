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
<script type="text/javascript">
$(function() {
	
	$(".big").change(function(){
		var sel=$(this).val();
		//alert(sel);
		
		$(".sel").val("");
		
		for(var i=0;i<11;i++){
			var sel_cl=$(".sel option:eq("+i+")").attr("class");
			if(sel_cl=='form-control '+sel){
				$(".sel option:eq("+i+")").show();
			}
			else{
				$(".sel option:eq("+i+")").hide();
			}
		}
	});
	
});
</script>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 800px;margin-left: 100px;">
		<caption align="top"><h3>Z1one 커뮤니티</h3></caption>
		<tr>
			<th width="150">카테고리 대분류</th>
			<td>
				<select name="board_bigcategory" class="form-control big" required="required">
					<option class="form-control" value="not">선택</option>
					<option class="form-control" value="pre">취업준비</option>
					<option class="form-control" value="start">재직중</option>
					<option class="form-control" value="change">이직 | 퇴사</option>
					<option class="form-control" value="free">자유</option>
				</select>
			</td>
			
			<th width="150">카테고리 소분류</th>
			<td>
				<select name="board_category" class="form-control sel" required="required">
					<option class="form-control not" required="required" value="선택">선택</option>
					<option class="form-control pre" required="required" value="자소서">자소서</option>
					<option class="form-control pre" required="required" value="인적성">인적성</option>
					<option class="form-control pre" required="required" value="portfolio">portfolio</option>
					<option class="form-control pre" required="required" value="면접">면접</option>
					<option class="form-control start" required="required" value="회사생활">회사생활</option>
					<option class="form-control start" required="required" value="신입꿀팁">신입꿀팁</option>
					<option class="form-control change" required="required" value="이직story">이직story</option>
					<option class="form-control change" required="required" value="퇴사꿀팁">퇴사꿀팁</option>
					<option class="form-control free" required="required" value="Z1맘대로">Z1맘대로</option>
					<option class="form-control free" required="required" value="Z1마켓">Z1마켓</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="80">제목</th>
			<td colspan="3">
				<input type="text" name="board_title" class="form-control" required="required">
			</td>	
		</tr>
		<tr>
			<th width="80">파일업로드</th>
			<td colspan="3">
				<input type="file" name="upload" class="form-control" multiple="multiple"> <!-- dto에서 올릴 이름 정한 것 대로 넣어줘야 함, 그래서 name이 save가 됨  -->
			</td>	
		</tr>

		<tr>
			<td colspan="4">
			<textarea style="width: 100%;height: 350px;
					class="form-control" required="required" name="board_story" id="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="submit" class="btn btn-warning"
					style="width: 120px;">등록</button>
				
				<button type="button" class="btn btn-warning"
					style="width: 120px;"
					onclick="location.href='list'">목록</button>
			</td>
		</tr>
		
	</table>   
</form>

</body>
</html>