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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
height: 230px;
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
#stars{
   position: relative;
   width: 150px;
   height: 30px;
   font-size: 30px;
   z-index: 1;
}
.star{
   position: absolute;
   width: 15px;
   height: 30px;
   opacity: 0;
   z-index: 10;
   top: 0;
}
.out1{left: 0;}
.out2{left: 10%;}
.out3{left: 20%;}
.out4{left: 30%;}
.out5{left: 40%;}
.out6{left: 50%;}
.out7{left: 60%;}
.out8{left: 70%;}
.out9{left: 80%;}
.out10{left: 90%;}
.bi-star{
   position: absolute;
   width: 30px;
   height: 30px;
   z-index: 0;
   top: 0;
   color: yellow;
}
.bi-star-fill{
   position: absolute;
   width: 30px;
   height: 30px;
   z-index: 0;
   top: 0;
   color: yellow;
}
.bi-star-half{
   position: absolute;
   width: 30px;
   height: 30px;
   z-index: 0;
   top: 0;
   color: yellow;
}
.star1{left: 0;}
.star2{left: 20%;}
.star3{left: 40%;}
.star4{left: 60%;}
.star5{left: 80%;}
</style>
<script type="text/javascript">

$(function(){
	
	list();
	sumStar();
	
	$("#insertReview").click(function(){
		
		var cn_idx='${cndto.cn_idx}'
		review_title=$("#review_title").val();
		review_goodthing=$("#review_goodthing").val();
		review_badthing=$("#review_badthing").val();
		review_wishced=$("#review_wishced").val();
		starscore=$("#starscore").text();
		
		//alert(review_title+"_"+review_goodthing+"_"+review_badthing+"_"+review_wishced+"_"+starscore);
		
		$.ajax({
			
			type:"post",
			dataType:"html",
			url:"reviewupload",
			data:{"cn_idx":cn_idx,"review_title":review_title,"review_goodthing":review_goodthing,"review_badthing":review_badthing,"review_wishced":review_wishced
				,"review_star":starscore},
			success:function(){
				
				
				sumStar();
				location.reload();
				
			}
			
		})
	})
	
	 $("div.star").on("click",function(){
	      var value=$(this).attr("value");
	      var fullcount=parseInt(value/2);
	      
	      if(value%2==0){
	         for(var i=0;i<fullcount;i++){
	            $("i.star"+(i+1)).attr("class","bi bi-star-fill star"+(i+1));
	         }
	         for(var i=fullcount;i<5;i++){
	            $("i.star"+(i+1)).attr("class","bi bi-star star"+(i+1));
	         }
	         $("#starscore").text(fullcount);
	      }else{
	         for(var i=0;i<fullcount;i++){
	            $("i.star"+(i+1)).attr("class","bi bi-star-fill star"+(i+1));
	         }
	         $("i.star"+(fullcount+1)).attr("class","bi bi-star-half star"+(fullcount+1));
	         for(var i=fullcount+1;i<5;i++){
	            $("i.star"+(i+1)).attr("class","bi bi-star star"+(i+1));
	         }
	         $("#starscore").text(fullcount+0.5);
	      }
	   });
})
function sumStar(){

	var cn_idx='${cndto.cn_idx}'
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"sumStar",
		data:{"cn_idx":cn_idx},
		success:function(res){
			//alert(res);
			//alert(star);
			$("#starplace").text(res);
		}
	})
	
}

function list(){

	var cn_idx='${cndto.cn_idx}'
	var s="";
	
	$.ajax({
		type:"post",
		dataType:"json",
		url:"readReview",
		data:{"cn_idx":cn_idx},
		success:function(res){
		
			
			
			//반복문, 까먹지 말자!!
			 $.each(res,function(index,ele){
				
				var review_title=ele.review_title;
				var review_star=ele.review_star;
				var review_goodthing=ele.review_goodthing;
				var review_badthing=ele.review_badthing;
				var review_wishced=ele.review_wishced;
				var review_writeday=ele.review_writeday;
				
				s+="<div  style='border: 1px solid gray;height: 200px;border-radius: 10px;'>"
				s+="<div style='margin-top: 1%;margin-left: 2%;'>"
				s+="<span><b style='color: green'>★</b>&nbsp;"+review_star+"</span>"
				s+="<span style='margin-left: 1%;margin-top: 1%;font-size: 8pt;'>"+review_writeday+"</span></div>"
				s+="<div style='margin-left: 3.8%;'>"
				s+="<span><i class='bi bi-person-circle' style='font-size: 20pt;'></i></span>"
				s+="<span style='margin-left: 2%;font-size: 10pt;'><b class='rtitle'>"+'"'+review_title+'"'+"</b></span><br>"
				s+="<span style='margin-left: 4%;color: blue;font-size: 10pt;'>장점&nbsp;&nbsp;"+review_goodthing+"</span><br>"
				s+="<span style='margin-left: 4%;color: red;font-size: 10pt;'>단점&nbsp;&nbsp;"+review_badthing+"</span>"
				s+="<hr style='width: 1150px;margin-left: 4%;'>"
				s+="<span style='margin-left: 4%;font-size: 10pt;'>경영진에게 바라는점&nbsp;&nbsp;"+review_wishced+"</span></div><br><br>"
				s+="</div><br>"
				$("#reviewContent").html(s);
				
				
				
			}) 
			
			
			
		}
	})
}
</script>
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
			<div class="info_div"style="position: absolute; left: 22%; top: 52%; width: 15%; margin-top: 4%;" ><b style="">★</b><b id="starplace"></b></div>
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
  	<div id="reviewContent"></div>
	
</div>
	</div>
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">| [${cndto.c_name }]</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input type="text" name="review_title" id="review_title" placeholder="Review Title" class="form-control">
      <div class="d-inline-flex">
      <div id="stars">
      <div class="star out1" value="1"></div>
      <div class="star out2" value="2"></div>
      <div class="star out3" value="3"></div>
      <div class="star out4" value="4"></div>
      <div class="star out5" value="5"></div>
      <div class="star out6" value="6"></div>
      <div class="star out7" value="7"></div>
      <div class="star out8" value="8"></div>
      <div class="star out9" value="9"></div>
      <div class="star out10" value="10"></div>
      <i class="bi bi-star star1"></i>
      <i class="bi bi-star star2"></i>
      <i class="bi bi-star star3"></i>
      <i class="bi bi-star star4"></i>
      <i class="bi bi-star star5"></i>
       
   </div>
  	<span id="starscore" style="margin-top: 8%;margin-left: 7%;"></span>
  	</div>
        <hr>
		<textarea placeholder="장점" name="review_goodthing" id="review_goodthing" class="form-control"></textarea>
      	<textarea placeholder="단점" name="review_badthing" id="review_badthing" class="form-control"></textarea>
      	<hr>
      	<textarea placeholder="경영진에게 바라는점" name="review_wishced" id="review_wishced" class="form-control"></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <button type="submit" class="btn btn-info" data-bs-dismiss="modal" id="insertReview">등록하기</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>

</div>
</body>
</html>