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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<title>Insert title here</title>
</head>
<style>
	#title{
		position: relative;
	}
	#title-button{
		position: absolute;
		background-color: #50C8FF;
		padding: 2px;
		border-radius: 12px;
		width: 70px;
		height: 38px;
		box-shadow: 0 0 3px 3px gray;
	}
	.course{
		margin: 20px 30px;
	}
	.button-container {
		position: relative;
		padding: 10px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		background-color: #D5C2EE;
		width: 130px;
		height: 92px;
		border-radius: 12px;
	}
	i.bi-three-dots-vertical{
		position: absolute;
		top: 5px;
		left: 104px;
	}
	.buttons{
		position: absolute;
		top: -17px;
		left: 100px;
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 42px;
		height: 110px;
		background-color: #50C8FF;
		padding: 2px;
		border-radius: 12px;
		box-shadow: 0 0 3px 3px gray;
	}
	i.bi,div.levelbox{
		cursor: pointer;
		font-size: 1.45em;
	}
	i.bi:hover{
		font-size: 1.6em;
	}
	i.bi-file-earmark-person:hover{
		color: #A5E3E6;
	}
	i.bi-award-fill:hover{
		color: yellow;
	}
	i.bi-ban:hover{
		color: red;
	}
	.namebox{
		/* display: block; */
		margin-right: 10px;
		margin-left: 5px;
	}
	.record-ready{
		/* outline: 4px solid #B93C3C; */
		box-shadow: 0 0 5px 5px gray;
	}
	.record{
		background-color: #B93C3C;
	}
	.finalpass{
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 10px;
		background-color: #78EFAD;
		width: 130px;
		height: 92px;
		border-radius: 12px;
		cursor: pointer;
	}
	.finalpass:hover{
		box-shadow: 0 0 5px 5px gray;
	}
	.basicdetail th,.contactdetail th{
		width: 110px;
		text-align: center;
	}
	.careerdetail th{
		text-align: center;
	}
	.applyphoto{
		width: 110px;;
		height: 124px;
		margin-bottom: 15px;
		margin-right: 10px;
	}
	.basicdetail{
		width: 645px;
		height: 110px;
	}
</style>
<script>
	$(function(){
		//list();
		$("div.buttons").hide();
		$("#title-button").hide();
		
		var maxstep="${maxstep}";
		var c_pass="${c_pass}";
		
		$(document).on("click","#title",function(e){
			//alert(e.offsetY+","+e.offsetX);
			$("#title-button").css({
				"top":e.offsetY+86,
				"left":e.offsetX-10
			}).show();
		});
		$(document).on("mouseleave","#title-button",function(){
			$(this).hide();
		});
		
		$(document).on("mouseenter","i.bi-three-dots-vertical",function(){
			$(this).next().show();
		});
		$(document).on("mouseleave","div.buttons",function(){
			$(this).hide();
		});
		
		$(document).on("mouseenter","div.button-container",function(){
			$(this).addClass("record-ready");
		});
		$(document).on("mouseleave","div.button-container",function(){
			$(this).removeClass("record-ready");
		});
		
		//지금은 색깔이랑 attr만변경...추후에 실질적 선택자로서 기능하도록 기능추가필요
		$(document).on("click","div.button-container",function(){
			var record=$(this).attr("record");
			
			if(record=='off'){
				$(this).addClass("record");
				$(this).attr("record","on");
			}else{
				$(this).removeClass("record");
				$(this).attr("record","off");
			}
		});
		
		$(document).on("click","div.levelbox",function(){
			var whole_cnt=$(this).siblings("div.button-container").length;
			var on_cnt=$(this).siblings("div.button-container[record=on]").length;
			
			if(on_cnt>whole_cnt/2){
				$(this).siblings("div.button-container").attr("record","off");
				$(this).siblings("div.button-container").removeClass("record");
			}else{
				$(this).siblings("div.button-container").attr("record","on");
				$(this).siblings("div.button-container").addClass("record");
			}
		});
		
		$(document).on("click","div.fin",function(){
			$(this).siblings().trigger("click");
		});
		$(document).on("click","div.finalpass",function(){
			//최종합격..메일전송
		});
		
		//통과
		$(document).on("click","i.pass",function(){
			var idx=$(this).parent().parent().attr("idx");
			
			var name=$(this).parent().siblings("span.namebox").text();
			var lev=$(this).parent().parent().siblings("div.levelbox").text();
			var step=$(this).parent().parent().siblings("div.levelbox").attr("step");
			
			var passAjax=function(){
				$.ajax({
					data:{"a_idx":idx},
					type:"post",
					dataType:"html",
					url:"/recruit/passThisStep",
					success:function(){
						Toast.fire({
							icon: "success",
							title: name+" 님이 "+lev+"(을)를 통과했습니다!"
						});
						//list();
					}
				});
			}
			
			if(step==maxstep){
				deliberate("최종합격",name,c_pass).then(result => {
					if(result==1){
						passAjax();
					}
				});
			}else{
				passAjax();
			}
			list();
		});
		//탈락
		$(document).on("click","i.fail",function(){
			$(this).parent().parent().trigger("click");
			var idx=$(this).parent().parent().attr("idx");
			var name=$(this).parent().siblings("span.namebox").text();
			var lev=$(this).parent().parent().siblings("div.levelbox").text();
			
			deliberate("불합격",name,c_pass).then(result => {
				if(result==1){
					$.ajax({
						data:{"a_idx":idx},
						type:"post",
						dataType:"html",
						url:"/recruit/fail",
						success:function(){
							Toast.fire({
								icon: "warning",
								title: name+" 님이 "+lev+"에서 불합격 처리되었습니다."
							});
							list();
						}
					});
				}
			});
		});
		//상세정보
		$(document).on("click","i.bi-file-earmark-person",function(){
			$(this).parent().parent().trigger("click");
			var name=$(this).parent().siblings("span.namebox").text();
			var user_num=$(this).parent().parent().attr("user");
			
			$("h4.modal-title").text("지원자 상세정보");
			$("td.nametable").text(name);
			$.ajax({
				data:{"user_num":user_num},
				type:"get",
				dataType:"json",
				url:"/recruit/applydetail",
				success:function(res){
					var app=res.applyinfo;
					$("td.mailtable").text(res.email);
					$("td.gendertable").text(app.apply_gender);
					$("td.birthtable").text(app.apply_birth);
					$("td.occuptable").text(app.apply_primary);
					$("td.hptable").text(app.apply_hp);
					$("td.paytable").text(app.apply_salary+"만 원");
					$("td.addrtable").text(app.apply_addr);
					$("div.applyphoto").html("<img src='"+/*경로입력*/+"'"); //경로 입력하시오
					
					$("tr.info").remove();
					var es="<tr class='info'><th>교육기관</th><th>학위</th><th>평점</th><th>기간</th></tr>";
					var cs="<tr class='info'><th>회사</th><th>부서</th><th>직위</th><th>기간</th></tr>";
					$.each(res.educations,function(i,ele){
						es+="<tr class='info'>";
						es+="<td>"+ele.education_name+"</td>";
						es+="<td>"+ele.education_degree+"</td>";
						es+="<td>"+ele.education_score+"</td>";
						es+="<td>"+ele.education_duration+"</td>";
						es+="</tr>";
					});
					$.each(res.careers,function(i,ele){
						cs+="<tr class='info'>";
						cs+="<td>"+ele.career_companyname+"</td>";
						cs+="<td>"+ele.career_team+"</td>";
						cs+="<td>"+ele.career_position+"</td>";
						cs+="<td>"+ele.career_duration+"</td>";
						cs+="</tr>";
					});
					
					if(es=="<tr class='info'><th>교육기관</th><th>학위</th><th>평점</th><th>기간</th></tr>"){
						es="<tr class='info'><td colspan='4'>내용 없음</td></tr>";
					}
					if(cs=="<tr class='info'><th>회사</th><th>부서</th><th>직위</th><th>기간</th></tr>"){
						cs="<tr class='info'><td colspan='4'>내용 없음</td></tr>";
					}
					
					$("#edutable").after(es);
					$("#careertable").after(cs);
					$("th").css("background-color","gray");
					$("td").attr("align","center");
				}
			});
			
			$("button.modalbtn").trigger("click");
		});
		
		$(document).on("drag","div.button-container",function(){
			$(this).attr("class","button-container dragging").css("opacity","0.7");
		});
		$(document).on("dragover","div.button-container",function(e){
			var middleset=$(this).offset().top+46;
			
			if(e.pageY<middleset){
				$(this).attr("style","border-top:solid 3px red");
				$(this).prev().attr("style","border-bottom:solid 3px red");
			}else if(middleset<=e.pageY){
				$(this).attr("style","border-bottom:solid 3px red");
				$(this).next().attr("style","border-top:solid 3px red");
			}
		});
		$(document).on("dragover","div.course",function(e){
			e.preventDefault();
			$(this).attr("style","outline:2px solid red");
		});
		$(document).on("dragleave","div.button-container",function(){
			$(this).attr("style","border:0");
		});
		$(document).on("dragleave","div.course",function(){
			$(this).attr("style","outline:0");
		});
		$(document).on("drop","div.course",function(e){
			e.preventDefault();
			//db조작하는 기능
			var idx=$("div.dragging").attr("idx");
			var r_num=$(this).find("div.levelbox").attr("seq");
			var r_title=$(this).find("div.levelbox").text();
			var a_name=$("div.dragging").find("span.namebox").text();
			
			var dragAjax=function(input){
				$.ajax({
					data:{"r_num":r_num,"a_idx":idx,"isFinal":input},
					type:"post",
					dataType:"html",
					url:"/recruit/dragupdate",
					success:function(){
						list();
					}
				});
			}
			
			if($(this).find("div.fin").length==0){
				dragAjax("0");
			}else{
				deliberate("직권합격",a_name,c_pass).then(result => {
					if(result==1){
						dragAjax("1");
					}else{
						$("div.dragging").css("opacity","1");
						$(this).attr("style","outline:0");
						$("div.button-container").attr("style","border:0");
					}
				});
			}
		});
	});
	
	function list(){
		var c_code="${c_code}";
		var r_title="${r_title}";
		var s="";
		
		$.ajax({
			data:{"c_code":c_code,"r_title":r_title},
			type:"get",
			dataType:"json",
			url:"/recruit/relist",
			success:function(res){
				$.each(res.levellist,function(i,ele){
					s+="<div class='course'>";
					s+="<div class='levelbox' title='전원 선택' step='"+(i+1)+"' seq='"+ele.r_num+"'>"+ele.r_level+"</div><br>";
					
					$.each(res.applylist,function(i,sube){
						if(ele.r_num==sube.r_num&&sube.finalpass!=50){
							s+="<div class='button-container' idx='"+sube.a_idx+"' user='"+sube.user_num+"' record='off' draggable='true'>";
							s+="<span class='namebox'>"+sube.a_name+"</span>";
							s+="<i class='bi bi-three-dots-vertical'></i>";
							s+="<div class='buttons'>";
							s+="<i class='bi bi-file-earmark-person' title='"+sube.a_name+"님 상세정보'></i>";
							s+="<i class='bi bi-award-fill pass' title='"+ele.r_level+" 통과'></i>";
							s+="<i class='bi bi-ban fail' title='"+ele.r_level+" 탈락'></i>";
							s+="</div></div><br>";
						}
					});
					s+="</div>&nbsp;&nbsp;&nbsp;&nbsp;";
				});
				if(res.finallist.length!=0){
					s+="<div class='course'>";
					s+="<div class='levelbox'>최종합격</div><br>";
					
					$.each(res.finallist,function(i,fine){
						s+="<div class='finalpass' idx='"+fine.a_idx+"' title='최종합격 승인'>";
						s+="<span class='namebox'>"+fine.a_name+"</span>";
						s+="</div><br></div>";
					});
				}
				$("#main").html(s);
				$("div.buttons").hide();
				$("#title-button").hide();
			}
		});
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
	
	function deliberate(proc,name,c_pass){
		return new Promise(async (resolve, reject) => {
			const { value: getPass } = await Swal.fire({
	            title: "권한 확인 ("+proc+")",
	            text: name+" 님의 "+proc+"(을)를 승인하시겠습니까?",
	            input: "password",
	            inputPlaceholder: "기업로그인 비밀번호 입력"
	        });
	        if(getPass!=c_pass){
	        	Swal.fire({
        	      icon: "error",
        	      title: "권한 확인 실패",
        	      text: "기업 비밀번호가 일치하지 않습니다.",
        	    });
	        	resolve(0);
	        }else{
	        	Swal.fire({
        	      icon: "success",
        	      title: "권한 확인 성공",
        	      text: name+" 님의 "+proc+"(이)가 승인되었습니다.",
        	    });
	        	resolve(1);
	        }
	    });
	}
</script>
<body>
	<h2 id="title">${title }</h2>
	
	<div class="d-inline-flex" id="main" code="${c_code }">
		<c:forEach var="ldto" items="${levellist }" varStatus="i">
			<div class="course">
				<div class="levelbox" title="전원 선택" step="${i.count }" seq="${ldto.r_num }">${ldto.r_level }</div><br>
				<c:forEach var="adto" items="${applylist }">
					<c:if test="${ldto.r_num==adto.r_num && adto.finalpass!=50 && adto.finalpass!=20}">
						
						<div class="button-container" idx="${adto.a_idx }" user="${adto.user_num }" record="off" draggable="true">
							<span class="namebox">${adto.a_name }</span>
							<i class="bi bi-three-dots-vertical"></i>
							<div class="buttons">
						        <!-- Three small buttons -->
						        <i class="bi bi-file-earmark-person" title="${adto.a_name }님 상세정보"></i>
						        <i class="bi bi-award-fill pass" title="${ldto.r_level } 통과"></i>
						        <i class="bi bi-ban fail" title="${ldto.r_level } 탈락"></i>
					        </div>
					    </div><br>
					</c:if>
				</c:forEach>
				
			</div>&nbsp;&nbsp;&nbsp;&nbsp;
		</c:forEach>
		<c:if test="${finalcount!=0 }">
			<div class="course">
				<div class="levelbox fin">최종합격</div><br>
				<c:forEach var="fdto" items="${finallist }">
					<div class="finalpass" idx="${fdto.a_idx }" user="${fdto.user_num }" title="최종합격 승인">
						<span class="namebox">${fdto.a_name }</span>
					</div><br>
				</c:forEach>
			</div>
		</c:if>
	</div>
	
	<div id="title-button">
		<i class="bi bi-award-fill" title="선택자 전원 현단계 통과" id="allpass" style="margin-left: 5px"></i>
		<i class="bi bi-ban" title="선택자 전원 탈락" id="allfail" style="margin-right: 5px"></i>
	</div>
	
	<!-- Button to Open the Modal -->
	<button type="button" class="btn btn-primary modalbtn" data-bs-toggle="modal" data-bs-target="#myModal" style="visibility: hidden"></button>
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><!-- 제목 --></h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="d-inline-flex wow">
						<div class="applyphoto"></div>
						<table class="table table-bordered basicdetail">
							<tr><th>성명</th><td class="nametable"></td><th>성별</th><td class="gendertable"></td></tr>
							<tr><th>생년월일</th><td class="birthtable"></td><th>희망직종</th><td class="occuptable"></td></tr>
							<tr><th>연락처</th><td class="hptable"></td><th>희망연봉</th><td class="paytable"></td></tr>
						</table>
					</div>
					<table class="table table-bordered contactdetail">
						<tr><th>주소</th><td class="addrtable"></td></tr>
						<tr><th>이메일</th><td class="mailtable"></td>
					</table>
					<table class="table table-bordered careerdetail">
						<tr id="edutable"><th colspan="4">학력사항</th></tr>
						<!-- 반복문 삽입 -->
						<tr id="careertable"><th colspan="4">경력사항</th></tr>
						<!-- 여기도 -->
					</table>
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