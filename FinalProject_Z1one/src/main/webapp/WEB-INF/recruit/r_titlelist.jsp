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
	#bar-chart{
		position: absolute;
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
</style>
</head>
<script>
	$(function(){
		setInterval(() => countdown(),1000);
		
		$(document).on("click","div.outline",function(){
			$("#bar-chart").remove();
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
										max:on_count,
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
	
	function gclear(){
		
	}
</script>
<body>
	<table class="table table-bordered">
		<caption align="top">
			총 ${titlecount }개의 채용과정이 등록되었습니다
			<button class="btn btn-outline-success" id="add">추가</button>
		</caption>
		<tr>
			<th width="68" style="text-align:center">순서</th>
			<th width="310" style="text-align:center">채용과정</th>
			<th width="170" style="text-align:center">마감일</th>
			<th width="152" style="text-align:center">편집</th>
		</tr>
		<c:forEach var="tdto" items="${titlelist }" varStatus="i">
			<tr>
				<td align="center">${titlecount-i.count+1 }</td>
				<td>
					<a href="/recruit/eachlist?c_code=${c_code}&r_title=${tdto.r_title}" class="tit">${tdto.r_title } </a>[<a href="#">${tdto.count }</a>]
					<div class="outline" code="${c_code }" ttl="${tdto.r_title }">개요</div>
				</td>
				<td align="center">
					<c:set var="dd" value="${tdto.dday }"/>
					<div class="d-inline-flex rtime">
						<span class="time" dead="${tdto.deadlineday }"><fmt:formatDate value="${tdto.deadlineday }" pattern="yyyy-MM-dd"/></span>&nbsp;&nbsp;
						<div class="dday" style="background-color: ${dd>=10?'#F06E6E':dd<10&&dd>5?'#EB6464':dd==5?'#EB5A5A':dd==4?'#EB5050':dd==3?'#EB4646':dd==2?'#EB3232':dd==1?'#EB0000':'#aaaaaa'}">
							D-${dd!=1?dd:'Day' }
						</div>
					</div>
				</td>
				<td align="center">
					<button class="btn btn-outline-info btn-sm">수정/삭제</button>
				</td>
			</tr>
		</c:forEach>
		<tr><td colspan="4" align="center"><div id="seemore"><span>더보기</span></div></td></tr>
	</table>
	
	<!-- Button to Open the Modal -->
	<button type="button" class="btn btn-primary" id="chart" data-bs-toggle="modal" data-bs-target="#myChart" style="visibility: hidden"></button>
	
	<!-- The Modal -->
	<div class="modal" id="myChart">
		<div class="modal-dialog">
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
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
		
		</div>
		</div>
	</div>
</body>
</html>