<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<menubar id="my_menu">
<div class="menu-wrap">
 <div class="menu">
        <ul class="main-menu">
            <li id="myBox"><a href="/purchaseList.do?reqPage=1&memberNo=${sessionScope.m.memberNo }">나의 메가박스</a></li>
            <li><a href="/purchaseList.do?reqPage=1&memberNo=${sessionScope.m.memberNo }">예매/구매내역</a></li>
            <li><a href="/giftTicket.do?reqPage=1&memberNo=${sessionScope.m.memberNo }">영화 관람권</a></li>
           <li><a href="/myPoint.do?reqPage=1&memberNo=${sessionScope.m.memberNo }">멤버십 포인트</a></li>
           <li><a href="/myMovie.do">나의 무비스토리</a></li>
           <li><a href="#">나의 문의내역</a></li>
           <li id="last-li"><a href="/myProfile.do">개인정보 수정</a></li>
        </ul>
    </div>
    </div>
    
</menubar>
