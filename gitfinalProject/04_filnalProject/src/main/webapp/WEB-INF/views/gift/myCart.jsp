<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/giftNavi.jsp" %>
<div class="gift-wrap">
    <div class="order">
    <div class="top-area">
        <h1>Order / Payment</h1>
        <p>장바구니 > <span>주문서</span> > 주문완료</p>
    </div>
    <div class="info product-info">
        <h2>상품 정보</h2>
        <table>
            <tr>
                <th>선택</th>
                <th>상품정보</th>
                <th>판매가</th>
                <th>수량</th>
                <th>할인</th>
                <th>배송구분</th>
                <th>배송비</th>
                <th>합계</th>
                <th>삭제</th>
            </tr>
            <c:forEach items="${posList}" var="pos" varStatus="i">
                <input type="hidden" name="posNo" value="${pos.posNo}">
                <tr>
                    <td class="chkPos">
                        <input type="checkbox">
                    </td>
                    <td>
                        <div class="product-info-row clearfix">
                            <img src="/resources/upload/gift/${pos.product.mainImage.ppPath}" alt="">
                            <div>
                                <p><span>[${pos.product.productCompany}]</span><a href="/giftDetail.do?productNo=${pos.productNo}" class="product-names">${pos.product.productName}</a></p>
                                <div class="product-option-info">
                                    <p>옵션 : ${pos.productOption.poName}</p>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>${pos.productOption.poPrice}</td>
                    <td>${pos.orderCount} EA</td>
                    <td> - </td>
                    <td>
                        무료배송
                        <!-- <c:if test="${product.shipping == 0}">무료배송</c:if> -->
                        <!-- <c:if test="${product.shipping != 0}">일반배송</c:if> -->
                    </td>
                    <!-- <td>${product.shipping }</td> -->
                    <td>0</td>
                    <td><span class="one-total-price">${pos.productOption.poPrice * pos.orderCount}</span></td>
                    <td>
                        <button type="button" class="pos-del-btn" onclick="deletePos('${pos.posNo}')">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    </div>
</div>
<script>
const deletePos = posNo => {
    $.ajax({
        url : "/deletePos.do",
        type : 'get',
        data : { posNo : posNo },
        success : data => {
            if(data == 'success') {
                alert('삭제성공')
                location.reload()
            }
        }
    })
}

</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>