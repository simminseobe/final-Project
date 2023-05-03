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
            <div id="selected-image"><img src="/resources/upload/gift/${p.images[0].ppPath}" alt="" id="main-img-view"></div>
            <div id="preview" class="regular slider">
                <c:forEach items="${p.images}" var="image">
                    <div class="prev-img-container">
                        <img src="/resources/upload/gift/${image.ppPath}" alt="" class="imgs">
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="right-info">
        <form action="/takeOrderSheet.do" id="orderT" type="POST">
        <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
        <input type="hidden" name="productNo" value="${p.productNo}">
            <div class="productInfo">
                <h2>product Info <span> 상품정보</span></h2>
                <table>
                    <tr>
                        <th>제조사</th>
                        <td>${p.productCompany}</td>
                    </tr>
                    <tr>
                        <th>누적판매</th>
                        <td>${p.totalOrder}</td>
                    </tr>
                    <tr>
                        <th>좋아요</th>
                        <td class="lcv">${p.productLikeCount}</td>
                    </tr>
                    <!-- 
                    <tr>
                        <th>구매후기</th>
                        <td>${p.productLikeCount}</td>
                    </tr>
                     -->
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
                            <select name="#" id="productOption">
                                <option value="#" selected>- 옵션을 선택해 주세요 - [필수] </option>
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
                </table>
                <div class="product-btn-box">
                    <button type="button" onclick="nowBuyBtn()">바로구매</button>
                    <c:if test="${p.productLikeStatus}">
                        <button type="button" onclick="likeProduct()"><span class="material-symbols-outlined like-on" id="likeProduct"> favorite </span></button>
                    </c:if>
                    <c:if test="${!p.productLikeStatus}">
                        <button type="button" onclick="likeProduct()"><span class="material-symbols-outlined" id="likeProduct"> favorite </span></button>
                    </c:if>
                    <button type="button"><span class="material-symbols-outlined" onclick="cartInsert()">shopping_cart</span></button>
                </div>
            </div>
        </form>
        </div>
    </div>
    <div class="main-content">
        <c:forEach items="${p.images}" var="image">
            <div class="main-img-container">
                <img src="/resources/upload/gift/${image.ppPath}" alt="">
            </div>
        </c:forEach>
    </div>
</div>
<script>
    const imgMain = document.querySelector('#main-img-view')
    const imgs = document.querySelectorAll('.imgs')
    imgs[0].classList.add('selectImg')
    imgs.forEach(img => {
        img.addEventListener('click', e => {
            imgs.forEach(img => {img.classList.remove('selectImg')})
            img.classList.add('selectImg')
            imgMain.src =  e.target.src
        })
    })
    $(".regular").slick({
        dots: true,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3
    });

    // cart send request
    const form = document.querySelector('#orderT')
    const cartInsert = () => {
        if('${sessionScope.m.memberNo}' == '') {
           alert('로그인 후 장바구니 추가 가능합니다')
        } else if($('.selected-options').length == 0) {
            alert('옵션을 선택해 주세요')
        } else {
            fetch(form.action, {
                method: "POST",
                body: new FormData(form)
            }).then(response => {
                if (response.ok) {
                // 성공적으로 처리된 경우
                    alert('장바구니에 추가되었습니다')
                } else {
                // 처리 중에 오류가 발생한 경우
                console.error('Error adding option.')
                alert('에러발생')
                }
            })
        }
    }
    


    const optionTbl = document.querySelector('#product-option')
    const optionSelectTr = document.querySelector('#option-select-tr')
    const optionSelect = document.querySelector('#productOption')
    const totalPriceView = document.querySelector('#totalPriceView')

    optionSelect.addEventListener('change', e => {
        const isTr = document.querySelectorAll(".selected-options")
        let isDuplicate = false 
        if(isTr.length != 0) {
            isTr.forEach(element => {
                //console.log("선택한 항목 값 : "+e.target.value + "기존에 올라와 있는 tr 값 : " + element.dataset.id)
                if(element.dataset.id == e.target.value) {
                    alert("이미 선택된 항목입니다")
                    isDuplicate = true
                    return
                }
            });
        }
        if(isDuplicate) {
            optionSelect.selectedIndex = 0
            return
        }
        // 
        const tr = document.createElement("tr");
        tr.className = "selected-options";
        tr.dataset.id = e.target.value
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
        input.name = "poNo"
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
            totalPriceView.innerText = Number(totalPriceView.innerText) + selectPrice
            quantityInput.value++
        }
        const decreaseBtn = document.createElement("button");
        decreaseBtn.type = "button";
        decreaseBtn.id = "decrease";
        decreaseBtn.onclick = () => {
            if(quantityInput.value > 1) {
                totalPriceView.innerText = Number(totalPriceView.innerText) - selectPrice
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
        const selectPrice = Number(e.target.options[e.target.selectedIndex].dataset.price)
        priceSpan.appendChild(document.createTextNode(selectPrice + '원'));
        priceDiv.appendChild(priceSpan);
        // 삭제 버튼
        const deleteBtn = document.createElement("button");
        deleteBtn.type = "button";
        deleteBtn.onclick = () => {
            //버튼 삭제시 총금액 줄여버리기
            totalPriceView.innerText = Number(totalPriceView.innerText) - (selectPrice * quantityInput.value)
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
        //토탈금액 증가
        totalPriceView.innerText = Number(totalPriceView.innerText) + Number(selectPrice)
        //항상 기본 0번 option을 select해놓은 상태로 만듬
        optionSelect.selectedIndex = 0

    })

    const nowBuyBtn = () => {
        console.log('${sessionScope.m.memberNo}')
        if('${sessionScope.m.memberNo}' == '') {
            alert('로그인 후 구매 가능합니다')
            location.href = '/login.do'
        } else {
            if($('.selected-options').length == 0) {
                alert('옵션을 선택해 주세요')
            } else {
                document.querySelector('#orderT').submit()
            }
        }
    }

    const likeProduct = () => {
        const memberNo = document.querySelector('input[name=memberNo]').value
        const productNo = document.querySelector('input[name=productNo]').value
        const isProductLike = false
        if(memberNo == '') {
            alert('상품 좋아요는 로그인 후 가능합니다.')
        } else {
            $.ajax({
                url : "/selectOneProductLike.do",
                type : "get",
                data : {productNo : productNo, memberNo : memberNo},
                success : data => {
                    if(data == "false") {
                        $.ajax({
                            url : "/likeProduct.do",
                            type : "get",
                            data : {productNo : productNo, memberNo : memberNo},
                            success : data => {
                                document.querySelector('.lcv').innerText ++
                                document.getElementById('likeProduct').classList.add('like-on')
                            }
                        })
                    } else {
                        $.ajax({
                            url : "/disLikeProduct.do",
                            type : "get",
                            data : {productNo : productNo, memberNo : memberNo},
                            success : data => {
                                document.querySelector('.lcv').innerText --
                                document.getElementById('likeProduct').classList.remove('like-on')
                            }
                        })
                    }
                }
            })
        }
    }
</script>

<%@include file="/WEB-INF/views/common/footer.jsp" %>