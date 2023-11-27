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
<style type="text/css">
.container{
border: 1px solid yellow;
width: 50%; 
}

.info{
border: 1px solid black;
width: 100%;
height: 30vh; 
}
</style>

<title>Insert title here</title>
</head>
<body>
<div class="container">
   <h5>인적사항</h5>
   <div class="info">
      <input type="text" name="user_name" placeholder="이름" style="width: 150px; height: 50px; margin: 10px 10px">
      <input type="text" name="user_birth" placeholder="생년월일" style="width: 150px; height: 50px; margin:0px 10px">
      <select name="user_gender" placeholder="성별" style="width: 150px; height: 50px; margin: 10px 10px">
         <option value="남자">남자</option>
         <option value="여자">여자</option>
      </select>
      <input type="text" name="user_email" placeholder="이메일" style="width: 200px; height: 50px; margin: 0px 10px">
      
   </div>
</div>
</body>
</html>