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
<style type="text/css">
.chatlogo{
max-width: 50px;
}

#comname{
text-decoration: none;
}
</style>
<script>

var roomId;

$(function(){
	
	//모달창 열릴 때 이벤트 처리 => roomId 가져오기
	$("#enterRoomModal").on("show.bs.modal", function (event){
		roomId=$(event.relatedTarget).data('id');
		console.log("roomId "+roomId);
		
	});
	
	
})

function createRoom(){
	
	var name=$("#roomName").val();
	
	if(name==""){
		alert("방 이름을 입력해주세요");
		return false;
		
	}
	if($("#"+name).length>0){
		alert("이미 생성된 방입니다.")
		return false;
	}
	
}

function enterRoom(){
	
	location.href="/chat/room?roomId="+roomId;
	
}

//채팅방 삭제
function delRoom(){
	var name=$("#roomName").val();
	
	var y=confirm($("#roomName")+"방을 삭제하시겠습니까?")
	if(y){
		href="/chat/delRoom"+roomId;
	}
}
</script>
</head>
<body>
<div class="container">
	<div class="container" align="center">
	<button type="button" class="btn btn-link btn-sm" data-bs-toggle="modal" data-bs-target="#myModal"">채팅방 생성</button>
	<c:forEach var="room" items="${list }">
		<span class="hidden" id="${room.roomName }"></span>
		<div style="border: 1px solid gray; border-radius: 10px;" align="center">
        <a href="#enterRoomModal" data-bs-toggle="modal" 
        data-target="#enterRoomModal" data-id="${room.roomId}" id="comname">[${room.roomName}]</a>
        </div>
	</c:forEach>

	
</div>	
</div>


<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">채팅방 생성</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <form method="post" action="/chat/createroom" onsubmit="return createRoom()">
      <div class="modal-body">
     	 <label for="roomName" class="col-form-label">회사명</label>
        <input type="text" class="form-control" id="roomName" name="roomName" required="required">
        <label for="roomlogo" class="col-form-label">회사 로고</label>
        <input type="file" class="form-control" id="roomlogo" name="roomlogo" required="required">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      	<input type="submit" class="btn btn-primary" value="방 생성">
      </div>
		</form>
    </div>
  </div>
</div>
<div class="modal fade" id="enterRoomModal" tabindex="-1" aria-labelledby="enterRoomModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">채팅방에 입장하시겠습니까?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3" align="center">
                    <button type="button" class="btn btn-primary" onclick="enterRoom()">입장하기</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- <!-- 관리자로그인시 채팅방 생성 버튼 확인 가능(추후에 조건 걸기) -->
<div align="right">
<a href="/career/creatroom" style="text-decoration: none;">채팅방 생성</a>
</div>
<div align="center">
총 ${totalCount }개의 방이 생성되어 있어요!
</div>
<div align="center">
		<c:forEach items="${list}" var="chatroom">
			<button class="btn btn-outline-secondary" style="width: 100%;height: 70px;" 
			onclick="location.href='chatroom?num=${chatroom.roomid}'">
			<img src="../chatlogo/${chatroom.roomlogo }" class="chatlogo">
			${chatroom.roomname }
			</button><br>
		</c:forEach>
</div> --%>
</body>
</html>