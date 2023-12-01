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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style>
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
</style>

</head>
<body>
<br>
<div class="container">
	<h3><b>| ${cndto.c_name }</b></h3><br>
	<div id="c_info_box">
		<div>
			<img alt="" src="../membersave/${cndto.c_img }"id="c_logo_box" >
			<div style="position: absolute; left: 22%; top: 17%; width: 15%; display: flex;">
			<span style="border-radius: 10px; border: 1px solid lightgray;">${cndto.c_type }</span>
			</div>
			
			<div style="position: absolute; left: 22%; top: 25%; width: 15%; height: 10%; 
			margin-top: 1%;"><p style="font-size: 23pt;">${cndto.c_name }</p></div>
			<div style="position: absolute; left: 22%; top: 35%; width: 15%; margin-top: 4%;">${cndto.c_main }</div>
			<div class="info_div"style="position: absolute; left: 22%; top: 52%; width: 15%; margin-top: 4%;">별점들어올곳</div>
			
			<div style="display: flex;">
			<div style="position: absolute; right: 23%; top: 17%; width: 40%; height:23%;">
			<div class="info_div">1차 산업군 : ${cndto.c_primary }</div>
			<div class="info_div">2차 산업군 : ${cndto.c_secondary }</div>
			<div class="info_div">본사 : ${cndto.c_realpath }</div>
			<div class="info_div">홈페이지 : ${cndto.c_homepage }</div>
			
			</div>
			
			</div>
		</div>
	</div>
	<hr>
	<div id="reviewbox">
	<div class="d-inline-flex" style="margin-bottom: 1%;">
	<h3><b>| 기업 리뷰&nbsp;&nbsp;</b></h3>
	<div align="right">
	<button type="button" class="btn-8 custom-btn" data-bs-toggle="modal" data-bs-target="#myModal">
    <span>리뷰 작성하기</span>
  </button></div></div>
	<form action="reviewInset" method="post">
	<div style="border: 1px solid gray;height: 200px;border-radius: 10px;">
	<span style="margin-left: 1%;margin-top: 1%;">리뷰 작성일</span>
	<span>기업 평점</span>
	</div>
	
	</form>
	</div>
	
</div>
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">[기업명]</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input type="text" name="review_title" placeholder="Review Title" class="form-control">
        <hr>
		<textarea placeholder="장점" name="review_goodthing" class="form-control"></textarea>
      	<textarea placeholder="단점" name="review_badthing" class="form-control"></textarea>
      	<hr>
      	<textarea placeholder="경영진에게 바라는점" name="review_wishced" class="form-control"></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <button type="submit" class="btn btn-info" data-bs-dismiss="modal">등록하기</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>