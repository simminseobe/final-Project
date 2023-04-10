<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/mypage.css">
<link rel="stylesheet" href="/resources/css/member/deleteFrm.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>

 <div class="menu">
        <ul class="main-menu">
            <li id="myBox"><a href="#">나의 메가박스</a></li>
            <li><a href="#">예매/구매내역</a></li>
            <li>
                <a href="#">영화/스토어 관람권</a>
                <ul class="sub-menu">
                    <li><a href="#">• 영화관람권</a></li>
                    <li><a href="#">• 스토어 교환권</a></li>
                </ul>
            </li>
            <li><a href="#">메가박스 쿠폰</a></li>
           <li><a href="#">멤버십 포인트</a></li>
           <li><a href="#">나의 무비스토리</a></li>
           <li><a href="#">나의 이벤트 응모내역</a></li>
           <li><a href="#">나의 문의내역</a></li>
             <li>
                <a href="#">회원정보</a>
                <ul class="sub-menu">
                    <li><a href="/myProfile.do">• 개인정보 수정</a></li>
                    <li><a href="#">• 선택정보 수정</a></li>
                </ul>
            </li>
        </ul>
    </div>
	<div class="wrapper">
        <div class="mypage-wrap">
            <div class="mypage-header">
                <h2>회원탈퇴</h2>
                <ul class="info">
                    <li>[주의]회원님의 정보를 정확히 입력해주세요.</li>
                </ul>
            </div>
            
            <div class="btn-wrap">
                <button type="button" id="cancelBtn">취소</button>
                <input type="submit" value="등록" id="enrollBtn"></input>
            </div>
        </div>
   </div>
    
   <script src="/resources/js/member/myProfile.js"></script>
   <jsp:include page="/WEB-INF/views/common/footer.jsp" />