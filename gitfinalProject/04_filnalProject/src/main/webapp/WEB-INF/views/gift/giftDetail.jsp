<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/giftNavi.jsp" %>
<div class="gift-wrap">
    <div class="head-title">
        <h1>${p.productName}</h1>
        <h2>${p.simpleInfo}</h2>
    </div>
    <div class="product-control">
        <div class="images">
            <div id="selectedImage"><img src="/resources/upload/gift/${p.images[0].ppPath}" alt=""></div>
            <div id="preview">
                <c:forEach items="${p.images}" var="image">
                    <img src="/resources/upload/gift/${image.ppPath}" alt="">
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>