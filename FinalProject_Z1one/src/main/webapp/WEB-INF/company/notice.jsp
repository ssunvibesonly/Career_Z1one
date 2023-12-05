<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
body {
	font-size: 2vh;
}

#industryModal {
	position: absolute;
	margin: 15vw -36.5vw;
}

#careerModal {
	position: absolute;
	margin: 15vw -27.9vw;
}

#locationModal {
	position: absolute;
	margin: 15vw -19.3vw;
}

#typeModal {
	position: absolute;
	margin: 15vw 1.9vw;
}

#academyModal {
	position: absolute;
	margin: 15vw 14.4vw;
}

/* body {
	margin: 0;
	padding: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #e5e5e5;
} */
.middleBox {
	position: relative;
	/* 	width: 70%; */
	/* max-width: 250px; */
	position: absolute;
	width: 300px;
	height: 200px;
	background-color: #fff;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
	top: 13.3vw; /* 추가된 부분: 상위 요소의 하단을 기준으로 위치 조정 */
	left: 35.5vw; /* 추가된 부분: 상위 요소의 왼쪽을 기준으로 위치 조정 */
	z-index: 3;
	background-color: #fff; /* 추가된 부분: 다른 요소들보다 위에 위치하도록 함 */
	margin-top: 50px;
	border: 1px solid gray;
}

.middle {
	position: relative;
	width: 250px;
	margin-top: 20px;
	margin-left: 25px;
}

.slider {
	position: relative;
	z-index: 1;
	height: 10px;
	margin: 0 15px;
}

.slider>.track {
	position: absolute;
	z-index: 1;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	border-radius: 5px;
	background-color: #c6aee7;
}

.slider>.range {
	position: absolute;
	z-index: 2;
	left: 25%;
	right: 25%;
	top: 0;
	bottom: 0;
	border-radius: 5px;
	background-color: green;
}

.slider>.thumb {
	position: absolute;
	z-index: 3;
	width: 30px;
	height: 30px;
	background-color: green;
	border-radius: 50%;
	box-shadow: 0 0 0 0 rgba(98, 0, 238, .1);
	transition: box-shadow .3s ease-in-out;
	border: 3px solid white;
	cursor: pointer;
}

.slider>.thumb.left {
	left: 25%;
	transform: translate(-15px, -10px);
}

.slider>.thumb.right {
	right: 25%;
	transform: translate(15px, -10px);
}

.slider>.thumb.hover {
	box-shadow: 0 0 0 20px rgba(98, 0, 238, .1);
}

.slider>.thumb.active {
	box-shadow: 0 0 0 40px rgba(98, 0, 238, .2);
}

input[type=range] {
	position: absolute;
	pointer-events: none;
	-webkit-appearance: none;
	z-index: 2;
	height: 10px;
	width: 100%;
	opacity: 0;
}

input[type=range]::-webkit-slider-thumb {
	pointer-events: all;
	width: 30px;
	height: 30px;
	border-radius: 0;
	border: 0 none;
	background-color: red;
	-webkit-appearance: none;
}
</style>
<script type="text/javascript">

//전역변수(list에 data로 넘기기위함)
industryTokens=[]; //산업군
careerTokens =[]; //경력
locationTokens=[]; //지역
typeTokens=[]; //고용형태
academyTokens=[]; //학력


//head
$(function() {
	$(".middleBox").hide();
   //디폴트리스트호출
   testList();
   
 //select의 option을 선택했을때 정렬 
   $('#orderBy').change(function() {
       // 선택된 옵션의 클래스를 가져옴
       var selectedClass = $('option:selected', this).attr('class');
       //alert(selectedClass); // 변수명 수정

       var orderBy; // 지역변수
       
       // 최신순
       if (selectedClass == 'writeday') {
           orderBy = 'writeday'; // 값 대입할 때는 =, 값이 같을 때는 ==
           testList(minScore,maxScore,orderBy);
       } else if (selectedClass == 'deadline') { // 마감임박순
           orderBy = 'deadline';
           testList(minScore,maxScore,orderBy);
       } else if (selectedClass == 'readcount') { // 조회수순
           orderBy = 'readcount';
           testList(minScore,maxScore,orderBy);
       } else if (selectedClass == 'recommend') { // 추천순
           orderBy = 'recommend';
           testList(minScore,maxScore,orderBy);
       } else if (selectedClass == 'congratulate') { // 축하금순
           orderBy = 'congratulate';
           testList(minScore,maxScore,orderBy);
       }
   });

      
    //직종모달열림
    $(".industry").click(function() {
    	industryTokens = []; //모달창 열릴때 배열 초기화
      $("#industryModal").modal("show");    
     });    
    
    //경력모달열림
    $(".career").click(function() {
 	   careerTokens =[]; //모달창 열릴때 배열 초기화
       $("#careerModal").modal("show"); 
      });
    
   //지역모달열림
   $(".location").click(function () {
	   locationTokens = []; //모달창 열릴때 배열 초기화
      $("#locationModal").modal("show");    
	   
   });
   
   //평점모달열림
   $(".grade").click(function () {
	   gradeTokens = []; //모달창 열릴때 배열 초기화
      $("#gradeModal").modal("show");    
   });
   
   //고용형태모달열림
   $(".type").click(function () {
	   typeTokens = []; //모달창 열릴때 배열 초기화
      $("#typeModal").modal("show");    
   });
   
   //학력모달열림
   $(".academy").click(function() {
	   academyTokens =[]; //모달창 열릴때 배열 초기화
      $("#academyModal").modal("show");
   });
   
//////////////////////////////////////////////////////////////////////////////

//직종 이벤트
var clickedToken; // 이전에 클릭한 토큰을 저장할 변수

//마우스 hover 시 CSS 변경
$('.industryDiv1').hover(
    function () {
        // 마우스를 갖다대면 배경색을 회색으로 변경
        $(this).css('background-color', '#dcdcdc');
    },
    function () {
        // 마우스를 떼면 원래대로 되돌림
        if ($(this).data('token') !== clickedToken || $('.industryDiv2:hover').length === 0) {
            // 현재 토큰이 이전에 클릭한 토큰과 다를 때 또는 마우스가 industryDiv2에 올려져 있지 않을 때만 원래대로 돌림
            $(this).css('background-color', '');
        }
    }
);

// 마우스 click 시 CSS 변경 및 클릭한 내용 생성
$('.industryDiv1').on('click', function () {
    // 클릭된 요소의 데이터 토큰 값 가져오기
    var currentToken = $(this).data('token');

    // 클릭한 토큰이 이전에 클릭한 토큰과 같다면 클릭 상태를 해제하고 CSS를 원래대로 돌림
    if (clickedToken === currentToken) {
        $(this).removeClass('clicked');
        $(this).css('background-color', '');
        clickedToken = null; // 클릭 상태 해제
        $(".industryDiv2").html(""); // 클릭 해제 시 .industrydiv2의 내용 비우기
    } else if (clickedToken) {
            $('.industryDiv1[data-token="' + clickedToken + '"]').removeClass('clicked');
            $('.industryDiv1[data-token="' + clickedToken + '"]').css('background-color', '');
        }

        // 현재 클릭한 토큰에 대한 CSS를 변경하고 클릭 상태를 유지
        $(this).addClass('clicked');
        $(this).css('background-color', '#dcdcdc');
        clickedToken = currentToken;

        // 클릭한 내용 생성
        var s = "";
        if (currentToken === '전체') {
        	s += "<hr><div style='margin-bottom: 15%;'><i class='bi bi-emoji-frown' style='font-size: 4em; color: red; margin-left: 38%;'></i><br>";
            s += "<b style='margin-left: 5%;'>나에게 맞는 직종을 선택해주세요.</b></div>";
        } else if (clickedToken === 'IT/웹/통신') {
 
            s += "<hr><div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>게임&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>보안/백신&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>쇼핑몰/오픈마켓&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>네트워크/통신/모바일&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>솔루션/SI/ERP/CRM&nbsp;</div>&nbsp;";
        } else if(clickedToken === '서비스업') {
        	s += "<hr><div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>호텔/여행/항공&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>뷰티/미용&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>레저/스포츠/여가&nbsp;</div>&nbsp;";
        } else if(clickedToken === '제조/화학') {
        	s += "<hr><div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>전기/전자/제어&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>석유/화학/에너지&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>식품가공/개발&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>화장품/뷰티&nbsp;</div>&nbsp;";
        } else if(clickedToken === '교육') {
        	s += "<hr><div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>초중고/대학&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>유아/유치원&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointe;r width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>학원/어학원&nbsp;</div>&nbsp;";
        } else if(clickedToken === '미디어/디자인') {
        	s += "<hr><div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>실내/인테리어/조경&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>환경설비&nbsp;</div>&nbsp;";
            s += "<div style='cursor:pointer; width:14vw; font-weight:bold; margin-left: 25%;' class='industry2'>부동산/임대&nbsp;</div>&nbsp;";
        }
        $(".industryDiv2").html(s);
    });

//2차산업군에서 클릭한 div
$('.industryDiv2').on('click', '.industry2', function () {
    var clickedDiv = $(this);

    // 클릭한 div에 'clicked' 클래스가 있는지 확인
    var isClicked = clickedDiv.hasClass('clicked');

    // 클릭한 div에 'clicked' 클래스가 있으면 제거하고, 없으면 추가
    if (isClicked) {
        clickedDiv.removeClass('clicked');
        clickedDiv.find('.bi-check-square-fill').remove(); // bi-check 아이콘 제거
    } else {
        clickedDiv.addClass('clicked');
        clickedDiv.append('<i class="bi bi-check-square-fill" style="color: #228b22;"></i>');//bi-check 아이콘 추가
    }
});  
   //////////////////////////////////////////////////////////////////////////////////////////////
   
  // 직종-적용하기버튼이벤트
$(".industryApply").click(function () {
	
    // 클릭된 버튼 변수에 할당
    var clickedIndustryButtons = $(".industry2.clicked");

    // 각 클릭된 버튼에 대한 정보 확인
    clickedIndustryButtons.each(function () {
        // 내가 클릭한 버튼의 text
        var industryToken = $(this).text().trim();
        // 토큰을 토큰즈에 누적
        industryTokens.push(industryToken);
    });

    // industryTokens가 비어 있는지 확인
    if (industryTokens.length > 0) {
        // 리스트 호출
        testList();
        // 누적 방지
        $(".industry").empty();
        // text를 tokens로 변경
        $(".industry").html("<b style='color: black; font-size: 0.8em'>" + industryTokens + "<i class='bi bi-caret-down-fill'></i></b>");
    } else {
        // industryTokens가 비어 있다면 alert 띄우기
        
    	testList();
    	$(".industry").html("<b style='color: black; font-size: 0.8em'>직종&nbsp;<i class='bi bi-caret-down-fill'></i></b>");
    }
});


   //모달창 내 초기화 버튼
   $(".industryReset").click(function () {
       // 모든 버튼 초기화
       $(".industry2").removeClass("clicked").find('.bi-check-square-fill').remove();

   });

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 지역버튼클릭이벤트
$(".locationDiv").click(function () {
	
	
    var clickedDiv = $(this);

    // 클릭한 div에 'clicked' 클래스가 있는지 확인
    var isClicked = clickedDiv.hasClass('clicked');

    // "전체" div를 클릭했을 경우
    if (clickedDiv.text().trim() === "전체") {
        // 다른 모든 div에 대해 클릭 상태 제거 및 i 태그 삭제
        $(".locationDiv").not(clickedDiv).removeClass("clicked").find('.bi-check-square-fill').remove();
    } else {
        // 다른 "전체" div에 대해 클릭 상태 제거 및 i 태그 삭제
        $(".locationDiv:contains('전체')").removeClass("clicked").find('.bi-check-square-fill').remove();
    }

    // 클릭한 div에 'clicked' 클래스가 있으면 제거하고, 없으면 추가
    if (isClicked) {
        clickedDiv.removeClass('clicked');
        clickedDiv.find('.bi-check-square-fill').remove(); // bi-check 아이콘 제거
    } else {
        clickedDiv.addClass('clicked');
        clickedDiv.append('<i class="bi bi-check-square-fill" style="color: #228b22;"></i>'); // bi-check 아이콘 추가
    }
});

//지역 적용하기버튼이벤트
$(".locationApply").click(function () {
    // 클릭된 버튼 변수에 할당
    var clickedLocationButtons = $(".locationDiv.clicked");

    // 각 클릭된 버튼에 대한 정보 확인
    clickedLocationButtons.each(function () {
        // 내가 클릭한 버튼의 text
        var locationToken = $(this).text().trim();
        // 토큰을 토큰즈에 누적
        locationTokens.push(locationToken);
    });

    // "전체" div가 클릭 상태인 경우 testList() 호출
    if ($(".locationDiv:contains('전체').clicked").length > 0) {
    	locationTokens=[];
        testList();
    } else {
    	
    	testList();
        $(".location").html("<b style='color: black; font-size: 0.8em'>" + locationTokens + "<i class='bi bi-caret-down-fill'></i></b>");  
    }

});


//모달창 내 초기화 버튼
$(".locationReset").click(function () {
    // 모든 버튼 초기화
    $(".locationDiv").removeClass("clicked").find('.bi-check-square-fill').remove();
});

/////////////////////////////////////////////////////////////////////////////

// 경력버튼클릭이벤트
$(".careerDiv").click(function () {
    var clickedDiv = $(this);

    // "전체" 텍스트를 가진 div를 클릭하면 "전체" div를 제외한 모든 div에서 클릭 상태를 해제하고 i 태그를 제거
    if (clickedDiv.text().trim() === "전체") {
        $(".careerDiv:not(:contains('전체'))").removeClass("clicked").find('.bi-check-square-fill').remove();
    } else {
        // 클릭한 div에 'clicked' 클래스가 있는지 확인
        var isClicked = clickedDiv.hasClass('clicked');

        // 클릭한 div에 'clicked' 클래스가 있으면 제거하고, 없으면 추가
        if (!isClicked) {
            clickedDiv.addClass('clicked');
            clickedDiv.append('<i class="bi bi-check-square-fill" style="color: #228b22;"></i>'); // bi-check 아이콘 추가
        } else {
            clickedDiv.removeClass('clicked');
            clickedDiv.find('.bi-check-square-fill').remove(); // bi-check 아이콘 제거
        }
    }
});

// 경력 적용하기버튼이벤트
$(".careerApply").click(function () {
    // 클릭된 버튼 변수에 할당
    var clickedCareerButtons = $(".careerDiv.clicked");

    // 각 클릭된 버튼에 대한 정보 확인
    clickedCareerButtons.each(function () {
        // 내가 클릭한 버튼의 text
        var careerToken = $(this).text().trim();
        // 토큰을 토큰즈에 누적
        careerTokens.push(careerToken);
    });

    if (careerTokens.length>0) {
        testList();
        $(".career").html("<b style='color: black; font-size: 0.8em'>" + careerTokens + "<i class='bi bi-caret-down-fill'></i></b>");
    } else {
    	testList();
    	$(".career").html("<b style='color: black; font-size: 0.8em'>경력&nbsp;<i class='bi bi-caret-down-fill'></i></b>");
    }
});

// 모달창 내 초기화 버튼
$(".careerReset").click(function () {
    // 모든 버튼 초기화
    $(".careerDiv").removeClass("clicked").find('.bi-check-square-fill').remove();
    
});

//////////////////////////////////////////////////////////////////////////////////////////////

//평점창
$(".grade").click(function() {
	
	$(".middleBox").show();
});

$(".close").click(function() {
	
	$(".middleBox").hide();
});

var inputLeft = document.getElementById("input-left");
var inputRight = document.getElementById("input-right");

var thumbLeft = document.querySelector(".slider > .thumb.left");
var thumbRight = document.querySelector(".slider > .thumb.right");
var range = document.querySelector(".slider > .range");
var minScore=0;
var maxScore=10;

function setLeftValue() {
	var _this = inputLeft,
		min = parseInt(_this.min),
		max = parseInt(_this.max);

	_this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1);  //첫번째원과 두번째원의 범위차이 ex 1. 11  2. 12

	var percent = ((_this.value - min) / (max - min)) * 100;

	thumbLeft.style.left = percent + "%";
	range.style.left = percent + "%";
	minScore = $("#input-left").val();
	valuePrint();
}
setLeftValue();

function setRightValue() {
	var _this = inputRight,
		min = parseInt(_this.min),
		max = parseInt(_this.max);

	_this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1);

	var percent = ((_this.value - min) / (max - min)) * 100;

	thumbRight.style.right = (100 - percent) + "%";
	range.style.right = (100 - percent) + "%";
	maxScore = $("#input-right").val();
	valuePrint();
}

function valuePrint(){
	if(minScore!=0||maxScore!=10){
		$("#range-value").show();
		$("#range-value").html((minScore/2)+"~"+(maxScore/2));
		$("#score-range").hide();
	}
	if(minScore==0&&maxScore==10){
		$("#range-value").hide();
		$("#score-range").show();
	}
}
setRightValue();

inputLeft.addEventListener("input", setLeftValue);
inputRight.addEventListener("input", setRightValue);

//적용하기버튼
// 적용하기 버튼 클릭 이벤트 핸들러
$(".gradeApply").click(function() {
    var minScore = $("#input-left").val() / 2;
    var maxScore = $("#input-right").val() / 2;

    // 숫자 값이 0일 때의 조건 처리
    if (minScore === 0 && maxScore === 0) {
        minScore = 0;
        maxScore = 10;
    }

    $(".middleBox").hide();
    testList(minScore,maxScore,orderBy);
    $(".grade").html("<b style='color: black; font-size: 0.8em'>" + minScore + "~" + maxScore + "<i class='bi bi-caret-down-fill'></i></b>");
});

//초기화버튼
$(".gradeReset").click(function() {
	$("#input-left").val(0);
	$("#input-right").val(10);
	setLeftValue();
	setRightValue();
});


///////////////////////////////////////////////////////////////////////
//고용형태모달
//유형 버튼 클릭 이벤트
$(".typeDiv").click(function () {
    var clickedDiv = $(this);

    // 클릭한 div에 'clicked' 클래스가 있는지 확인
    var isClicked = clickedDiv.hasClass('clicked');

    // 클릭한 div에 'clicked' 클래스가 있으면 제거하고, 없으면 추가
    if (isClicked) {
        clickedDiv.removeClass('clicked').find('.bi-check-square-fill').remove();
    } else {
        clickedDiv.addClass('clicked');
        clickedDiv.append('<i class="bi bi-check-square-fill" style="color: #228b22;"></i>'); // bi-check 아이콘 추가
    }
});

// 유형 적용하기 버튼 이벤트
$(".typeApply").click(function () {
    // 클릭된 버튼 변수에 할당
    var clickedTypeButtons = $(".typeDiv.clicked");

    // 각 클릭된 버튼에 대한 정보 확인
    clickedTypeButtons.each(function () {
        // 내가 클릭한 버튼의 text
        var typeToken = $(this).text().trim();
        // 토큰을 토큰즈에 누적
        typeTokens.push(typeToken);
    });

    // typeTokens가 비어 있는지 확인
    if (typeTokens.length > 0) {
        testList();
        $(".type").html("<b style='color: black; font-size: 0.8em'>" + typeTokens + "<i class='bi bi-caret-down-fill'></i></b>");
    } else {
    	testList();
    	$(".type").html("<b style='color: black; font-size: 0.8em'>고용 형태&nbsp;<i class='bi bi-caret-down-fill'></i></b>");
    }
});


// 모달창 내 초기화 버튼
$(".typeReset").click(function () {
    // 모든 버튼 초기화
    $(".typeDiv").removeClass("clicked").find('.bi-check-square-fill').remove();
});

/////////////////////////////////////////////////////////////////////////////////////////
// 유형 버튼 클릭 이벤트
$(".academyDiv").click(function () {
    var clickedDiv = $(this);

    // 클릭한 div에 'clicked' 클래스가 있는지 확인
    var isClicked = clickedDiv.hasClass('clicked');

    // 클릭한 div에 'clicked' 클래스가 있으면 제거하고, 없으면 추가
    if (isClicked) {
        clickedDiv.removeClass('clicked').find('.bi-check-square-fill').remove();
    } else {
        clickedDiv.addClass('clicked');
        clickedDiv.append('<i class="bi bi-check-square-fill" style="color: #228b22;"></i>'); // bi-check 아이콘 추가
    }
});

// 유형 적용하기 버튼 이벤트
$(".academyApply").click(function () {
    // 클릭된 버튼 변수에 할당
    var clickedAcademyButtons = $(".academyDiv.clicked");

    // 각 클릭된 버튼에 대한 정보 확인
    clickedAcademyButtons.each(function () {
        // 내가 클릭한 버튼의 text
        var academyToken = $(this).text().trim();
        // 토큰을 토큰즈에 누적
        academyTokens.push(academyToken);
    });

    // typeTokens가 비어 있는지 확인
    if (academyTokens.length > 0) {
        testList();
        $(".academy").html("<b style='color: black; font-size: 0.8em'>" + academyTokens + "<i class='bi bi-caret-down-fill'></i></b>");
    } else {
    	
    	 testList();
         $(".academy").html("<b style='color: black; font-size: 0.8em'>학력&nbsp;<i class='bi bi-caret-down-fill'></i></b>");
    }
});


// 모달창 내 초기화 버튼
$(".academyReset").click(function () {
    // 모든 버튼 초기화
    $(".academyDiv").removeClass("clicked").find('.bi-check-square-fill').remove();
});

//전부초기화
$(".allReset").click(function () {
	
	$(".industry2").removeClass("clicked").find('.bi-check-square-fill').remove();
	$(".locationDiv").removeClass("clicked").find('.bi-check-square-fill').remove();
	$(".careerDiv").removeClass("clicked").find('.bi-check-square-fill').remove();
	$("#input-left").val(0);
	$("#input-right").val(10);
	setLeftValue();
	setRightValue();
	$(".typeDiv").removeClass("clicked").find('.bi-check-square-fill').remove();
	$(".academyDiv").removeClass("clicked").find('.bi-check-square-fill').remove();
	
	//$(".industryApply").click();
});  
}); //$(function)

// 날짜 형식을 변환하는 함수
function formatDate(date, format) {
    var MM = String(date.getMonth() + 1).padStart(2, '0');
    var dd = String(date.getDate()).padStart(2, '0');
    // 원하는 날짜 형식에 따라 추가적인 처리를 수행할 수 있습니다.
    return format.replace('MM', MM).replace('dd', dd);
}
	
   //리스트 세부분류+정렬
   function testList(minScore,maxScore,orderBy) {
    	  //alert(industryTokens);
    	  //alert(typeTokens);
    	  //alert(minScore+","+maxScore);
    	  //alert(orderBy);
    	  
	    $.ajax({
	        type: "get",
	        dataType: "json",
	        url: "/company/testList",
	        traditional: true, // 중간에 &를 ,로 변경하는 옵션
	        data: {"industry" : industryTokens, "career" :careerTokens,
	        	"location" : locationTokens,"gradeLeft":minScore,"gradeRight":maxScore,
	        	"type" : typeTokens ,"academy" : academyTokens , "orderBy" : orderBy},
          success: function (res) {
              var s = "";
              
           $.each(res, function (index, dto) {
               	  
        	   s +="<a href='detail?cnotice_num="+dto.cnotice_num+"' style='text-decoration: none; color:black;'>";
        	   s += "<div style='width: 22.5%; height: 57.5vh; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin: 2vw; border-radius: 1vw; overflow: hidden; float: left;'>";
        	   s += "<img src='../noticeImg/" + dto.cnotice_image + "' style='width: 100%; height: 50%;'><br><br>";
        	   s += "<div style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>";
        	   s += "<b style='font-size: 1.25em; margin-left: 2vw;'>" + dto.cnotice_noticename + "</b><br>"; //공고명

        	   s += "<a style='margin-left: 2vw; font-weight: bold; color: gray;'>" + dto.cnotice_career + "," + dto.cnotice_skill + "</a><br><br>";

        	   s += "<small style='margin-left: 2vw; font-weight: bold; font-size: 1em;'><img src='../noticeImg/" + dto.cnotice_image + "' style='width: 5%; height: 1%; border-radius: 20%;'>&nbsp;";
        	   s += dto.cnotice_companyname + "</small>&emsp;";
        	   if (dto.cnotice_grade === 0) {
        	       s += "<i class='bi bi-star-fill' style='color: gray;'></i>&nbsp;";
        	   } else {
        	       s += "<i class='bi bi-star-fill' style='color: green;'></i>&nbsp;";
        	   }
        	   s += dto.cnotice_grade.toFixed(1) + "</small><br><br>";
        	   s += "<hr style='width: 80%; margin: auto; border-color: #dcdcdc;'><br>";
        	   s += "<b style='font-size: 1em; margin-left: 2vw; font-weight: bold;'>"+ 
        	       (dto.cnotice_congratulate !== 0 ? 
        	           "<i class='bi bi-coin' style='color: gold;'></i> 취업 축하금: " + dto.cnotice_congratulate + "만원" : 
        	           "<i class='bi bi-emoji-frown-fill' style='color: red;'></i> 취업 축하금: 없음") + "</b>";
        	   
        	   // 날짜 포맷 변경
        	   var deadlineDate = new Date(dto.cnotice_deadline);
        	   var formattedDeadline = formatDate(deadlineDate, "MM-dd");
        	   s += "<div style='display: none;'>";
        	   s += dto.cnotice_writeday + " " + formattedDeadline + " " + dto.cnotice_readcount + " ";
        	   s += dto.cnotice_readcount + " " + dto.cnotice_recommend + " " + dto.cnotice_pay + " ";
        	   s += dto.cnotice_industry1 + " " + dto.cnotice_location + dto.cnotice_type + dto.cnotice_academy;
        	   s += "</div>"; //displaynone div
        	   s += "</div>"; //두번째 div
        	   s += "</div></a>";// 첫번째 div 

                     if ((index + 1) % 3 === 0) {
                         s += "<br>";
                     }
                 });
           
                 $(".notices").html(s); // 생성된 HTML로 교체
             
             }
         });
     }
</script>
</head>
<body>
	<!-- 각버튼마다 정렬이다른 list호출-->
	<!-- 왜 if문 밖에서는 margin-left와 border-radius만 적용되고 if문 안에서는 margin-top만 적용되는지:
if문 밖에서는 각각의 <div>가 가로로 나열되는데, 그때는 margin-top이 필요하지 않습니다. 그래서 if문 밖에서는 margin-left와 border-radius만 설정하였습니다.
if문 안에서는 세 번째 <div>가 나타날 때까지의 간격을 주기 위해 margin-top을 사용하였습니다. margin-left와 border-radius는 이미 첫 번째 <div>에서 설정되었기 때문에 if문 안에서는 따로 설정할 필요가 없습니다 -->

	<div style="width: 130vw;" class="container">
		<div align="left">
			<button type="button" onclick="location.href='addNoticeForm'"
				class="btn btn-outline-dark">채용공고등록</button>
			<button type="button" onclick="location.href='addDetailForm'"
				class="btn btn-outline-dark">상세정보등록</button>
		</div>
		<br> <br>
		<div class="d-flex align-items-center">
			<button type="button" class="btn btn-outline-light industry"
				style="width: 10vw; border: 1px solid gray;">
				<b style="color: black; font-size: 0.8em;"> 직종&nbsp;<i
					class="bi bi-caret-down-fill"></i></b>
			</button>
			&nbsp;
			<button type="button" class="btn btn-outline-light career"
				style="width: 10vw; border: 1px solid gray;">
				<b style="color: black; font-size: 0.8em"> 경력&nbsp;<i
					class="bi bi-caret-down-fill"></i></b>
			</button>
			&nbsp;
			<button type="button" class="btn btn-outline-light location"
				style="width: 15vw; border: 1px solid gray;">
				<b style="color: black; font-size: 0.8em"> 근무 지역&nbsp;<i
					class="bi bi-caret-down-fill"></i></b>
			</button>
			&nbsp;
			<button type="button" class="btn btn-outline-light grade"
				style="width: 10vw; border: 1px solid gray;">
				<b style="color: black; font-size: 0.8em"> 평점&nbsp;<i
					class="bi bi-caret-down-fill"></i></b>
			</button>
			&nbsp;
			<button type="button" class="btn btn-outline-light type"
				style="width: 15vw; border: 1px solid gray;">
				<b style="color: black; font-size: 0.8em"> 고용 형태&nbsp;<i
					class="bi bi-caret-down-fill"></i></b>
			</button>
			&nbsp;
			<button type="button" class="btn btn-outline-light academy"
				style="width: 10vw; border: 1px solid gray;">
				<b style="color: black; font-size: 0.8em"> 학력&nbsp;<i
					class="bi bi-caret-down-fill"></i></b>
			</button>
			&emsp;
			<div class="allReset" style="cursor: pointer; width: 10vw;">
				<i class="bi bi-arrow-clockwise"></i>&nbsp;<b
					style="color: gray; margin-left: 0.5em;">초기화</b>
			</div>
			&emsp;&emsp;&emsp;&emsp;&emsp; <select class="form-select"
				style="width: 20%; text-align: center;" name="sort" id="orderBy">
				<option class="writeday">최신순</option>
				<option class="deadline">마감임박순</option>
				<option class="readcount">조회수순</option>
				<option class="recommend">추천순</option>
				<option class="congratulate">취업 축하금순</option>
			</select>
		</div>
		<br> <br>
		<!-- list 출력 div -->
		<div class="container notices" style="width: 100%;"></div>
	</div>

	<!-- 산업군 Modal -->
	<div class="modal" id="industryModal">
		<div class="modal-dialog" style="max-width: 15.5vw; height: 50vh;"
			align="center">
			<!-- 원하는 max-width 및 width 값을 설정하세요 -->
			<div class="modal-content">
				<!-- 직종 Modal Header -->
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 1차직종 Modal body -->
				<div class="modal-body1"
					style="text-align: left; overflow-y: auto; overflow-x: hidden; max-height: 300px;">
					<%
					String industryString = "전체,IT/웹/통신,서비스업,제조/화학,교육,미디어/디자인";
					String[] industryArray = industryString.split(",");
					pageContext.setAttribute("industryArray", industryArray);
					%>
					<c:forEach var="token" items="${industryArray}" varStatus="i">
						<c:set var="index" value="${i.index + 1}" />
						<!-- HTML 부분 -->
						<div class="industryDiv1" data-token="${token}"
							style="cursor: pointer; width: 6.5vw; margin-left: 25%; margin-top: 7%;">
							<b style="font-size: 1em;">${token}</b>
						</div>
					</c:forEach>
					<br>
					<div class="industryDiv2">
						<!-- industrydiv2의 내용 -->
					</div>
				</div>


				<!-- 직종 Modal footer -->
				<div class="modal-footer d-flex justify-content-center">
					<br> <br>
					<button type="button" class="btn btn-light industryReset"
						data-dismiss="modal" style="width: 6vw; font-size: 1em;">초기화</button>
					<button type="button" class="btn btn-success industryApply"
						data-bs-dismiss="modal" style="width: 6vw; font-size: 1em;">적용하기</button>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	<!-- -------------------------------------------------------------------------------------------------- -->
	<!-- 경력 Modal -->
	<div class="modal" id="careerModal">
		<div class="modal-dialog" style="max-width: 15.5vw;" align="center">
			<!-- 원하는 max-width 및 width 값을 설정하세요 -->
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<%
					String careerString = "경력무관,신입,경력";
					String[] careerArray = careerString.split(",");
					pageContext.setAttribute("careerArray", careerArray);
					%>
					<c:forEach var="token" items="${careerArray}" varStatus="loop">
						<c:set var="index" value="${loop.index + 1}" />
						<div class="careerDiv" data-token="${token}"
							style="cursor: pointer; width: 6.5vw; margin-left: 3%; margin-top: 7%;">
							<b style="font-size: 1em;">${token}</b>
						</div>
						<c:if test="${index % 3 == 0}">
							<br>
						</c:if>
					</c:forEach>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer d-flex justify-content-center">
					<br> <br>
					<button type="button" class="btn btn-light careerReset"
						data-dismiss="modal" style="width: 6vw; font-size: 1em;">초기화</button>
					<button type="button" class="btn btn-success careerApply"
						data-bs-dismiss="modal" style="width: 6vw; font-size: 1em;">적용하기</button>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	<!-- -------------------------------------------------------------------------------------------------- -->
	<!-- 평점 Modal -->

	<div class="middleBox">
		<div class="middle">
			<span id="score-range" style="margin-left: 44%"><b>전체</b></span><span
				id="range-value" style="margin-left: 40%"></span> <br> <br>
			<span class="minscore" style="float: left; margin-left: 4.7%;"><b>0</b></span>
			<span class="maxscore" style="float: right; margin-right: 4.7%"><b>5</b></span>
			<br> <br>
			<div class="multi-range-slider">
				<b><i class="bi bi-x-lg close"
					style="position: absolute; top: -1vw; right: -5%; cursor: pointer; font-size: 1.4em;"></i></b>
				<!-- 여기에 아이콘 추가 -->
				<input type="range" id="input-left" min="0" max="10" value="0">
				<input type="range" id="input-right" min="0" max="10" value="10">

				<div class="slider">
					<div class="track"></div>
					<div class="range"></div>
					<div class="thumb left"></div>
					<div class="thumb right"></div>
				</div>
				<br> <br>
				<button type="button" class="btn btn-white gradeReset"
					style="margin-left: 18%; border: 0.5px solid #F2F2F2;">초기화</button>
				&nbsp;
				<button type="button" class="btn btn-success gradeApply">적용하기</button>
			</div>
		</div>
	</div>


	<!-- ---------------------------------------------------------------------------------------------------------- -->
	<!-- 지역 Modal -->
	<div class="modal" id="locationModal">
		<div class="modal-dialog" style="max-width: 15.5vw;" align="center">
			<!-- 원하는 max-width 및 width 값을 설정하세요 -->
			<div class="modal-content">
				<!-- 지역 Modal Header -->
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 지역 Modal body -->
				<div class="modal-body">
					<%
					String locationString = "전체,서울,경기,인천,대전,세종";
					String[] locationArray = locationString.split(",");
					pageContext.setAttribute("locationArray", locationArray);
					%>
					<c:forEach var="token" items="${locationArray}" varStatus="i">
						<c:set var="index" value="${i.index + 1}" />
						<div class="locationDiv" data-token="${token}"
							style="cursor: pointer; width: 6.5vw; margin-left: 3%; margin-top: 7%;">
							<b style="font-size: 1em;">${token}</b>
						</div>
					</c:forEach>
				</div>
				<!-- 지역 Modal footer -->
				<div class="modal-footer d-flex justify-content-center">
					<br> <br>
					<button type="button" class="btn btn-light locationReset"
						data-dismiss="modal" style="width: 6vw; font-size: 1em;">초기화</button>
					<button type="button" class="btn btn-success locationApply"
						data-bs-dismiss="modal" style="width: 6vw; font-size: 1em;">적용하기</button>
					<br> <br>
				</div>
			</div>
		</div>
	</div>

	<!-- ---------------------------------------------------------------------------------------------------------- -->
	<!-- 고용형태 Modal -->
	<div class="modal" id="typeModal">
		<div class="modal-dialog" style="max-width: 15.5vw;" align="center">
			<!-- 원하는 max-width 및 width 값을 설정하세요 -->
			<div class="modal-content">
				<!-- 지역 Modal Header -->
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 지역 Modal body -->
				<div class="modal-body">
					<%
					String typeString = "정규직,계약직";
					String[] typeArray = typeString.split(",");
					pageContext.setAttribute("typeArray", typeArray);
					%>
					<c:forEach var="token" items="${typeArray}" varStatus="loop">
						<c:set var="index" value="${loop.index + 1}" />
						<div class="typeDiv" data-token="${token}"
							style="cursor: pointer; width: 6.5vw; margin-left: 3%; margin-top: 7%;">
							<b style="font-size: 1em;">${token}</b>
						</div>
					</c:forEach>
				</div>

				<!-- 지역 Modal footer -->
				<div class="modal-footer d-flex justify-content-center">
					<br> <br>
					<button type="button" class="btn btn-light typeReset"
						data-dismiss="modal" style="width: 6vw; font-size: 1em;">초기화</button>
					<button type="button" class="btn btn-success typeApply"
						data-bs-dismiss="modal" style="width: 6vw; font-size: 1em;">적용하기</button>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------------------------------------------------ -->
	<!-- 학력modal -->
	<div class="modal" id="academyModal">
		<div class="modal-dialog" style="max-width: 15.5vw;" align="center">
			<!-- 원하는 max-width 및 width 값을 설정하세요 -->
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<%
					String academicString = "고등학교 졸업,대학졸업 (2-3년),대학교졸업 (4년),대학원졸업,석사,박사,학력무관";
					String[] academicArray = academicString.split(",");
					pageContext.setAttribute("academicArray", academicArray);
					%>
					<c:forEach var="token" items="${academicArray}" varStatus="loop">
						<div class="academyDiv" data-token="${token}"
							style="cursor: pointer; width: 10vw; margin-left: 3%; margin-top: 3%;">
							<b style="font-size: 1em;">${token}</b>
						</div>
					</c:forEach>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer d-flex justify-content-center">
					<br> <br>
					<button type="button" class="btn btn-light academyReset"
						data-dismiss="modal" style="width: 6vw; font-size: 1em;">초기화</button>
					<button type="button" class="btn btn-success academyApply"
						data-bs-dismiss="modal" style="width: 6vw; font-size: 1em;">적용하기</button>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>