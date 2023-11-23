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
	#seemore{
		position: relative;
		border: 1px solid #aaaaaa;
		border-radius: 30px;
		width: 200px;
		height: 40px;
		cursor: pointer;
	}
	#seemore>span{
		position: absolute;
		top: 4.5px;;
		left: 69px;
		color: gray;
		font-size: 1.25em;
	}
	#seemore:hover{
		background: #a0a0a0;
		color: white;
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
					//$("#bar-chart").show();
					$("#chart").trigger("click");
				}
			});
		});
		
		$(document).on("click","th.rno",function(){
			$("div.modal-dialog").attr("class","modal-dialog");
			$("h4.modal-title").text("순번으로 검색");
			$("div.modal-body").empty();
			$("div.modal-body").html("<input type='text' name='rno' id='searchtext' placeholder='순번 검색' class='form-control' onkeyup='checkNum(this);'>");
			$("#chart").trigger("click");
		});
		$(document).on("click","th.rname",function(){
			$("div.modal-dialog").attr("class","modal-dialog");
			$("h4.modal-title").text("채용과정명으로 검색");
			$("div.modal-body").empty();
			$("div.modal-body").html("<input type='text' name='rname' id='searchtext' placeholder='채용과정명 검색' class='form-control'>");
			$("#chart").trigger("click");
		});
		$(document).on("click","th.rdead",function(){
			$("div.modal-dialog").attr("class","modal-dialog");
			$("h4.modal-title").text("마감일로 검색");
			$("div.modal-body").empty();
			$("div.modal-body").html(
					"마감일<input type='date' name='rdead' id='searchsel' class='form-control'><br>D&nbsp;-&nbsp;Day<input type='text' name='rdday' id='searchtext' placeholder='0 입력시 종료 검색' class='form-control' onkeyup='checkNum(this);'>"
			);
			$("#chart").trigger("click");
		});
		
		$(document).on("keyup","#searchtext",function(){
			var col=$(this).attr("name");
			var input=$(this).val();
			var eleall;
			
			if(col=="rno"){
				eleall=document.querySelectorAll("td.rno");
			}else if(col=="rname"){
				eleall=document.querySelectorAll("a.tit");
			}else if(col=="rdday"){
				eleall=document.querySelectorAll("div.dday");
			}
			
			eleall.forEach(ele => {
				if(ele.textContent.includes(input)){
					alert(ele.textContent)
				}
			});
		});
		$(document).on("change","#searchsel",function(){
			var col=$(this).attr("name");
			var input=$(this).val();
			var eleall=document.querySelectorAll("span.time");
			
			eleall.forEach(ele => {
				alert(ele.textContent)
			});
		});
		$(document).on("change","#searchsel",function(){
			$("#searchtext").val("");
		});
		$(document).on("keyup","#searchtext",function(){
			$("#searchsel").val("");
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
			objEv.value="";
			objEv.focus();
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
</script>
<body>
	<table class="table table-bordered">
		<caption align="top">
			총 ${titlecount }개의 채용과정이 등록되었습니다
			<a href="/recruit/levelinsertform?c_code=${c_code}" title="Button push blue/green" class="button btnPush btnBlueGreen" id="add">추가</a>
		</caption>
		<tr>
			<th width="68" style="text-align:center" class="rno">순서</th>
			<th width="310" style="text-align:center" class="rname">채용과정</th>
			<th width="170" style="text-align:center" class="rdead">마감일</th>
			<th width="152" style="text-align:center">편집</th>
		</tr>
		<c:forEach var="tdto" items="${titlelist }" varStatus="i">
			<tr>
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
					<a href="/recruit/levelinsertform?c_code=${c_code}&r_title=${tdto.r_title}" title="Button push lightblue" class="button btnPush btnLightBlue">수정/삭제</a>
				</td>
			</tr>
		</c:forEach>
		<tr><td colspan="4" align="center"><div id="seemore"><span>더보기</span></div></td></tr>
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