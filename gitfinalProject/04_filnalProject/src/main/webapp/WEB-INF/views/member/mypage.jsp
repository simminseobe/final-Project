<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/mypage.css">
<script src="/resource/js/jquery-3.6.3.min.js"></script>
<script>

</script>
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
                    <li><a href="/myProfile.do">• 개인정보 수정</a></li>
                    <li><a href="#">• 선택정보 수정</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <script>
    $(".sub-menu").prev().append("<span class='more'>+</span>");
    $(".more").on("click",function(event){
        $(this).parent().next().slideToggle();
        $(this).toggleClass("active");
        event.stopPropagation();
    });

    $(".more").parent().on("click",function(){
        $(this).children().last().click();
    });
    </script>
</body>
</html>