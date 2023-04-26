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
        <form action="/insertOption.do" method="POST">
        <div class="input-form">
            <table id="product-table">
                <tr>
                    <th colspan="2">상품 옵션 추가</th>
                    <td colspan="9999"><button type="button" onclick="moreOption()">+</button></td>
                </tr>
                <c:forEach items="${p.productOptions}" var="option">
                <tr>
                    <th>
                        옵션명<input name="productNo" type="hidden" value="${p.productNo}">
                    </th>
                    <td>
                        <input type="text" name="poName" value="${option.poName}">
                    </td>
                    <td>
                        <input type="text" name="poPrice" value="${option.poPrice}">
                    </td>
                    <td>
                        <button type="button" class="my-btn my-blue" onclick="optionRemove(this,'${option.poNo}')">옵션삭제</button>
                    </td>
                </tr>
            </c:forEach>
            </table>
            <button class="my-btn my-blue" type="submit" onclick="">일괄옵션추가</button>
        </div>
        </form>
    </div>
</div>
</div>

<script>
    const producTable = document.querySelector('#product-table')
    const priceEditBtn = document.querySelector('#priceEditBtn')
    const table = document.querySelector('#product-table')
    const removeGift = productNo => {
        if(confirm('상품을 삭제하겠습니까?)')) {
            location.href = '/deleteProduct.do?productNo=' + productNo
        }
    }
    const moreOption = () => {
        const table = document.getElementById("product-table")
        const row = document.createElement("tr")
        // 옵션명
        const th = document.createElement("th")
        th.innerText = "옵션명"
        const hiddenInput = document.createElement("input")
        hiddenInput.name = "productNo"
        hiddenInput.type = "hidden"
        hiddenInput.value = '${p.productNo}'
        th.appendChild(hiddenInput)
        row.appendChild(th)

        // 옵션명 입력란
        const td1 = document.createElement("td")
        const input1 = document.createElement("input")
        input1.type = "text"
        input1.name = "poName"
        td1.appendChild(input1)
        row.appendChild(td1)

        // 옵션가격 입력란
        const td2 = document.createElement("td")
        const input2 = document.createElement("input")
        input2.type = "text"
        input2.name = "poPrice"
        input2.value = '${p.productPrice}'
        td2.appendChild(input2)
        row.appendChild(td2)

        //옵션삭제 버튼
        const td3 = document.createElement("td")
        const button = document.createElement("button")
        button.type = "button"
        button.innerText = "옵션삭제"
        button.className = 'my-btn my-blue'
        button.onclick = () => {
            row.remove()
        }
        td3.colSpan = 8888
        td3.appendChild(button)
        row.appendChild(td3)

        // 테이블에 새로운 행 추가
        table.appendChild(row)
    }


    const optionRemove = (obj, poNo) => {
        $.ajax({
            url : '/deleteOption.do',
            type : 'POST',
            data : {poNo : poNo},
            success : () => {
                alert('옵션삭제완료')
                $(obj).parent().parent().remove()
            }
        })
    }



    //쓰려다가 만 코드 (form태그 생성해서 action 비동기 fetch)
    const addOption = () => {
        const oldPoNameInput = document.querySelectorAll('input[name=poName]')
        const oldPoPriceInput = document.querySelectorAll('input[name=poPrice]')
        const form = document.createElement('form')
        form.method = 'POST'
        form.action = '/insertOption.do'

        // hidden input
        const hiddenInput = document.createElement('input')
        hiddenInput.type = 'hidden'
        hiddenInput.name = 'productNo'
        hiddenInput.value = '${p.productNo}'
        form.appendChild(hiddenInput)

        // poName input
        const poNameInput = document.createElement('input')
        poNameInput.type = 'text'
        poNameInput.name = 'poName'
        poNameInput.value = '옵션명 입력란 값'
        form.appendChild(poNameInput)

        // poPrice input
        const poPriceInput = document.createElement('input')
        poPriceInput.type = 'text'
        poPriceInput.name = 'poPrice'
        poPriceInput.value = '1'
        form.appendChild(poPriceInput)

        // send request
        fetch(form.action, {
            method: form.method,
            body: new FormData(form)
        }).then(response => {
            if (response.ok) {
            // 성공적으로 처리된 경우
            console.log('Option added successfully.')
            } else {
            // 처리 중에 오류가 발생한 경우
            console.error('Error adding option.')
            }
        })
    }
</script>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp" />