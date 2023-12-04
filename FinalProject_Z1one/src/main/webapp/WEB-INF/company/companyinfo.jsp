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
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>기업정보</title>
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
position: relative;
}
#c_logo_box{
width: 15%;
height: 170px;
border-radius: 10px;
margin-top: 1%;
margin-left: 2%;
}


.info_div{
width: 100%;
height: 35px;
}

.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

/* 8 */
.btn-8 {
  background-color: #f0ecfc;
background-image: linear-gradient(315deg, #f0ecfc 0%, #c797eb 74%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-8 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-8:before,
.btn-8:after {
  position: absolute;
  content: "";
  right: 0;
  bottom: 0;
  background: #c797eb;
  /*box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);*/
  transition: all 0.3s ease;
}
.btn-8:before{
   height: 0%;
   width: 2px;
}
.btn-8:after {
  width: 0%;
  height: 2px;
}
.btn-8:hover:before {
  height: 100%;
}
.btn-8:hover:after {
  width: 100%;
}
.btn-8:hover{
  background: transparent;
}
.btn-8 span:hover{
  color: #c797eb;
}
.btn-8 span:before,
.btn-8 span:after {
  position: absolute;
  content: "";
  left: 0;
  top: 0;
  background: #c797eb;
  /*box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);*/
  transition: all 0.3s ease;
}
.btn-8 span:before {
  width: 2px;
  height: 0%;
}
.btn-8 span:after {
  height: 2px;
  width: 0%;
}
.btn-8 span:hover:before {
  height: 100%;
}
.btn-8 span:hover:after {
  width: 100%;
}
.bigcompany{
	border-radius: 10px;
	border: 1px solid lightgray;
	background-color: #8C8CFF;
}
.middlecompany{
	border-radius: 10px;
	border: 1px solid lightgray;
	background-color: #57E9E1;

}
.smallcompany{
	border-radius: 10px;
	border: 1px solid lightgray;
	background-color: #FFB937;

}
body{
	font-family: Noto Serif KR;
}
</style>
<script>
	$(function(){
		list();
		star();
	});
	function star(){
		var boxes=document.querySelectorAll("div.starinfo");
		boxes.forEach(box => {
			var idx=box.getAttribute("idx");
			//alert(idx)
			//getsum(idx);
			//alert(starscore,box)
			$.ajax({
				type:"get",
				dataType:"json",
				url:"/company/sumStar",
				data:{"cn_idx":idx},
				success:function(res){
					box.textContent=res;
				}
			});
		})
	}
	function list(){
		
		var boxes=document.querySelectorAll("span.giuptype");
		boxes.forEach(box=>{
			var giup=box.getAttribute("giup");
			
			//alert(giup);
			if(giup=="대기업"){
				box.classList.add("bigcompany");
			}
			if(giup=="중견기업"){
				box.classList.add("middlecompany");
			}
			if(giup=="중소기업"){
				box.classList.add("middlecompany");
			}
		})
		
	}
</script>
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
	<c:forEach items="${cnInfoList }" var="cInfo">
	<div id="c_info_box">
		<div>
			<img alt="" src="../membersave/${cInfo.c_img }"id="c_logo_box" >
			<div style="position: absolute; left: 22%; top: 30%; width: 15%; display: flex;">
			<span giup="${cInfo.c_type }" class="giuptype">${cInfo.c_type }</span>
			</div>
			
			<div style="position: absolute; left: 22%; top: 32%; width: 15%; height: 10%; 
			margin-top: 1%;margin-bottom: 1%;"><p style="font-size: 23pt;">${cInfo.c_name }</p></div>
			<div style="position: absolute; left: 22.2%; top: 33%; width: 15%; margin-top: 4%;">${cInfo.c_main }</div>
			
			<div style="display: flex;">
			<div style="position: absolute; right: 35%; top: 13%; width: 30%; height:23%;">
			<div class="info_div">1차 산업군 : ${cInfo.c_primary }</div>
			<div class="info_div">2차 산업군 : ${cInfo.c_secondary }</div>
			<div class="info_div">본사 : ${cInfo.c_realpath }</div><br>
			<div class="info_div">홈페이지 : ${cInfo.c_homepage }</div>
			</div>
			
			<div style="position: absolute; right: 8%; top: 31%; width: 22%; height:23%;">
			<div class="d-inline-flex"><b style="color: yellow">★</b><div class="info_div starinfo" idx="${cInfo.cn_idx }">등록된 리뷰가 없습니다.</div></div><br>
			<button type="button" class="custom-btn btn-8" onclick="location.href='review?cn_idx=${cInfo.cn_idx}'"><span>Review</span></button>
			
			</div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>
</body>
</html>