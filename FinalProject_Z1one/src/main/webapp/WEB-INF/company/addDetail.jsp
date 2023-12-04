<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 100px 100px;" align="center">
	
		<form action="detailInsert" method="post" enctype="multipart/form-data">
		<input type="hidden" name="cnotice_num" value="${cnotice_num }">
		<input type="hidden" name="company_num" value="${company_num }">
			<table class="table table-bordered" style="width: 1000px;">
				<caption align="top">
					<b style="color: black;">상세정보등록</b>
				</caption>
				
				<!-- 회사번호 -->
				<tr><td><b>회사번호</b> ${company_num }</td></tr>
				<!-- 회사명 -->
				<tr>
					<td style="display: flex; align-items: center;"><b>회사명</b>&nbsp;
						${company_name }
					</td>
				</tr>
				
			
				<!-- 기업소개 -->
				<tr>
					<td  style="align-items: center; display: flex;"><b>기업소개</b>&nbsp;
						<textarea class="form_control" name="cdetail_introduce">
						</textarea>
					</td>	
				</tr>
				
				<!-- 주요업무 -->
				<tr>
					<td  style="align-items: center; display: flex;"><b>주요업무</b>&nbsp;
						<textarea class="form_control" name="cdetail_work">
						</textarea>
					</td>	
				</tr>
				
				<!-- 자격요견 -->
				<tr>
					<td  style="align-items: center; display: flex;"><b>자격요견</b>&nbsp;
						<textarea class="form_control" name="cdetail_qualify">
						</textarea>
					</td>	
				</tr>	
				<!-- 우대사항 -->
				<tr>
					<td  style="align-items: center; display: flex;"><b>우대사항</b>&nbsp;
						<textarea class="form_control" name="cdetail_treat">
						</textarea>
					</td>	
				</tr>	
				<!-- 채용절차 -->
				<tr>
					<td  style="align-items: center; display: flex;"><b>채용절차</b>&nbsp;
					<textarea class="form_control" name="cdetail_procedure">
						</textarea>
					</td>	
				</tr>
				<!-- 복지 -->
				<tr>
					<td  style="align-items: center; display: flex;"><b>복지</b>&nbsp;
						<textarea class="form_control" name="cdetail_welfare">
						</textarea>
					</td>	
				</tr>
				<!-- 기타 -->
				<tr>
					<td  style="align-items: center; display: flex;"><b>기타</b>&nbsp;
						<textarea class="form_control" name="cdetail_etc">
						</textarea>
					</td>	
				</tr>
				<tr>
				<td>
					<button type="submit">등록</button>
				</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>