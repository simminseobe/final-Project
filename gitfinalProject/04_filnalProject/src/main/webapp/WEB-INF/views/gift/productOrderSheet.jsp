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
                            무료배송
                            <!-- <c:if test="${product.shipping == 0}">무료배송</c:if> -->
                            <!-- <c:if test="${product.shipping != 0}">일반배송</c:if> -->
                        </td>
                        <!-- <td>${product.shipping }</td> -->
                        <td>0</td>
                        <td><span class="one-total-price">${product.productOptions[i.index].poPrice * pos.orderCount}</span></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <!-- 배송비안내 -->
        <div class="shpping-info2">
            <ul>
                <li>· 무비아일랜드는 전 상품 무료배송입니다.</li>
                <li>· 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
                <li>· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.</li>
                <li>· 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</li>
            </ul>
        </div>
        
        <!--  -->
        <div class="info price-info">
            <h2>쿠폰 / 할인</h2>
            <table>
                <tr>
                    <th>상품금액</th>
                    <td><span id="all-total-price"></span></td>
                </tr>
                <tr>
                    <th>상품할인</th>
                    <td>- <span id="product-discount-view">0</span> 원</td>
                </tr>
                <tr>
                    <th>쿠폰 할인</th>
                    <td><button class="my-btn my-blue" type="button" onclick="couponSelect()"> 쿠폰조회/적용</button></td>
                </tr>
            </table>
        </div>
        <div class="info payment-info">
            <h2>결제 정보</h2>
            <table>
                <tr>
                    <th>결제수단</th>
                    <td class="pay-type-radio">
                        <ul>
                            <li><input type="radio" name="payType" id="miPay"><label for="miPay">무비아일랜드페이</label></li>
                            <li><input type="radio" name="payType" id="tPay"><label for="tPay">토스페이</label></li>
                            <li><input type="radio" name="payType" id="cPay" checked><label for="cPay">일반결제</label></li>
                        </ul>
                    </td>
                </tr>
                <tr class="pay-info">
                    <th>결제안내</th>
                    <td class="pay-type">
                        <button type="button"></button>
                        <ul class="info-ul">
                            <li>무비아일랜드의 독자적인 포인트로 결제합니다</li>
                        </ul>
                    </td>
                    <td class="pay-type">
                        <button type="button"></button>
                        <ul class="info-ul">
                            <li>토스는 간편하게 비밀번호만으로 결제 할 수 있는 빠르고 편리한 계좌 간편 결제 서비스 입니다.</li>
                            <li>지원 은행: 모든 은행 계좌 등록/결제 가능</li>
                            <li>결제 비밀번호 분실 시 재설정 후 이용 가능합니다.</li>
                        </ul>
                    </td>
                    <td class="pay-type selectPayment">
                        <div class="pay-method-select-btns">
                            <input type="radio" name="payMethod" id="kakaoPay" class="payment-method-select-radio" checked><label for="kakaoPay">카카오페이</label>
                            <input type="radio" name="payMethod" id="bank" class="payment-method-select-radio" ><label for="bank">계좌이체</label>
                        </div>
                        <ul class="info-ul">
                            <li>카카오페이는 카카오톡에서 카드를 등록, 간단하게 비밀번호만으로 결제할 수 있는 빠르고 편리한 모바일 결제 서비스입니다.</li>
                            <li>지원 카드 : 모든 카드 등록/결제 가능</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th>품절 시 환불 안내</th>
                    <td>
                        <ul class="info-ul">
                            <li>입점업체 배송은 낮은 확률로 상품이 품절일 가능성이 있습니다. 이에 품절 시 빠르게 환불 처리해드립니다.</li>
                            <li>현금 환불의 경우, 예금정보가 일치해야 환불 처리가 가능합니다. 은행명, 계좌번호, 예금주명을 정확히 기재 부탁드립니다.</li>
                            <li>환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다.</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th>주문자 동의</th>
                    <td>
                        <p class="agreeP"><input type="checkbox" name="agree" class="agree" id="agree"><label for="agree">전체 동의하기</label></p>
                        <p class="agreeP"><input type="checkbox" name="agree" class="agree" id="agree1"><label for="agree1">[필수] 개인정보 수집 및 이용 동의 </label></p>
                        <p class="agreeP"><input type="checkbox" name="agree" class="agree" id="agree2"><label for="agree2">[필수] 개인정보 제 3자 제공 동의</label></p>
                        <p class="agreeP"><input type="checkbox" name="agree" class="agree" id="agree3"><label for="agree3">[필수] 전자결제대행 이용 동의</label></p>
                    </td>
                </tr>
            </table>
            <c:if test="${sessionScope.m != null}">
                <input type="hidden" name="memberId" value="${sessionScope.m.memberId}">
                <input type="hidden" name="orderPrice" value="" id="orderPrice">
            </c:if>
        </div>
        <button type="button" class="my-btn my-blue" id="takeOrder" onclick="takeOrderBtn()"><span id="totalPriceView"></span>원 결제하기</button>
    </form>
    </div>
</div>
<script>
    const orderPrice = document.querySelector('#orderPrice')
    const totalPriceView = document.querySelector('#totalPriceView')
    // 배송 요청사항 직접입력
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
    // 총 금액 출력
    const onePrices = document.querySelectorAll('.one-total-price')
    const totalPrice = document.querySelector('#all-total-price')
    const priecArray =  new Array()
    onePrices.forEach(price => {
        priecArray.push(Number(price.innerText))
    })
    const allPrice = priecArray.reduce((sum, curr) => sum + curr)
    totalPrice.innerText = allPrice
    totalPriceView.innerText = allPrice
    orderPrice.value = allPrice

    //할인금액 표시
    const discountView = document.querySelector('#product-discount-view')

    // 쿠폰적용
    const couponSelect = () => {
        discountView.innerText = totalPrice.innerText - 100
        totalPrice.innerText = 100
        orderPrice.value = totalPrice.innerText
        totalPriceView.innerText = totalPrice.innerText

    }
    //결제 수단 선택
    const payRadios = document.querySelectorAll('input[name=payType]')

    //결제 방식 선택
    const payMethod = document.querySelectorAll('input[type=payMethod]')
    //동의
    const allAgree = document.querySelector('#agree')
    const agrees = document.querySelectorAll('.agree')
    allAgree.addEventListener('change', e => {
        agrees.forEach(agree => {
            agree.checked = e.target.checked
        })
    })
    agrees.forEach(ag => {
        ag.addEventListener('change', e => {
            allAgree.checked = true
            agrees.forEach(agree => {
                if(!agree.checked) {
                    allAgree.checked = false
                }
            })
        })
    })
    // 결제기능
    const takeOrderBtn = () => {
        console.log(allAgree.checked)
        if(!allAgree.checked) alert('개인정보 수집/이용 및 결제대행동의가 필요합니다') 
        else {
            $.ajax({
                url : '/giftKakaoPay.do',
                type : 'POST',
                success : data => {
                    alert('success')
                },
                error : data => {
                    alert('error')
                }
            })
        } 
    }
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>