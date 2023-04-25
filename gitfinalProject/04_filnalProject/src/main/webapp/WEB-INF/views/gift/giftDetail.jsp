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
            <div id="selected-image"><img src="/resources/upload/gift/${p.images[0].ppPath}" alt=""></div>
            <div id="preview">
                <c:forEach items="${p.images}" var="image">
                    <div class="prev-img-container">
                        <img src="/resources/upload/gift/${image.ppPath}" alt="">
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="right-info">
        <form action="#">
            <div class="productInfo">
                <h2>product Info <span> 상품정보</span></h2>
                <table>
                    <tr>
                        <th>제조사</th>
                        <td>${p.productCompany}</td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td>${p.productLikeCount}</td>
                    </tr>
                    <tr>
                        <th>누적판매</th>
                        <td>${p.productLikeCount}</td>
                    </tr>
                    <tr>
                        <th>좋아요</th>
                        <td>${p.productLikeCount}</td>
                    </tr>
                    <tr>
                        <th>구매후기</th>
                        <td>${p.productLikeCount}</td>
                    </tr>
                </table>
                <c:forEach items="${p.categorys}" var="cateogry">
                    <a href="#" class="my-btn my-blue cagegory-anc">${category.pcCategory}</a>
                </c:forEach>
            </div>
            <div class="deliveryInfo">
                <h2>Delivery Info <span>배송정보</span></h2>
                <table>
                    <tr>
                        <th>출고정보</th>
                        <td>결제 3일 이내 출고</td>
                    </tr>
                    <tr>
                        <th>출고정보</th>
                        <td>결제 3일 이내 출고</td>
                    </tr>
                    <tr>
                        <th>배송 정보</th>
                        <td> 국내 배송 / 입점사 배송 / 롯데택배</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="deliveryNotice">0/00(-)도착 예정</div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="priceInfo">
                <h2>Price Info <span>가격정보</span></h2>
                <table class="product-option">
                    <tr>
                        <th>상품금액</th>
                        <td>${p.productPrice}</td>
                    </tr>
                    <tr>
                        <th>배송비</th>
                        <td>
                            <c:if test="${p.shipping == '0'}">무료배송</c:if>
                            <c:if test="${p.shipping != '0'}">${p.shipping}</c:if>
                        </td>
                    </tr>
                    <tr id="option-select-tr">
                        <td colspan="2">
                            <select name="productOption" id="productOption">
                                <option value="##" selected>- 옵션을 선택해 주세요 - [필수] </option>
                                <c:forEach items="${p.productOptions}" var="option">
                                    <c:if test="${p.productOptions == '[]'}">
                                        <option value="null" >${p.productName}</option>
                                    </c:if>
                                        <option value="${option.poNo}" data-name="${option.poName}" data-price="${option.poPrice}" >${option.poName} --- [${option.poPrice}]원</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr id="totalPriceViewTr">
                        <th colspan="2" style="width: 100%;"><span>총 상품 금액</span> <span id="totalPriceView" style="margin-left: 100px;">0</span> 원</th>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <button type="button">바로구매</button>
                            <button type="button"><span class="material-symbols-outlined"> favorite </span></button>
                            <button type="button">장바구니 담기</button>
                        </th>
                    </tr>
                </table>
            </div>
        </form>
        </div>
    </div>
</div>
<script>
    const optionTbl = document.querySelector('#product-option')
    const optionSelectTr = document.querySelector('#option-select-tr')
    const optionSelect = document.querySelector('#productOption')
    const totalPriceView = document.querySelector('#totalPriceView')

    optionSelect.addEventListener('change', e => {
        // tr
        const tr = document.createElement("tr");
        tr.id = "selected-options";
        // th
        const th = document.createElement("th");
        th.colSpan = 2;
        // div
        const div = document.createElement("div");
        div.className = "selected-option";

        //option
        const optDiv = document.createElement("div");
        optDiv.className = "opt";
        const input = document.createElement("input");
        input.type = "hidden";
        input.value = e.target.value;
        optDiv.appendChild(input);
        optDiv.appendChild(document.createTextNode(e.target.options[e.target.selectedIndex].dataset.name));
        
        //amount
        const amountDiv = document.createElement("div");
        amountDiv.className = "amount";
        const quantityDiv = document.createElement("div");
        quantityDiv.className = "quantity";

        //quantity BTN
        const quantityInput = document.createElement("input");
        quantityInput.type = "text";
        quantityInput.id = "quantity";
        quantityInput.name = "orderCount";
        quantityInput.min = 1;
        quantityInput.max = 10;
        quantityInput.value = 1;
        quantityInput.readOnly = true;
        const increaseBtn = document.createElement("button");
        increaseBtn.type = "button";
        increaseBtn.id = "increase";
        increaseBtn.onclick = () => {
            quantityInput.value++
        }
        const decreaseBtn = document.createElement("button");
        decreaseBtn.type = "button";
        decreaseBtn.id = "decrease";
        decreaseBtn.onclick = () => {
            if(quantityInput.value > 1) {
                quantityInput.value--
            }
        }
        decreaseBtn.appendChild(document.createTextNode("-"));
        quantityDiv.appendChild(decreaseBtn);
        quantityDiv.appendChild(quantityInput);
        increaseBtn.appendChild(document.createTextNode("+"));
        quantityDiv.appendChild(increaseBtn);
        amountDiv.appendChild(quantityDiv);

        //price
        const priceDiv = document.createElement("div");
        priceDiv.className = "price";
        const priceSpan = document.createElement("span");
        priceSpan.appendChild(document.createTextNode(e.target.options[e.target.selectedIndex].dataset.price + '원'));
        priceDiv.appendChild(priceSpan);
        // 삭제 버튼
        const deleteBtn = document.createElement("button");
        deleteBtn.type = "button";
        deleteBtn.onclick = () => {
            tr.remove()
        }
        deleteBtn.appendChild(document.createTextNode("x"));
        priceDiv.appendChild(deleteBtn);
        

        div.appendChild(optDiv);
        div.appendChild(amountDiv);
        div.appendChild(priceDiv);
        th.appendChild(div);
        tr.appendChild(th);
        
        $('#totalPriceViewTr').before($(tr))

        //항상 기본 0번 option을 select해놓은 상태로 만듬
        optionSelect.selectedIndex = 0


    })
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>