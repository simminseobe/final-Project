<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
 <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/member/signIn2.css">
</head>
<body>
<img class="wave" src="/image/wave.png">
<!-- <img class="wave" src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png"> -->
  <div class="container">
    <div class="img">
      	<img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg">
    </div>
    <div class="login-content">
      <form action="/signIn.do" method="post">
        <a href="/"><img src="/image/logo2.PNG"></a>
        <h2 class="title">Welcome</h2>
              <div class="input-div one">
                 <div class="i">
                    <i class="fas fa-user"></i>
                 </div>
                 <div class="div">
                    <h5>UserId</h5>
                    <input type="text" name="memberId" class="input" autocomplete=off>
                 </div>
              </div>
              <div class="input-div pass">
                 <div class="i"> 
                    <i class="fas fa-lock"></i>
                 </div>
                 <div class="div">
                    <h5>Password</h5>
                    <input type="password" name="memberPw" class="input" autocomplete=off>
                 </div>
              </div>
              <a href="/findIdFrm.do" class="a-design">ID/PW 찾기</a>
              <a href="/joinFrm.do" class="login-form a-design">회원가입</a><br>
              <input type="submit" class="btn" value="Login">
              <div class="subBtn">
        		<!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=95e454d415a0cf20175203f81771b058&redirect_uri=http://192.168.35.198/kakaoLogin.do&response_type=code" class="login-form"> -->
        		<a href="https://kauth.kakao.com/oauth/authorize?client_id=95e454d415a0cf20175203f81771b058&redirect_uri=http://192.168.10.32/kakaoLogin.do&response_type=code" class="login-form a-design">
        			<img src="/image/kakao_login_medium_wide.png" id="kakaoBtn">
        		</a>
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align:center">
					<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=2bPh_mYXLtkjmaWWo_8B&state=vKHZagAtTC&redirect_uri=http://192.168.10.32/callback.do" class="a-design">
					<img src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" id="naverBtn"></a></div>
        	</div>
            </form>
        </div>
    </div>
	<script src="/resources/js/member/signIn2.js"></script>
</body>
</html>