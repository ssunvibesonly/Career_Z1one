<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<title>Insert title here</title>
<style>
	table.table{
		width: 690px;
	}
	#add{
		float: right;
	}
	td>a{
		text-decoration: none;
	}
	a.tit{
		color: black;
	}
	.outline{
		width: 33px;
		height: 20px;
		border: 1px solid green;
		border-radius: 30px;
		font-size: 0.8em;
		text-align: center;
		color: green;
		float: right;
		cursor: pointer;
	}
	.outline:hover{
		border: 0px;
		color: white;
		background: green;
	}
	.modal-body{
		overflow: auto;
	}
	.dday{
		border: 1px solid red;
		border-radius: 6px;
		background-color: #F06E6E;
		color: white;
	}
	.blink-color {
        background-color: rgb(178, 34, 34) !important;
    }
    a.button {
		display: block;
		position: relative;
		width: 80px;
		padding: 0;
		margin: 2px 0 2px 0;
		font-weight: 600;
		text-align: center;
		line-height: 33px;
		color: #FFF;
		border-radius: 5px;
		transition: all 0.2s ;
		text-decoration: none;
	}
	.btnPush:hover {
		margin-top: 4px;
		margin-bottom: 0;
	}
	.btnBlueGreen {
		background: #00AE68;
	}
	.btnBlueGreen.btnPush {
		box-shadow: 0px 2px 0px 0px #007144;
	}
	.btnBlueGreen.btnPush:hover {
		box-shadow: 0px 0px 0px 0px #007144;
	}
	.btnLightBlue {
		background: #5DC8CD;
	}
	.btnLightBlue.btnPush {
		box-shadow: 0px 2px 0px 0px #1E8185;
		line-height: 25px;
	}
	.btnLightBlue.btnPush:hover {
		box-shadow: 0px 0px 0px 0px #1E8185;
	}
	.btnSlide.btnGray {
		background: 0;
	}
	.btnSlide .top {
		position: absolute;
		top: 0px;
		left: 0;
		width: 120px;
		height: 50px;
		background: #00AE68;
		z-index: 10;
		transition: all 0.2s ;
		border-radius: 5px;
	}
	.btnSlide.btnGray .top {
		background: gray;
	}
	.btnSlide .bottom {
		position: absolute;
		top: 0;
		left: 0;
		width: 120px;
		height: 50px;
		color: #000;
		z-index: 5;
		border-radius: 5px;
	}
	.btnSlide:hover .top {
		top: 40px;
	}
	#search{
		position: absolute;
		background: white;
		opacity: 0.8;
	}
</style>
</head>
<script>
	$(function(){
		setInterval(() => countdown(),1000);
		
		$(document).on("click","div.outline",function(){
			$("div.modal-dialog").attr("class","modal-dialog modal-lg");
			$("div.modal-body").empty();
			$("div.modal-body").html("<canvas id='bar-chart' width='300' height='230'></canvas>")
			
			var c_code=$(this).attr("code");
			var r_title=$(this).attr("ttl");
			var on_count=parseInt($(this).prev().text());
			
			$("h4.modal-title").text(r_title+" 진행상황");
			
			$.ajax({
				data:{"c_code":c_code,"r_title":r_title},
				type:"get",
				dataType:"json",
				url:"/recruit/outline",
				success:function(res){
					var levellist=res.levellist;
					var outlinelist=res.outlinelist;
					levellist[levellist.length]="최종합격";
					outlinelist[outlinelist.length]=res.finalpass;
					
					var chart=new Chart(document.getElementById("bar-chart"),{
						type:"bar",
						data:{
							labels:levellist,
							datasets:[{
								label:"인원(명)",
								backgroundColor:getRandomColor(levellist.length),
								data:outlinelist
							}]
						},
						options:{
							legend:{display:false},
							title:{
								display:false
							},
							scales:{
								yAxes:[{
									ticks:{
										display:true,
										min:0,
										max:Math.max(on_count/2,Math.max.apply(null,outlinelist)),
										stepSize:1
									}
								}]
							}
						}
					});
					$("#chart").trigger("click");
				}
			});
		});
		
		$(document).on("click","th.rno",function(){
			//alert($("th:eq(0)").offset().top)
			var width=$(this).attr("width");
			$("#search").html("순번으로 검색<input type='text' name='rno' id='searchtext' placeholder='순번' class='form-control' onkeyup='checkNum(this);'>");
			$("#search").css({
				"width":width+"px",
				"top":$("th:eq(0)").offset().top-91,
				"left":$("th:eq(0)").offset().left
			});
			$("#searchtext").focus();
		});
		$(document).on("click","th.rname",function(){
			var width=$(this).attr("width");
			$("#search").html("채용과정명으로 검색<input type='text' name='rname' id='searchtext' placeholder='채용과정명' class='form-control'>");
			$("#search").css({
				"width":width+"px",
				"top":$("th:eq(1)").offset().top-66,
				"left":$("th:eq(1)").offset().left
			});
			$("#searchtext").focus();
		});
		$(document).on("click","th.rdead",function(){
			var width=$(this).attr("width");
			$("#search").html(
				"마감일<input type='date' name='rdead' id='searchsel' class='form-control'>D&nbsp;-&nbsp;Day<input type='text' name='rdday' id='searchtext' placeholder='0 입력시 종료 검색' class='form-control' onkeyup='checkNum(this);'>"
			);
			$("#search").css({
				"width":width+"px",
				"top":$("th:eq(2)").offset().top-128,
				"left":$("th:eq(2)").offset().left
			});
			$("#searchtext").focus();
		});
		
		$(document).on("focusout","#searchtext",function(){
			if($("#searchsel").length==0 || $("#searchsel:hover").length==0){
				$("#search").html("");
			}
		});
		$(document).on("focusout","#searchsel",function(){
			if($("#searchtext:hover").length==0){
				$("#search").html("");
			}
		})
		
		$(document).on("keyup","#searchtext",function(){
			var col=$(this).attr("name");
			var input=$(this).val();
			var eleall;
			
			if(col=="rno"){
				//checkNum(input);
				eleall=$("td.rno");
			}else if(col=="rname"){
				eleall=$("a.tit");
			}else if(col=="rdday"){
				//checkNum(input);
				eleall=$("div.dday");
			}
			
			$(eleall).each(function(i){
				if($(this).text().toUpperCase().includes(input.toUpperCase())){
					$(this).closest("tr.tr").attr("class","tr show");
				}
			});
			showtr();
		});
		$(document).on("change","#searchsel",function(){
			var col=$(this).attr("name");
			var input=$(this).val();
			var eleall=document.querySelectorAll("span.time");
			
			$(eleall).each(function(i){
				if($(this).text().toUpperCase().includes(input.toUpperCase())){
					$(this).closest("tr.tr").attr("class","tr show");
				}
			});
			showtr();
		});
		$(document).on("change","#searchsel",function(){
			$("#searchtext").val("");
		});
		$(document).on("keyup","#searchtext",function(){
			$("#searchsel").val("");
		});
		
		$(document).on("mouseleave","span.top",function(){			
			$("input.bottom").blur();
			$("input.bottom").val("");
			$(this).text("더보기");
		});
		$(document).on("mouseenter","input.bottom",function(){
			$(this).focus();
		});
		$(document).on("keyup","input.bottom",function(){
			var input=$(this).val();
			$("span.top").text("변경");
		});
		$(document).on("mouseleave","input.bottom",function(){
			var input=$("input.bottom").val();
			
			if(input!=""){
				$("tr.tr").hide();
				for(var i=0;i<input;i++){
					$("tr.tr:eq("+i+")").show();
				}
			}
		});
	});
	
	function countdown(){
		var times=document.querySelectorAll("span.time");
		var rtimes=document.querySelectorAll("div.rtime");
		var now=new Date();
		
		for(var i=0;i<times.length;i++){
			rtimes[i].setAttribute("dead",times[i].getAttribute("dead"));
		}
		rtimes.forEach(div => {
			var dead=new Date(div.getAttribute("dead"));
			var nt=now.getTime();
			var dt=dead.getTime();
			
			if(nt<dt){
				sec = parseInt(dt - nt) / 1000;
			    hour = parseInt(sec/60/60);
			    sec = (sec - (hour*60*60));
			    min = parseInt(sec/60);
			    sec = parseInt(sec-(min*60));
			    
			    if(hour<24){
			    	if(hour<10){hour="0"+hour;}
				    if(min<10){min="0"+min;}
				    if(sec<10){sec="0"+sec;}
				    
				    var ddays = div.querySelector("div.dday");
				    if (ddays.classList.contains("blink-color")) {
				    	div.innerHTML="<div class='dday' style='background-color: #EB0000'>"+hour+":"+min+":"+sec+"</div>";
			        } else {
			        	div.innerHTML="<div class='dday blink-color' style='background-color: #EB0000'>"+hour+":"+min+":"+sec+"</div>";
			        }
			    }
			}else{
				div.innerHTML="<div class='dday' style='background-color: #aaaaaa;color: #aaaaaa'>종료</div>";
			}
		});
	}
	
	function getRandomColor(many) {
		var arr=[];
		for(var i=0;i<many;i++){
			arr[i]="#"+Math.floor(Math.random()*16777215).toString(16);
		}
		return arr;
	}
	
	function checkNum(input){
		var numPattern = /([^0-9])/;
		var v = input.value;
		numPattern = v.match(numPattern);
		if(numPattern != null){
			Toast.fire({
				icon: "warning",
				title: "숫자만 입력해주세요."
			});
			$("#searchtext").val(null);
			//$("input.bottom").val(null);
			input.value="";
			//input.focus();
			return false;
		}
	}
	
	const Toast = Swal.mixin({
		toast: true,
		position: 'center-center',
		showConfirmButton: false,
		timer: 3000,
		timerProgressBar: true,
		didOpen: (toast) => {
			toast.addEventListener('mouseenter', Swal.stopTimer)
			toast.addEventListener('mouseleave', Swal.resumeTimer)
		}
	});
	
	function showtr(){
		$("tr.tr").hide();
		$("tr.show").show();
		$("tr.show").attr("class","tr");
	}
</script>
<body>
	<div id="search"></div>
	<table class="table table-bordered">
		<caption align="top">
			총 ${titlecount }개의 채용과정이 등록되었습니다
			<a href="/recruit/levelinsertform?c_code=${c_code}" class="button btnPush btnBlueGreen" id="add">추가</a>
		</caption>
		<tr>
			<th width="68" style="text-align:center" class="rno">순서</th>
			<th width="310" style="text-align:center" class="rname">채용과정</th>
			<th width="170" style="text-align:center" class="rdead">마감일</th>
			<th width="152" style="text-align:center">편집</th>
		</tr>
		<c:forEach var="tdto" items="${titlelist }" varStatus="i">
			<tr class="tr">
				<td align="center" class="rno">${titlecount-i.count+1 }</td>
				<td>
					<a href="/recruit/eachlist?c_code=${c_code}&r_title=${tdto.r_title}" class="tit">${tdto.r_title } </a>[<a href="#">${tdto.count }</a>]
					<div class="outline" code="${c_code }" ttl="${tdto.r_title }">개요</div>
				</td>
				<td align="center">
					<c:set var="dd" value="${tdto.dday }"/>
					<div class="d-inline-flex rtime">
						<span class="time" dead="${tdto.deadlineday }"><fmt:formatDate value="${tdto.deadlineday }" pattern="yyyy-MM-dd"/></span>&nbsp;&nbsp;
						<div class="dday" style="background-color: ${dd>=10?'#F06E6E':dd<10&&dd>5?'#EB6464':dd==5?'#EB5A5A':dd==4?'#EB5050':dd==3?'#EB4646':dd==2?'#EB3232':dd==1?'#EB0000':'#aaaaaa'}">D-${dd!=1?dd:'Day'}</div>
					</div>
				</td>
				<td align="center">
					<a href="/recruit/levelinsertform?c_code=${c_code}&r_title=${tdto.r_title}" class="button btnPush btnLightBlue">수정/삭제</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="center">
				<div id="seemore">
					<a href="#" class="button btnSlide btnGray">
				      <span class="top" style="font-size: 1.2em;line-height: 50px">더보기</span>
				      <input type="text" class="bottom form-control" placeholder="개수 입력" name="seemore" onkeyup="checkNum(this);">
				    </a>
				</div>
			</td>
		</tr>
	</table>
	
	<!-- Button to Open the Modal -->
	<button type="button" class="btn btn-primary" id="chart" data-bs-toggle="modal" data-bs-target="#myChart" style="visibility: hidden"></button>
	
	<!-- The Modal -->
	<div class="modal" id="myChart">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<canvas id="bar-chart" width="300" height="230"></canvas>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
				</div>
			
			</div>
		</div>
	</div>
</body>
</html>