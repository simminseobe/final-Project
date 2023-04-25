<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Life Theater, MEGABOX</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,700&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/menubar.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/gift/giftMain.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
</head>
<body>
<header id="mega_hd">
    <div class="wrap">
        <h1><a href="/">Megabox</a></h1>
        <nav class="clearfix">
            <ul>
                <li><a href="/allMovieList.do?">영화</a></li>
                <li><a href="#">큐레이션</a></li>
                <li><a href="/allTheater.do">영화관</a></li>
                <li><a href="#">특별관</a></li>
                <li><a href="/allGiftList.do">스토어</a></li>
                <li><a href="#">이벤트</a></li>
                <c:choose>
	                <c:when test="${empty sessionScope.m}">
		                <li><a href="/login.do">로그인</a></li>
	                </c:when>
	                <c:when test="${not empty sessionScope.m.memberPw}">
	                	<li><a href="/logout.do">로그아웃</a></li>
	                </c:when>
	                <c:otherwise>
	                <!-- https://kauth.kakao.com/oauth/logout?client_id=95e454d415a0cf20175203f81771b058&logout_redirect_uri=http://192.168.10.32/kakaoLogout.do -->
	                	<li><a href="https://kauth.kakao.com/oauth/logout?client_id=95e454d415a0cf20175203f81771b058&logout_redirect_uri=http://192.168.10.32/kakaoLogout.do">로그아웃</a></li>
	                </c:otherwise>
                </c:choose>
                
            </ul>
        </nav>
    </div>
</header>
