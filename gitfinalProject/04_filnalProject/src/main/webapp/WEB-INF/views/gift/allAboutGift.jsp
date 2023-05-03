<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/giftNavi.jsp" %>
<div class="main_content clearfix">
    <h1 class="gift-title">기프트 스토어</h1>    
    <ul class="store-nav">
        <li><input type="radio" id="store_nav_ct1" name="store_nav_ct" checked><label for="store_nav_ct1">새로운 상품</label></li>
        <li><input type="radio" id="store_nav_ct2" name="store_nav_ct"><label for="store_nav_ct2">기프트 카드</label></li>
        <li><input type="radio" id="store_nav_ct3" name="store_nav_ct"><label for="store_nav_ct3">매가 티켓</label></li>
        <li><input type="radio" id="store_nav_ct4" name="store_nav_ct"><label for="store_nav_ct4">팝콘/음료/굿즈</label></li>
        <li><input type="radio" id="store_nav_ct5" name="store_nav_ct"><label for="store_nav_ct5">포인트몰</label></li>
    </ul>
    <div class="store-wellcome">
        <div class="text-info">
            <h2 class="color-mt">뜨거운 코트를 가르며 골대를 향해!</h2>
            <h2 class="color-mb">슬램덩크!</h2>
            <p>한정 판매!</p>
            <p>슬램덩크 유니폼 패키지</p>
            <p class="buy-event-item"><a href="/giftDetail.do?productNo=83">구매하러 가기</a></p>
        </div>
        <div class="pic-info"><img src="/resources/images/gift/gift-pic-info01.jpg" alt=""></div>
    </div>
    <!-- 스토어 내부 컨텐츠 영역 -->
    <div class="items-newitems">
        <div class="gift-ct-nav">
            <h2 class="color-mb ct-title">새로운상품</h2>
            <button onclick="giftMore()" class="gift-more">더보기 ></button>
        </div>
        <div class="gift-items items">
            <c:forEach items="${pList}" var="p" begin="0" end="9000" step="1">
            <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
            <input type="hidden" name="productNo" value="${p.productNo}">
            <a href="javascript:void(0);" onclick="movePage('${p.productNo}')">
                <div class="item">
                    <div class="item-img"><img src="/resources/upload/gift/${p.mainImage.ppPath}" alt=""></div>
                    <div class="item-info">
                        <div>
                            <p class="item-title">${p.productName}</p>
                            <p class="item-content">${p.simpleInfo}</p>
                        </div>
                        <span class="item-price"><span class="color-mb">${p.productPrice}</span>원</span>
                        <div class="like-count-view">
                            <span class="lcv">${p.productLikeCount}</span>
                            <c:if test="${p.productLikeStatus}">
                                <button type="button" class="likeProductBtn"><span class="material-symbols-outlined likeProduct like-on"> favorite </span></button>
                            </c:if>
                            <c:if test="${!p.productLikeStatus}">
                                <button type="button" class="likeProductBtn"><span class="material-symbols-outlined likeProduct"> favorite </span></button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
        </div>
    </div>
    <section class="event-banner">
        <h2>슈퍼 마리오 브라더스 영화 개봉 기념 행사</h2>
        <img src="/resources/images/gift/mario_event.jpeg" alt="">
    </section>
</div> 
<%@include file="/WEB-INF/views/common/footer.jsp" %>