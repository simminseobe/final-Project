<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/mypage.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
</head>
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
                    <li><a href="#">• 개인정보 수정</a></li>
                    <li><a href="#">• 선택정보 수정</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <script>
    $(".menu a").on("click",function(){
    	$(".menu a").css("color","#808080");
    	$(".menu a").css("background-color","#f4f4f4");
    	$(".menu a").css("font-weight","400");
    	$("#myBox>a").css("color","#fff");
    	$("#myBox>a").css("background-color","#454545");
    	$("#myBox>a").css("font-weight","bold");
    	$(".sub-menu a").css("color","#808080");
    	$(".sub-menu a").css("background-color","#fff");
    	$(".sub-menu a").css("font-weight","400");
        $(this).css("color","#008040");
        $(this).css("font-weight","bold");
        $(this).css("background-color","#fff");
    });
    
    $("#myBox>a").on("click",function(){
    	$("#myBox>a").css("color","#fff");
    	$("#myBox>a").css("background-color","#454545");
    	$("#myBox>a").css("font-weight","bold");
    });
    
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>