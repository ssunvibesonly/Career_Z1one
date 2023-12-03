<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  
<!-- 네아로 SDK -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
  
</head>
<body>
  
    <!-- 네이버 로그인 버튼 생성 위치 -->
    <div id="naverIdLogin"></div>
  
</body>
<script type="text/javascript">
    var naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "lT5_vMMwhZOvTIyDkiRF",
              // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
            callbackUrl: "http://localhost:9000/login/callback",
              // 본인의 callBack url로 수정하세요.
            isPopup: false,
            loginButton: {color: "white", type: 3, height: 60}
              // 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
        }
    );
naverLogin.init();
</script>
</html>