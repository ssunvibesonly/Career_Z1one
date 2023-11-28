<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<<<<<<< HEAD
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>



=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
>>>>>>> jooyoung
<!DOCTYPE html>
<html>
<head>
    <title>검색 결과</title>
</head>
<style>
    a {
        text-decoration: none;
        color: #191919;
    }
    .mid1 {
        width: 80%;
        height: 1800px;
        margin-left: 12.5%;
    }

    .searchbox {
        width: 36%;
        height: 70px;
        border: 1px solid lightgray;
        border-radius: 20px;
        padding-bottom: 1%;
        padding-top: 1%;
        margin-left: 33%;
        margin-top: 2%;
    }

    .story {
        display: flex;
        flex-wrap: wrap; /* 자식 요소들을 한 줄에 정렬하되, 넘칠 경우 다음 줄로 넘어가게 설정 */
    }

    .story-1 {
        width: 50%; /* 한 줄에 두 개의 요소만 나타나도록 설정 */
        height: 250px;
    }
    .box {
        width: 70px;
        height: 70px;
        background: lightgray;
        margin: 4px;
        border-radius: 10px;
    }
    .fixed {
        position: fixed;
    }
    .bottom-right {
        bottom: 10px;
        right: 10px;
    }
    form {
        position: relative;
        width: 50%;
        margin: 0 auto;
    }
    .cmlistsearch input {
        width: 90%;
        height: 52px;
        padding-left: 10px;
        border: 2px solid #8f7cc4;
        border-radius: 5px;
        outline: none;
        background: white;
        color: #9E9C9C;
        margin-left: -1%;
    }
    .cmlistsearch button {
        position: absolute;
        top: 0;
        right: 65px;
        width: 42px;
        height: 52px;
        border: none;
        background: #8f7cc4;
        border-radius: 0 5px 5px 0;
        cursor: pointer;
    }
    .cmlistsearch button:before {
        content: "\f002";
        font-family: FontAwesome;
        font-size: 16px;
        color: white;
    }
    .row{
        text-align: center;
        margin-left: 6%;
        margin-right: 6%;
        /* border: 1px solid green; */
    }
    .text-secondary{
        font-size: 13px;
        font-weight: bold;
        text-decoration: none;
        position: relative;
        margin-bottom: 2px;
        /* border: 1px solid red; */
    }
    .text-secondary::before{
        content: "";
        height: 3px;
        width: 0;
        background-color: black;
        border-radius: 10px;
        transition: 0.3s;
        position: absolute;
        bottom: -10px;
        left: 0;
    }
    .text-secondary:hover::before{
        width: 125%;
        left:-12.5%;
        bottom:-10px;
        background-color: black;
    }
    select {
        border:none;
        cursor: pointer;
    }
</style>
<script>
    $(function(){
        //select의 option을 선택했을때 정렬
        $('#orderby').change(function() {
            // 선택된 옵션의 클래스를 가져옴
            var selectedClass = $('option:selected', this).attr('class');
            //alert(selectedClass);
            var orderby;

            //값을 대입할때는 = 값이 같을때는 ==
            if(selectedClass=='recent') {
                orderby='recent';
                list(orderby);
            }
            if (selectedClass=='likes') {
                orderby='likes';
                list(orderby);
            }
            if (selectedClass=='readcnt') {
                orderby = 'readcnt';
                list(orderby);
            }

            });
        })

    function list(orderby) {
        //alert(orderby);
        $.ajax({
            type: "get",
            dataType: "json",
            url: "/board/sort",
            traditional: true, // 중간에 &를 ,로 변경하는 옵션
            data: {"orderby":orderby },
            success: function (res) {
                var noticeContainer = $(".story");
                var html = "";

                $.each(res, function (index, dto) {
                    html += "<div class='story-1' style='border: 1px solid lightslategray; border-left: none; border-right: none;'>";

                    // Top
                    html += "<div class='story-top' style='height: 70px;'>";
                    html += "&nbsp;<span style='color: dimgray; font-size: 14px;'><b>" + dto.board_category + "</b></span><br>";
                    html += "<b><h5 style='margin-top: 0.7%'><a href='#'>" + dto.board_title + "</a></h5></b>";
                    html += "</div>";

                    // Middle
                    html += "<div class='story-bottom' style='height: 100px;'>";
                    html += "<a href='#'>" + dto.board_story + "</a>";
                    html += "<img src='../" + dto.board_photo + "' style='width:40px; height:40px; margin-left: 75%'>";
                    html += "</div>";

                    // Bottom
                    html += "<div class='story-footer' style='height: 70px;'>";
                    html += "<b>";
                    html += "<a href='#' style='margin-left: 28%'></a>";
                    html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><br>";
                    html += "<i class='bi bi-eye' style='color: gray; font-size: 16px;'></i>&nbsp;<a href='#' style='color: gray; font-size:16px;'>" + dto.board_readcnt + "</a>&nbsp;&nbsp;";
                    html += "<i class='bi bi-chat-heart' style='color: gray; font-size: 16px;'></i>&nbsp;<a href='#' style='color: gray; font-size: 16px;'>" + dto.board_like + "</a>&nbsp;&nbsp;";
                    html += "<i class='bi bi-heartbreak' style='color: gray; font-size: 16px;'></i>&nbsp;<a href='#' style='color: gray; font-size: 16px;'>" + dto.board_dislike + "</a>";
                    html += "<div style='margin-left: 80%'>";
                    html += "<i class='bi bi-calendar' style='color: gray; font-size: 16px;'></i>&nbsp;" + new Intl.DateTimeFormat('en-US').format(new Date(dto.board_writeday));
                    html += "</div>";
                    html += "</div>";

                    html += "</div>";
                });
                noticeContainer.html(html); // 생성된 HTML로 교체
            }
        });
    }

</script>
<body>
<div class="bottom-right fixed box">
    <div style="margin-left: 8.5%; margin-top:4%; cursor:pointer;">
        <img src="../community/chatgpt.png" style="width:90%; height:61px;" onclick="location.href='https://chat.openai.com/'">
    </div>
</div>

<div class="mid1"> <%--가운데 전체 감싸는 div--%>

		<form action="search">
			<div class="cmlistsearch">
				<input type="text" class="form-control click" name="searchword"
					placeholder="관심 내용을 검색해보세요!">&nbsp;&nbsp;&nbsp;
				<button type="submit"></button>
			</div>
		</form>

    <h3><b style="color:red;">${searchword}</b> 검색 결과</h3><br>
    <div class="d-inline-flex sort" style="width:100%">
        <div class="sort-1">
             <select size="1" class="category">
                <option>전체 (${resultCount})</option>
                <option>면접 ()</option>
                <option>portfolio ()</option>
                <option>자소서 ()</option>
                <option>인적성 ()</option>
                <option>이직STORY ()</option>
                <option>신입꿀팁 ()</option>
                <option>회사생활 ()</option>
                <option>퇴사꿀팁 ()</option>
                <option>Z1맘대로 (})</option>
                <option>Z1마켓 ()</option>
             </select>
        </div>
        <div class="sort-2" style="margin-left: 85%">
            <select id="orderby" size="1" class="sorted">
                <option selected="selected">선택하세요</option>
                <option class="recent">최신순</option>
                <option class="likes">좋아요순</option>
                <option class="readcnt">조회수순</option>
            </select>
        </div>
    </div>

    <hr style="border: 2px solid black; margin-top: 15px;">

    <%--검색어 없이 돋보기 클릭했을 떄--%>
    <c:if test="${searchword==null}">
        ${getAllResults}
    </c:if>

    <%--검색 결과가 제목이랑 연관 있는게 하나도 없을 때--%>
    <c:if test="${empty searchResults}">
        <div style="margin-top:2.5%;">
            <h2>검색된 결과가 없습니다.</h2>
        </div>
    </c:if>

    <%--검색 결과 띄우기.--%>
    <c:if test="${searchword!=null}">
        <div class="story" style="width:100%;">
        <c:forEach items="${searchResults}" var="dto">
            <div class="story-1" style="border: 1px solid lightslategray;  border-left: none; border-right: none;">
                <%--상단--%>
                <div class="story-top" style="height: 70px;">
                    &nbsp;<span style="color:dimgray; font-size:14px;"><b>${dto.board_category}</b></span><br>
                    <b><h5 style="margin-top: 0.7%"><a href="#">${dto.board_title}</a></h5></b>
                </div>
                     <%--중간--%>
                    <div class="story-bottom" style="height: 100px;">
                        <a href="#">${dto.board_story}</a>
                       <img src="../${dto.board_photo}" style="widht:40px; height:40px; margin-left: 75%">
                    </div>
                        <%--하단--%>
                        <div class="story-footer" style="height: 70px;">
                            <b>
                                <c:set var="email" value="${sessionScope.myid}" />
                              <%--  <c:set var="maskedEmail" value="${fn:substring(email, 0, 5)}${fn:replace(fn:substring(email, 5), '.', '*')}" />
                                <a href="#">${maskedEmail}</a>--%>
                                <a href="#" style="margin-left: 28%"></a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <b>{본인회사}
                            <a href="#">{세션아이디적기}</a><a href="#" style="margin-left: 28%"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <fmt:formatDate value=" ${dto.board_writeday}" pattern="yyyy-MM-dd"/>
                            </b>
                            <br>
                            <i class="bi bi-eye" style="color:gray; font-size: 16px;"></i>&nbsp;<a href="#" style="color:gray; font-size:16px;">${dto.board_readcnt}</a>&nbsp;&nbsp;
                            <i class="bi bi-chat-heart" style="color:gray; font-size: 16px;"></i>&nbsp;<a href="#" style="color:gray; font-size: 16px;">${dto.board_like}</a>&nbsp;&nbsp;
                            <i class="bi bi-heartbreak" style="color:gray; font-size: 16px;"></i>&nbsp;<a href="#" style="color:gray; font-size: 16px;">${dto.board_dislike}</a>
                            <div style="margin-left: 77%">
                            <i class="bi bi-calendar" style="color:gray; font-size: 16px;"></i>&nbsp;<fmt:formatDate value="${dto.board_writeday}" pattern="yyyy-MM-dd"/>
                            </div>
                        </div>

            </div>
        </c:forEach>
        </div>
    </c:if>

</div> <%--mid1 닫는 div--%>

</body>
</html>