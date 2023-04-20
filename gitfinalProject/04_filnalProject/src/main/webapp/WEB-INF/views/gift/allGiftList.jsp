<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<div class="main_content">
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
            <c:forEach items="${pList}" var="p">
            <a href="/giftDetail.do?productNo=${p.productNo}">
                <div class="item">
                    <div class="item-img"><img src="/resources/upload/gift/${p.mainImage.ppPath}" alt=""></div>
                    <div class="item-info">
                        <div>
                            <p class="item-title">${p.productName}</p>
                            <p class="item-content">${p.simpleInfo}</p>
                        </div>
                        <span class="item-price"><span class="color-mb">${p.productPrice}</span>원</span>
                    </div>
                </div>
            </a>
        </c:forEach>
        </div>
    </div>
<!-- 
    <div class="items-newitems">
        <div class="gift-ct-nav">
            <h2 class="color-mb ct-title">새로운상품</h2>
            <button onclick="giftMore()" class="gift-more">더보기 ></button>
        </div>
        <div class="gift-items items">
            <div class="item">
                <div class="item-img"><img src="/resources/images/gift/gift-slam-pack.jpg" alt=""></div>
                <div class="item-info">
                    <div>
                        <p class="item-title">슬램덩크 ...</p>
                        <p class="item-content">슬램덩크 정대만 유니폼 패키지</p>
                    </div>
                    <span class="item-price"><span class="color-mb">20,000</span>원</span>
                </div>
            </div>
        </div>
    </div>
    <div class="items-giftCard">
        <div class="gift-ct-nav">
            <h2 class="color-mb ct-title">기프트카드</h2>
            <button onclick="giftMore()" class="gift-more">더보기 ></button>
        </div>
        <div class="gift-items items">
            <div class="item">
                <div class="item-img"><img src="/resources/images/gift/gift-slam-pack.jpg" alt=""></div>
                <div class="item-info">
                    <div>
                        <p class="item-title">기프트카드 ...</p>
                        <p class="item-content">아무튼 이거 기프트카드임 사진 수정귀찮아</p>
                    </div>
                    <span class="item-price"><span class="color-mb">19,000</span>원</span>
                </div>
            </div>
        </div>
    </div> 
-->



</div> 
<script>


</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>