<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
	*{
		margin: 0;
    	padding: 0;
    	outline: none;
	}
	tbody{
		margin: 0;
	}
	.content-wrap{
		background-color : #010101;
		width : 900px;
		height : 300px;
	}
	.menubar{
		width: 400px;
	}
</style>
<table>
<td>
<div class=".menubar">
<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
</div>
</td>
<td>
<div class="content-wrap">
	<font color="white">왜안돼</font>
</div>
</td>
</table>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
                    <li><a href="#">• 개인정보 수정</a></li>
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

