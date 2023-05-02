<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/giftNavi.jsp" %>
<div class="gift-wrap">
    <div class="pay-result-main">
        <span class="order-number">주문번호 : <a href="#">${data.tid}</a></span>
        <h1>주문과 결제가 정상적으로 완료되었습니다.</h1>
        <p>업체(브랜드)의 주문 확인 후 발송됩니다.</p>
    </div>
    <div class="complete-btns">
        <a href="#">결제 정보 확인</a>
        <a href="/">홈으로 가기</a>
    </div>
</div>
<script>
    
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>