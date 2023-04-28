<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/giftNavi.jsp" %>
<div class="gift-wrap">
    <div class="order">
    <form action="#">
        <div class="top-area">
            <h1>Order / Payment</h1>
            <p>장바구니 > <span>주문서</span> > 주문완료</p>
        </div>
        <!-- 배송정보 -->
        <div class="info shpping-info">
            <h2>배송 정보</h2>
            <table>
                <tr>
                    <th>배송지</th>
                    <td>
                        <!-- <c:forEach items=""></c:forEach> -->
                    </td>
                </tr>
                <tr>
                    <th>이름 / 연락처</th>
                    <td></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td></td>
                </tr>
                <tr>
                    <th>배송 요청사항</th>
                    <td>
                        <select name="shipRequest" id="ship-request-select">
                            <option value="배송 시 요청사항을 선택해주세요.">배송 시 요청사항을 선택해주세요.</option>
                            <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
                            <option value="부재 시 택배함에 넣어주세요.">부재 시 택배함에 넣어주세요.</option>
                            <option value="부재 시 집 앞에 놔 주세요.">부재 시 집 앞에 놔 주세요.</option>
                            <option value="배송 전 연락 바랍니다.">배송 전 연락 바랍니다.</option>
                            <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요.">파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요.</option>
                            <option value="#" id="test">직접입력</option>
                        </select>
                        <input type="hidden" name="#" id="ship-request-input">
                    </td>
                </tr>
            </table>
        </div>
        <!-- 상품정보 -->
        <div class="info product-info">
            <h2>상품 정보</h2>
            <table>
                <tr>
                    <th>상품정보</th>
                    <th>판매가</th>
                    <th>수량</th>
                    <th>할인</th>
                    <th>배송구분</th>
                    <th>배송비</th>
                    <th>합계</th>
                </tr>
                <c:forEach items="${posList}" var="pos" varStatus="i">
                    <tr>
                        <td>
                            <div class="product-info-row clearfix">
                                <img src="/resources/upload/gift/${product.mainImage.ppPath}" alt="">
                                <div>
                                    <p><span>[${product.productCompany}]</span><a href="/giftDetail.do?productNo=${pos.productNo}">${product.productName}</a></p>
                                    <div class="product-option-info">
                                        <p>옵션 : ${product.productOptions[i.index].poName}</p>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>${product.productOptions[i.index].poPrice}</td>
                        <td>${pos.orderCount} EA</td>
                        <td> - </td>
                        <td>
                            <c:if test="${product.shipping == 0}">무료배송</c:if>
                            <c:if test="${product.shipping != 0}">일반배송</c:if>
                        </td>
                        <td>${product.shipping }</td>
                        <td><span class="one-total-price">${product.productOptions[i.index].poPrice * pos.orderCount}</span></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <!-- 배송비안내 -->
        <div class="shpping-info2">
            <ul>
                <li>· 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
                <li>· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.</li>
                <li>· 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</li>
            </ul>
        </div>
        
        <div class="info price-info">
            <h2>결제</h2>
            <table>
                <tr>
                    <th>상품금액</th>
                    <td>${product}</td>
                </tr>
            </table>
        </div>
        
        <div class="info payment-info">
            <h2></h2>
        </div>

    </form>
    </div>
</div>
<script>
    const shipRequestSelect = document.querySelector('#ship-request-select')
    const shipRequestInput = document.querySelector('#ship-request-input')
    shipRequestSelect.addEventListener('change', e => {
        console.log()
        if(e.target[e.target.selectedIndex].value != '#') {
            shipRequestSelect.name = 'shipRequest'
            shipRequestInput.type = 'hidden'
            shipRequestInput.name = '#'

        } else {
            shipRequestInput.type = 'text'
            shipRequestInput.name = 'shipRequest'
            shipRequestSelect.name = '#'
        }

    })
    const onePrices = document.querySelectorAll('.one-total-price')
    onePrices.forEach(price => {

    });
    for(const key in onePrices) {
        
    }

</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>