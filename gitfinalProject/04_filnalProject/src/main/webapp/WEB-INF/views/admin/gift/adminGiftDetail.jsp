<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp" />

<div id="layoutSidenav">
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp" />
<div id="admin-main-content">
    <div class="input-form">
        <table>
            <tr>
                <th>main img</th>
                <th>name</th>
                <th>price</th>
                <th>company</th>
                <th>shipping</th>
                <th>status</th>
                <th>event</th>
                <th>remove</th>
            </tr>
            <tr>
                <th><div class="admin-list-main-img"><img src="/resources/upload/gift/${p.images[0].ppPath}" alt=""></div></th>
                <td><input type="text" value="${p.productName}"></td>
                <th>${p.productPrice}</th>
                <th>${p.productCompany}</th>
                <th>
                <c:choose>
                    <c:when test="${p.shipping == 0}">무료배송</c:when>
                    <c:otherwise>${p.shipping}</c:otherwise>
                </c:choose>
                </th>
                <th>
                    <select name="productStatus" id="productStatusSet">
                    <c:choose>
                        <c:when test="${p.productStatus == 1}">
                            <option value="1" selected>판매중</option>
                            <option value="2">상품준비중</option>
                            <option value="3">품절</option>
                            <option value="4">판매중지</option>
                        </c:when>
                        <c:when test="${p.productStatus == 2}">
                            <option value="1">판매중</option>
                            <option value="2" selected>상품준비중</option>
                            <option value="3">품절</option>
                            <option value="4">판매중지</option>
                        </c:when>
                        <c:when test="${p.productStatus == 3}">
                            <option value="1">판매중</option>
                            <option value="2">상품준비중</option>
                            <option value="3" selected>품절</option>
                            <option value="4">판매중지</option>
                        </c:when>
                        <c:when test="${p.productStatus == 4}">
                            <option value="1">판매중</option>
                            <option value="2">상품준비중</option>
                            <option value="3">품절</option>
                            <option value="4" selected>판매중지</option>
                        </c:when>
                    </c:choose>
                    </select>
                </th>
                <th><button class="my-btn my-blue" type="button" onclick="">상품행사추가</button></th>
                <th><button class="my-btn my-blue" type="button" onclick="removeGift('${p.productNo}')">상품삭제</button></th>
            </tr>
        </table>
    </div>
</div>
</div>

<script>
    const removeGift = productNo => {
        if(confirm('상품을 삭제하겠습니까?)')) {
            location.href = '/deleteProduct.do?productNo=' + productNo
        }
    }

</script>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp" />