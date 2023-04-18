<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,700&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap&subset=korean" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/signIn.css">
</head>
<body class="align">
  <div class="grid align__item">
    <div class="register">
      <a href="/"><img src="/resources/images/common/logo.png" style="width: 280px"; "height=100px";></a>
      <defs>
	      <linearGradient id="a" x1="0%" y1="0%" y2="0%"><stop offset="0%" stop-color="#8ceabb"/>
	      <stop offset="100%" stop-color="#378f7b"/>
	      </linearGradient>
      </defs>
      <!-- <path fill="url(#a)" d="M215 214.9c-83.6 123.5-137.3 200.8-137.3 275.9 0 75.2 61.4 136.1 137.3 136.1s137.3-60.9 137.3-136.1c0-75.1-53.7-152.4-137.3-275.9z"/> -->
      </svg>
      
      <h2 style="margin-top: 35px;">Sign Up</h2>
      <form action="/signIn.do" method="post" class="form">
        <div class="form__field">
          <input type="text" name="memberId" placeholder="Please enter your ID" class="input-box1" autocomplete=off>
        </div>
        <div class="form__field">
          <input type="password" name="memberPw" placeholder="••••••••••••" class="input-box2" autocomplete=off>
        </div>
        <div class="form__field">
          <input type="submit" value="로그인" class="input-box3">
        </div>
        <div>
        	<div class="position-wrap">
	        	<div class="position">
		        	<a href="/findIdFrm.do" class="login-form">ID/PW 찾기</a> <span class="bar">|</span> 
	    	    	<a href="/joinFrm.do" class="login-form">회원가입</a><br>
	        	</div>
        	</div>
        	<div class="subBtn">
        		<a href="https://kauth.kakao.com/oauth/authorize?client_id=95e454d415a0cf20175203f81771b058&redirect_uri=http://192.168.10.32/kakaoLogin.do&response_type=code" class="login-form">
        			<img src="/image/kakao_login_medium_wide.png" class="kakaoBtn">
        		</a>
        	</div>
        </div>
      </form>
    </div>
  </div>
  
<!-- <script>
  	/* 카카오 로그인 */
  	function kakaoLogin() {
  		$.ajax({
  			url: "/getKakaoAuthUrl.do",
  			type : "POST",
  			async : false,
  			dataType : "text",
  			success : function(data) {
  				location.href = data;
  			}
  		});
  	}
  	
  	$(document).ready(function() {
  		let kakaoInfo = "${kakaoInfo}";
  		if(kakaoInfo != "") {
  			let data = JSON.parse(kakaoInfo);
  			
  			alert("카카오 로그인 성공 \n accessToken : " + data["accessToken"]);
  			alert("user : \n" + "email : " + data["email"] + "\n nickname : " + data["nickname"]);
  		}
  	});
  </script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> -->
</body>
</html>