<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="addAddressModal">
            <h2>배송지 추가</h2>
            <button type="button" class="closeX" onclick="closeAddressModal()">  </button>
            <table>
                <tr>
                    <th><span>주소</span></th>
                    <td class="sa-found-td">
                        <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
                        <input type="hidden" name="zipCode" id="postcode" readonly>
                        <input type="hidden" name="addressOld" id="addressOld" readonly>
                        <input type="text" name="addressNew" id="address" required readonly>
                        <button type="button" class="btn sa-found" onclick="searchAddr()">검색</button>
                    </td>
                </tr>
                <tr>
                    <th><span>상세주소</span></th>
                    <td><input type="text" name="addressDetail" id="detailAddress" required></td>
                </tr>
                <tr>
                    <th><span>배송지 명</span></th>
                    <td><input type="text" name="addressName" required></td>
                </tr>
                <tr>
                    <th><span>배송자 명</span></th>
                    <td><input type="text" name="addressReceiverName" required></td>
                </tr>
                <tr>
                    <th><span>전화번호</span></th>
                    <td>
                        <input type="text" name="addressPhone0" required> - 
                        <input type="text" name="addressPhone1" required> - 
                        <input type="text" name="addressPhone2" required>
                    </td>
                </tr>
            </table>
            <div class="submit-btn-address-add">
                <button type="button" onclick="closeAddressModal()">취소</button>
                <button type="button" onclick="addressAdd()">배송지 등록</button>
            </div>
        </div>
        <!-- 배송정보 -->
        <form action="/order.do" method="POST" id="orderForm">
        <div class="info shpping-info">
            <h2>배송 정보</h2>
            <input type="hidden" name="receiver" value="">
            <input type="hidden" name="receiverPhone" value="">
            <input type="hidden" name="receiveAddressOld" value="">
            <input type="hidden" name="receiveAddressNew" value="">
            <input type="hidden" name="receiveAddressDetail" value="">
            <input type="hidden" name="receiveZipCode" value="">
            <table>
                <tr>
                    <th>배송지</th>
                    <td>
                        <div class="sa-selector">
                            <c:forEach items="${sas}" var="address">
                                <input type="radio" name="saNo" value="${address.saNo}" id="${address.saNo}">
                                <label for="${address.saNo}" onclick="selectSa('${address.saNo}')">${address.addressName}</label>
                            </c:forEach>
                            <button type="button" class="addAddress" onclick="addAddressModalBtn()">주소추가</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>이름 / 연락처</th>
                    <td class="name-phone">
                        <div class="ad-name">
                            <input type="text" name="addressReceiverName" id="saARN" value="">
                        </div>
                        <div class="phone-number">
                            <input type="text" name="phone0" maxlength="3" value="" required> - 
                            <input type="text" name="phone1" maxlength="4" value="" required> - 
                            <input type="text" name="phone2" maxlength="4" value="" required>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input type="hidden" name="addressDetail" id="saNew" value="">
                        <span id="saNewView"></span>
                    </td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td>
                        <input type="hidden" name="addressDetail" id="saDetail">
                        <span id="saDetailView"></span>
                    </td>
                </tr>
                <tr>
                    <th>배송 요청사항</th>
                    <td>
                        <select name="shipRequest" id="ship-request-select">
                            <option value="배송 시 요청사항을 선택해주세요">배송 시 요청사항을 선택해주세요.</option>
                            <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요.</option>
                            <option value="부재 시 택배함에 넣어주세요">부재 시 택배함에 넣어주세요.</option>
                            <option value="부재 시 집 앞에 놔 주세요">부재 시 집 앞에 놔 주세요.</option>
                            <option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다.</option>
                            <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요">파손의 위험이 있는 상품입니다. 배송 시 주의해 주세요.</option>
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
                    <input type="hidden" name="posNo" value="${pos.posNo}">
                    <tr>
                        <td>
                            <div class="product-info-row clearfix">
                                <img src="/resources/upload/gift/${product.mainImage.ppPath}" alt="">
                                <div>
                                    <p><span>[${product.productCompany}]</span><a href="/giftDetail.do?productNo=${pos.productNo}" class="product-names">${product.productName}</a></p>
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
                            <input type="radio" name="payMethod" id="kakaoPay" value="kakaoPay" class="payment-method-select-radio" checked><label for="kakaoPay">카카오페이</label>
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
                <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
                <input type="hidden" name="orderPrice" value="" id="orderPrice">
                <input type="hidden" name="payData" value="" id="successPay">
            </c:if>
        </div>
        <button type="button" class="my-btn my-blue" id="takeOrder" onclick="takeOrderBtn()"><span id="totalPriceView"></span>원 결제하기</button>
    </div>
    </form>
</div>

<button type="button" value="" id="successPayButton" onclick="successPayed()">결제성공!</button>
<button type="button" id="cancelPay" onclick="cancelPayed()">결제취소</button>
<button type="button" id="failPay" onclick="failPayed()">결제실패</button>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    const selectSa = saNo => {
        $.ajax({
            url : "/getOneAddress.do",
            type : "GET",
            data : { saNo : saNo },
            success : data => {
                const saARN = document.querySelector('#saARN')
                const saNew = document.querySelector('#saNew')
                const saNewView = document.querySelector('#saNewView')
                const saDetail = document.querySelector('#saDetail')
                const saDetailView = document.querySelector('#saDetailView')


                const receiver = document.querySelector('input[name=receiver]')
                const receiverPhone = document.querySelector('input[name=receiverPhone]')
                const receiveAddressOld = document.querySelector('input[name=receiveAddressOld]')
                const receiveAddressNew = document.querySelector('input[name=receiveAddressNew]')
                const receiveAddressDetail = document.querySelector('input[name=receiveAddressDetail]')
                const receiveZipCode = document.querySelector('input[name=receiveZipCode]')
                const phone0 = document.querySelector('input[name=phone0]')
                const phone1 = document.querySelector('input[name=phone1]')
                const phone2 = document.querySelector('input[name=phone2]')

                const phoneNum = data.addressPhone;
                if(phoneNum.substring(12,13) == ' ') {
                    phone0.value =  phoneNum.substring(0, 3);
                    phone1.value =  phoneNum.substring(3, 7);
                    phone2.value =  phoneNum.substring(7, 11);
                } else {
                    phone0.value =  phoneNum.substring(0, 3);
                    phone1.value =  phoneNum.substring(4, 8);
                    phone2.value =  phoneNum.substring(9, 13);
                }

                saARN.value = data.addressReceiverName
                saNew.value = data.addressNew
                saNewView.innerText = data.addressNew
                saDetail.value = data.addressDetail
                saDetailView.innerText = data.addressDetail

                receiver.value = data.addressReceiverName
                receiverPhone.value = data.addressPhone
                receiveAddressOld.value = data.addressOld
                receiveAddressNew.value = data.addressNew
                receiveAddressDetail.value = data.addressDetail
                receiveZipCode.value = data.zipCode
                
            }
        })
    }
    const addAddressModal = document.querySelector('.addAddressModal')
    const addAddressModalBtn = () => {
        addAddressModal.style.display = 'block'
    }
    const closeAddressModal = () => {
        addAddressModal.style.display = 'none'
        document.querySelector('input[name=memberNo]').value = ''
        document.querySelector('input[name=zipCode]').value = ''
        document.querySelector('input[name=addressOld]').value = ''
        document.querySelector('input[name=addressNew]').value = ''
        document.querySelector('input[name=addressDetail]').value = ''
        document.querySelector('input[name=addressName]').value = ''
        document.querySelector('input[name=addressReceiverName]').value = ''
        document.querySelector('input[name=addressPhone0]').value = ''
        document.querySelector('input[name=addressPhone1]').value = ''
        document.querySelector('input[name=addressPhone2]').value = ''
    }
    // 주소찾기
    function searchAddr() {
		new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data)
	        	$("#postcode").val(data.zonecode);
	        	$("#address").val(data.address);
                $('#addressOld').val(data.jibunAddress)
	        	$("#detailAddress").focus();
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        }
	    }).open();
	}
    const addressAdd = () => {
        const memberNo = document.querySelector('input[name=memberNo]').value
        const zipCode = document.querySelector('input[name=zipCode]').value
        const addressOld = document.querySelector('input[name=addressOld]').value
        const addressNew = document.querySelector('input[name=addressNew]').value
        const addressDetail = document.querySelector('input[name=addressDetail]').value
        const addressName = document.querySelector('input[name=addressName]').value
        const addressReceiverName = document.querySelector('input[name=addressReceiverName]').value
        const addressPhone0 = document.querySelector('input[name=addressPhone0]').value
        const addressPhone1 = document.querySelector('input[name=addressPhone1]').value
        const addressPhone2 = document.querySelector('input[name=addressPhone2]').value
        const addressPhone = addressPhone0 + '-' + addressPhone1 + '-' + addressPhone2
        $.ajax({
            url : "/addAddress.do",
            type : "POST",
            data : {memberNo : memberNo, zipCode : zipCode, addressOld : addressOld, addressNew : addressNew, addressDetail : addressDetail, addressName : addressName, addressReceiverName : addressReceiverName, addressPhone : addressPhone},
            success : data => {
                console.log(data)
                if(data != '0') {
                    closeAddressModal()
                    location.reload()
                } else {
                    alert('배송지 등록 실패')
                }
            }
        })
    }
    const memberId = document.querySelector('input[name=memberId]').value
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
    // 결제
    const itemName = document.querySelector('.product-names').innerText
    const quantity = '${posList.size()}'
    const takeOrderBtn = () => {
        if(!allAgree.checked) alert('개인정보 수집/이용 및 결제대행동의가 필요합니다') 
        else if(document.querySelector('input[name=receiver]').value == '') alert('배송지를 선택해 주세요') 
        else {
            console.log('kakaoPay do')
            console.log(quantity)
            console.log( $('[name=shipRequest]').val())
            $.ajax({
                url : '/giftKakaoPay.do',
                type : 'POST',
                data : { memberId : memberId ,orderPrice : orderPrice.value ,productName : "${product.productName}", shipRequest : $('[name=shipRequest]').val(), itemName : itemName, quantity : quantity},
                success : data => {
                    //location.href = data.next_redirect_pc_url
                    window.open(data.next_redirect_pc_url ,"movie island gift shop","left=700px,top=300px,width=400px,height=700px,menubar=no,status=no,scrollbars=yes")
                },
                error : data => {
                    alert('error')
                    console.log(data)
                }
            })
        } 
    }
    //결제완료감지기
    const orderForm = document.querySelector('#orderForm')
    const successPay = document.querySelector('#successPay')
    const successPayed = () => {
        console.log('pay success')
        orderForm.submit()
    }
    const cancelPayed = () => {
        alert('결제가 취소되었습니다')
    }
    const failPayed = () => {
        alert('결제에 실패했습니다.')
    }
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>