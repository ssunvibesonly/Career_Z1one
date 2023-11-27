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
<link rel="stylesheet" href="/chatroom.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
 <style>
        #menu{
            width: 310px;
        }
        button#uploadFile {
            margin-left: 225px;
            margin-top: -55px;
        }
        input {
            padding-left: 5px;
            outline: none;
            width: 250px;
            margin-top: 15px;
        }
        .btn fa fa-download {
            background-color: DodgerBlue;
            border: none;
            color: white;
            padding: 12px 30px;
            cursor: pointer;
            font-size: 20px;
        }

        .input-group{width:80.5%}
        .chat-container{position: relative;}
        .chat-container .btn-group{position:absolute; bottom:-12px; right:-50px; transform: translate(-50%,-50%);}
    </style>

<body>
<br><br>

<div id="username-page">
    <div class="username-page-container">
        <h6 class="title">채팅에서 사용할 닉네임을 정해주세요!</h6>
        <form id="usernameForm" name="usernameForm">
        	<!-- 여기가 안됨 -->
                <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control"/>
            <div class="form-group">
                <button type="submit" class="accent username-submit">Start Chatting</button>
            </div>
        </form>
    </div>
</div>


<div id="chat-page" class="hidden">
    <div class="btn-group dropend">
        <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown">
            참가한 유저
        </button>
       
		<ul class="dropdown-menu" id="list" style="height: 100px;">
		
		</ul>
    
    </div>
    <div class="chat-container">
        <div class="chat-header">
            <h2>[[${room.roomName}]]</h2>
        </div>
        <div class="connecting">
            Connecting...
        </div>
        <ul id="messageArea" style="overflowY: scroll;maxHeight: 100px;">

        </ul>
        <form id="messageForm" name="messageForm" nameForm="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="Type a message..." autocomplete="off"
                           class="form-control"/>
                    <button type="submit" class="primary">Send</button>
                </div>
            </div>
        </form>

    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/socket.js" type="text/javascript"></script>
</body>
</html>