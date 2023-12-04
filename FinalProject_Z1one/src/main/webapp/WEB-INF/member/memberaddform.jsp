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

        .two {
            text-align: center;
            cursor: pointer;
            margin-top: 5%;

        }

        .madebtn {
            position: relative;
            height: 50px;
            width: 280px;
            border: 0;
            border-radius: 20px;
            text-transform: uppercase;
            font-size: 1.1em;
            overflow: hidden;
            box-shadow: 0 4px 12px 0 rgba(152, 160, 180, 10);
            z-index: -2;
            font-weight: bold;
            color: white;
            z-index:100;
        }


        .fill-two {
            position: absolute;
            background-image: linear-gradient(to right, #E040FB, #00BCD4);
            background-size: 150% 150%;
            height: 70px;
            width: 420px;
            border-radius: 20px;
            margin: -40px 0 0 -140px;
            z-index: -1;
            transition: all 0.4s ease;
        }

        .two:hover .fill-two {
            -webkit-animation: gradient 3s ease infinite;
            -moz-animation: gradient 3s ease infinite;
            animation: gradient 3s ease infinite;
        }

        #loginbox{
            border: 1px solid lightgray;
            border-radius:20px;
            width: 350px;
            height: 520px;


        }

        #loginbox2{
            border: 1px solid lightgray;
            border-radius:20px;
            width: 350px;
            height: 900px;


        }
        .login_type{
            border: 1px solid lightgray;
            border-radius:10px;
            width: 350px;
            height: 52px;
            font-size: 12pt;
            margin-bottom: 1%;
        }
        .logincontext{
            font-size: 10pt;
            text-align: center;
            color: gray;
        }
        .loginplus{
            text-decoration: none;
            color: gray;
            font-size: 10pt;
        }

        .filebox .upload-name {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 50%;
            color: #999999;
            border-radius: 6px;
        }

        .filebox label {
            display: inline-block;
            padding: 10px 10px;
            color: #fff;
            vertical-align: middle;
            background-color: #999999;
            cursor: pointer;
            height: 47px;
            margin-left: 10px;
            margin-bottom: 1.5%;
            border-radius: 5px;
        }

        .filebox input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }

        .pl{
            width: 250px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            padding: 9px 8px;
            font-style: normal;
            font-weight: 400;
            font-size: 16px;
            color: #585858;
            line-height: 16px;
        }

        .pl:focus{
            border: 1px solid #dddddd;
            box-sizing: border-box;
            border-radius: 10px;
            /* outline: 3px solid #F8E4FF; */
            border-radius: 10px;
        }


        @-webkit-keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        @-moz-keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
    </style>
    <script type="text/javascript">
        $(function(){
            /* 상단 개인회원,기업회원 버튼 */
            $("#tabs-2").hide();

            $("div.login_type_user").click(function(){
                $("#tabs-2").hide();
                $("#tabs-1").show();
                $(".login_type_company").css('border','none');
                $(".login_type_user").css('border','1px solid black');
            })

            $("div.login_type_company").click(function(){
                $("#tabs-1").hide();
                $("#tabs-2").show();
                $(".login_type_user").css('border','none');
                $(".login_type_company").css('border','1px solid black');
            })

            //이메일 입력시 중복된지 체크
            $("#user_email").focusout(function(e){

                $.ajax({
                    type:"get",
                    dataType:"json",
                    url:"useridcheck",
                    data:{"user_email":$("#user_email").val()},
                    success:function(res){
                        if(res.count==0){
                            $("#user_email").css('border','2px solid green');
                            $("span.useridsuccess").text("사용 가능한 이메일입니다.").css('color','green');
                            $("#loginbox").css('height', '550px');
                        }else{
                            $("#user_email").css('border','2px solid red');
                            $("span.useridsuccess").text("이미 가입된 이메일입니다.").css('color','red');

                        }
                    }
                });
            });
            $("#company_Email").focusout(function(e){

                var company_email=$(this).val();

                $.ajax({
                    type:"get",
                    dataType:"json",
                    url:"companyidcheck",
                    data:{"company_email":company_email},
                    success:function(res){

                        if(res.count==0){
                            $("#company_Email").css('border','2px solid green');
                            $("span.companyidsuccess").text("사용 가능한 이메일입니다.").css('color','green');
                            $("#loginbox2").css('height', '930px');
                        }else{
                            $("#company_Email").css('border','2px solid red');
                            $("span.companyidsuccess").text("이미 가입된 이메일입니다.").css('color','red');

                        }
                    }
                });
            });
            //비밀번호확인 여부
            $("#user_pass2").keyup(function() {
                var p1=$("#user_pass").val();
                var p2=$(this).val();
                $("#user_pass2").css('border','1px solid lightgray');
                $("span.userpasscheck").text("").css('color','none');
                if(p1!=p2){
                    $("#user_pass2").css('border','2px solid red');
                    $("span.userpasscheck").text("비밀번호가 다릅니다. 동일한 비밀번호를 입력해 주세요.").css('color','red');
                }
            });

            $("#company_Pass2").keyup(function() {
                var p1=$("#company_Pass").val();
                var p2=$(this).val();
                $("#company_Pass2").css('border','1px solid lightgray');
                $("span.companypasscheck").text("").css('color','none');
                if(p1!=p2){
                    $("#company_Pass2").css('border','2px solid red');
                    $("span.companypasscheck").text("비밀번호가 다릅니다. 동일한 비밀번호를 입력해 주세요.").css('color','red');
                }
            });
        })
        function usercheck() {
            //id
            if($("span.useridsuccess").text()!='사용 가능한 이메일입니다.'){
                return false;
            }

            //pass
            if($("span.userpasscheck").text()!=''){
                return false;
            }
        }
        function companycheck() {

            var y=confirm("추가 정보를 입력하셔야 가입이 완료됩니다.\n정보 입력을 하러 가시겠습니까?")

            if(y){

                return true;
            }else{

                location.reload();
                return false;
            }

            if($("span.companyidsuccess").text()!='사용 가능한 이메일입니다.'){
                alert("이메일 주소를 확인해주세요!");
                return false;
            }

            if($("span.companypasscheck").text()!=''){
                alert("이메일 주소를 확인해주세요!");
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        $(function(){

            // 비밀번호 유효성 검사
            $("#user_pass").keyup(function() {
                validatePassword();
            });

            $("#user_pass2").keyup(function() {
                validatePassword();
            });

            function validatePassword() {
                var password = $("#user_pass").val();
                var confirmPassword = $("#user_pass2").val();

                // 비밀번호가 10자리 이상이어야 함
                if (password.length < 10) {
                    $("#user_pass").css('border', '2px solid red');
                    $("span.userpasscheck").text("비밀번호는 10자리 이상이어야 합니다.").css('color', 'red');
                    $("#loginbox").css('height', '585px');
                    return;
                }

                // 문자와 숫자의 조합 확인
                var regex = /^(?=.*[a-zA-Z])(?=.*\d).+$/;
                if (!regex.test(password)) {
                    $("#user_pass").css('border', '2px solid red');
                    $("span.userpasscheck").text("비밀번호는 문자와 숫자의 조합이어야 합니다.").css('color', 'red');
                    $("#loginbox").css('height', '585px');

                    return;
                }

                // 비밀번호 확인과 일치하는지 확인
                if (password !== confirmPassword) {
                    $("#user_pass2").css('border', '2px solid red');
                    $("span.userpasscheck").text("비밀번호가 일치하지 않습니다.").css('color', 'red').css('left', '-60px');
                    $("#loginbox").css('height', '585px');
                    return;
                }

                // 모든 조건이 충족되면 유효한 비밀번호로 간주
                $("#user_pass").css('border', '1px solid lightgray');
                $("#user_pass2").css('border', '1px solid lightgray');
                $("span.userpasscheck").text("").css('color', 'none');
                $("#loginbox").css('height', '550px');
            }

            // 비밀번호 유효성 검사
            $("#company_Pass").keyup(function() {
                validatePassword2();
            });

            $("#company_Pass2").keyup(function() {
                validatePassword2();
            });

            function validatePassword2() {
                var password = $("#company_Pass").val();
                var confirmPassword = $("#company_Pass2").val();

                // 비밀번호가 10자리 이상이어야 함
                if (password.length < 10) {
                    $("#company_Pass").css('border', '2px solid red');
                    $("span.companypasscheck").text("비밀번호는 10자리 이상이어야 합니다.").css('color', 'red');
                    $("#loginbox2").css('height', '920px');
                    return;
                }

                // 문자와 숫자의 조합 확인
                var regex = /^(?=.*[a-zA-Z])(?=.*\d).+$/;
                if (!regex.test(password)) {
                    $("#company_Pass").css('border', '2px solid red');
                    $("span.companypasscheck").text("비밀번호는 문자와 숫자의 조합이어야 합니다.").css('color', 'red').css('left', '-30px');
                    $("#loginbox2").css('height', '920px');
                    return;
                }

                // 비밀번호 확인과 일치하는지 확인
                if (password !== confirmPassword) {
                    $("#company_Pass2").css('border', '2px solid red');
                    $("span.companypasscheck").text("비밀번호가 일치하지 않습니다.").css('color', 'red').css('left', '-60px');
                    $("#loginbox2").css('height', '920px');
                    return;
                }

                // 모든 조건이 충족되면 유효한 비밀번호로 간주
                $("#company_Pass").css('border', '1px solid lightgray');
                $("#company_Pass2").css('border', '1px solid lightgray');
                $("span.companypasscheck").text("").css('color', 'none');
            }
        });
    </script>
    <c:if test="${not empty alertMessage}">
        <script>
            alert('${alertMessage}');
        </script>
    </c:if>

    <c:set var="root" value="<%=request.getContextPath() %>"></c:set>
</head>
<body>
<br>
<div class="container" align="center">

    <img alt="" src="${root }/image/final_logo.gif" style="width: 150px;margin-bottom: 1%;">
    <br><br>
    <b style="color: gray; font-size: 10pt; line-height: 1%;">Z1one은 회원님의 익명성을 보장하기 위해 <br> 어떠한 개인정보도 노출하지 않습니다.</b><br><br>
    <div class="d-inline-flex" style="border-radius: 10px;width: 350px;height: 50px; background-color: #E6E6E6; cursor: pointer" >
        <div class="login_type_user" style="width: 175.5px; border: 1px solid black; border-radius: 10px; padding-top: 3%;"><b>개인회원</b></div>
        <div class="login_type_company" style="border-radius: 10px; width: 175.5px; padding-top: 3%;"><b>기업회원</b></div>
    </div>
    <br>
    <br>
    <!-- 개인회원가입 -->
    <div id="tabs-1">
        <div id="loginbox" class="a">
            <form action="userinsert" method="post" enctype="multipart/form-data" onsubmit="return usercheck()">
                <div align="left"
                     style="margin-left: 5%; margin-top: 5%;font-weight: bold;">회원가입</div><br>
                <img alt="" src="${root }/image/naverloginbtn.png" style="width: 200px;height: 47px;margin-bottom: 1%;"><br>
                <img alt="" src="${root }/image/kakaologinbtn.png" style="width: 200px;height: 47px; cursor:pointer;"
                     onclick="location.href='https://kauth.kakao.com/oauth/authorize?' +
                      'client_id=1f310f9b986fd8ff43e39a14a5f9d6db' +
                       '&redirect_uri=http://localhost:9000/login/kakao&response_type=code'">
                <hr style="margin-left: 5%;margin-right: 5%;">

                <input type="text" class="form-control email" name="user_email" id="user_email"
                       style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="이메일 주소" required="required" value="${myid}">
                <span class="useridsuccess" style="color: red; font-size: 7pt; font-weight: bold; position: relative; top: -10px; left: -65px;"></span>
                <input type="text" class="form-control" name="user_name" id="user_name"
                       style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="이름" required="required" value="${nickname}">
                <input type="password" class="form-control" name="user_pass" id="user_pass"
                       style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="비밀번호(10자리 이상)" required="required">
                <input type="password" class="form-control" id="user_pass2"
                       style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="비밀번호 확인" required="required">
                <span class="userpasscheck" style="color: red; font-size: 7pt; font-weight: bold; position: relative; top: -10px; left: -35px;"></span>

                <!-- 로그인버튼-->
                <div class="two" id="btnbox">
                    <button type="submit" id="mbtn" class="madebtn">
                        <i class="bi bi-envelope" style="margin-right: 5%;"></i><a style="font-size: 10pt;">이메일로 가입하기</a>
                        <div class="fill-two"></div></button></div><br>



                <hr style="margin-bottom: 6%">

                <div style="font-size: 10pt;">이미 회원이세요?&nbsp;
                    <a href="/login/form" style="text-decoration: none;font-size: 10pt;">로그인</a></div>

            </form>
        </div>
    </div>
</div>
<!-- 기업 회원가입 -->
<div class="container" align="center">
    <div id="tabs-2">
        <div id="loginbox2" class="a">
            <form action="companyinsert" method="post" enctype="multipart/form-data" onsubmit="return companycheck()">
                <div align="left"
                     style="margin-left: 5%; margin-top: 5%;font-weight: bold;">회원가입</div><br>
                <input type="text" class="form-control" name="company_email" id="company_Email"
                       style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="이메일 주소" required="required">
                <span class="companyidsuccess" style="color: red; font-size: 7pt; font-weight: bold; position: relative; top: -10px; left: -65px;"></span>
                <input type="password" class="form-control" name="company_pass" id="company_Pass"
                       style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="비밀번호(10자리 이상)" required="required">
                <input type="password" class="form-control" id="company_Pass2"
                       style="width: 250px;height: 47px;" placeholder="비밀번호 확인" required="required">
                <span class="companypasscheck" style="color: red; font-size: 7pt; font-weight: bold; position: relative; top: -4px; left: -45px;"></span><br>
                <a href="/login/form" style="font-size:10px; margin-left: 33%; color: #424242; padding-bottom: 4%;"><b>이미 사용중인 계정 이용하기</b></a>
                <input type="text" class="form-control" name="company_name"
                       style="width: 250px;height: 47px; margin-bottom: 2%; margin-top: 6%;" placeholder="기업명" required="required">
                <!-- <input type="text" class="form-control" name="user_email"
                style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="1차 산업군" required="required"> -->


                <select name="company_primary" id="company_Primary" class="pl" style="margin-bottom: 2%;" onchange="optionChange();">
                    <option value="0" selected>1차 산업군</option>
                    <option value="IT/웹/통신">IT/웹/통신</option>
                    <option value="서비스업">서비스업</option>
                    <option value="제조/화학">제조/화학</option>
                    <option value="교육">교육</option>
                    <option value="미디어/디자인">미디어/디자인</option>
                </select>

                <select name="company_secondary" id="company_Secondary" class="pl" style="margin-bottom: 2%;">
                    <option>2차 산업군</option>
                    <!-- <option value="game">게임</option>
                    <option value="healing">보안/백신</option>
                    <option value="shoping">쇼핑몰/오픈마켓</option>
                    <option value="network">네트워크/통신/모바일</option>
                    <option value="si">솔루션/SI/ERP/CRM</option>
                    <option value="zz">zz</option> -->
                </select>

                <!-- 1,2차 산업군 동적 select -->
                <script type="text/javascript">
                    function optionChange(){
                        var it= ['게임','보안/백신','쇼핑몰/오픈마켓','네트워크/통신/모바일','솔루션/SI/ERP/CRM'];
                        var service=['호텔/여행/항공','뷰티/미용','레저/스포츠/여가'];
                        var make=['전기/전자/제어','석유/화학/에너지','식품가공/개발','화장품/뷰티'];
                        var edu=['초중고/대학','유아/유치원','학원/어학원'];
                        var design=['실내/인테리어/조경','환경설비','부동산/임대']


                        var primary=$('#company_Primary').val();

                        var secondary;

                        if(primary=='IT/웹/통신')
                        {
                            secondary=it;
                        }else if (primary=='서비스업') {
                            secondary=service;
                        }else if (primary=='제조/화학') {
                            secondary=make;
                        }else if (primary=='교육') {
                            secondary=edu;
                        }else if (primary=='미디어/디자인') {
                            secondary=design;
                        }
                        else{
                            secondary=[];
                        }
                        $('#company_Secondary').empty();
                        $('#company_Secondary').append('<option>2차 산업군</option>');
                        for ( var i = 0; i < secondary.length; i++ ) {
                            $('#company_Secondary').append('<option>'+secondary[i]+'</option>');
                        }
                    }

                </script>

                <!-- <input type="text" class="form-control" name="user_email"
                style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="2차 산업군" required="required"> -->
                <input type="text" class="form-control" name="company_reginum"
                       style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="사업자등록번호('-' 제외)" required="required">
                <br>
                <input type="text" class="form-control" name="company_manager"
                       style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="담당자 이름" required="required">
                <input type="text" class="form-control" name="company_hp"
                       style="width: 250px;height: 47px; margin-bottom: 2%;" placeholder="연락처('-' 제외)" required="required">

                <div class="filebox">
                    <input class="upload-name"
                           style="width: 180px;height: 47px; margin-bottom: 2%;" placeholder="회사로고 이미지" >
                    <label for="file">첨부</label>
                    <input type="file" id="file" name="Logo">
                </div>

                <script type="text/javascript">
                    $("#file").on('change',function(){
                        var fileName = $("#file").val();
                        $(".upload-name").val(fileName);
                    });
                </script>

                <select name="company_type" id="" class="pl" style="margin-bottom: 2%;">
                    <option value="0" selected>기업 형태</option>
                    <option value="대기업">대기업</option>
                    <option value="중견기업">중견기업</option>
                    <option value="중소기업">중소기업</option>
                    <option value="공공기관">공공기관</option>
                </select>



                <!-- 로그인버튼-->
                <div class="two" id="btnbox">
                    <button type="submit" id="mbtn" class="madebtn">
                        기업회원 가입하기
                        <div class="fill-two"></div></button></div><br>


                <hr style="margin-bottom: 6%">
                <div style="font-size: 10pt;">이미 회원이세요?&nbsp;
                    <a href="/login/form" style="text-decoration: none;font-size: 10pt;">로그인</a></div>

            </form>
        </div>
    </div>
</div>
<br><br>
</body>
</html>