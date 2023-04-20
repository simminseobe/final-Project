<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp" />

<div id="layoutSidenav">
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp" />
<div id="admin-main-content">
    <h1>등록된 상품 리스트</h1>
    <form action="#">
        <div class="input-form">
            <table>
                <tr>
                    <th>select</th>
                    <th>main img</th>
                    <th>name</th>
                    <th>price</th>
                    <th>company</th>
                    <th>shipping</th>
                    <th>status</th>
                    <th>event</th>
                </tr>
                <c:forEach items="${pList}" var="p">
                    <tr>
                        <th><input type="checkbox"></th>
                        <th><div class="admin-list-main-img"><img src="/resources/upload/gift/${p.mainImage.ppPath}" alt=""></div></th>
                        <td><a href="/adminGiftDetail.do?productNo=${p.productNo}">${p.productName}</a></td>
                        <th>${p.productPrice}</th>
                        <th>${p.productCompany}</th>
                        <th>
                        <c:choose>
                            <c:when test="${p.shipping == 0}">무료배송</c:when>
                            <c:otherwise>${p.shipping}</c:otherwise>
                        </c:choose>
                        </th>
                        <th>
                        <c:choose>
                            <c:when test="${p.productStatus == 1}">판매중</c:when>
                            <c:when test="${p.productStatus == 2}">상품준비중</c:when>
                            <c:when test="${p.productStatus == 3}">품절</c:when>
                            <c:when test="${p.productStatus == 4}">판매중지</c:when>
                        </c:choose>
                        </th>
                        <th><button class="my-btn my-blue" type="button" onclick="">상품행사추가</button></th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </form>
</div>
</div>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp" />