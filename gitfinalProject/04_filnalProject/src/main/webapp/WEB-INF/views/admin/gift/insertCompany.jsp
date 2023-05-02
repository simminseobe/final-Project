<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp" />
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp" />
    <div id="admin-main-content">
        <div id="category-insert-modal">
            <div>
                <p>
                    <span>추가할 제조사</span>
                    <span><input id="insertCompnay" type="text" name="companyName"></span>
                </p>
                <p><button class="my-btn my-blue" type="button" onclick="modalCancel()">취소</button><button class="my-btn my-blue" type="button" onclick="submitBtn()">제조사 추가</button></p>
            </div>
        </div>
        <div class="input-form">
            <table id="categoryTable">
                <tr>
                    <td colspan="2">
                        <button class="my-btn my-blue" type="button" onclick="addCategoryModal()">제조사 추가하기</button>
                    </td>
                </tr>
                <tr id="update-delete">
                    <th>제조사</th>
                    <th>수정/삭제</th>
                </tr>
                <c:forEach items="${list}" var="c">
                    <tr>
                        <th><input type="hidden" name="companyNo" value="${c.companyNo}"><input type="text" name="companyName" value="${c.companyName}"></th>
                        <th><div class="delete-update-btn"><button class="my-btn my-blue" type="button" onclick="updateCategory(this)">UPDATE</button><button class="my-btn my-blue" type="button" onclick="deleteCategory(this)">DELETE</button></div></th>
                    </tr>
                </c:forEach>
            </table>
            </div>
    </div>
</div>

<script>
    const submitBtn = () => {
        const companyName = $('#insertCompnay').val()
        if(companyName == '') {
            alert('카테고리 제목을 작성하세요')
        } else {
            $.ajax({
                url : '/insertCompanySql.do',
                type : 'POST',
                data : {companyName : companyName},
                success : (data) => {
                    const tr = $('<tr>')
                    const th = $('<th>')
                    const companyNo = $('<input>')
                    const companyName = $('<input>')

                    companyName.attr('type','text').attr('name', 'companyName').attr('value',data.companyName)
                    companyNo.attr('type','hidden').attr('name', 'companyNo').attr('value',data.companyNo)
                    th.append(companyNo).append(companyName)
                    const th2 = th[0].outerHTML + '<th><div class="delete-update-btn"><button class="my-btn my-blue" type="button" onclick="updateCategory(this)">UPDATE</button><button class="my-btn my-blue" type="button" onclick="deleteCategory(this)" >DELETE</button></div></th>'
                    tr[0].innerHTML = th2
                    console.log($('#update-delete')[0].outerHTML)
                    $('#update-delete')[0].outerHTML += tr[0].outerHTML
                    modalCancel()
                }
            })
        }
    }
    const modalCancel = () => {
        const insertModal = document.querySelector('#category-insert-modal')
        insertModal.style.display = 'none'
        $('#insertCompnay').val('')
    }
    const addCategoryModal = () => {
        const insertModal = document.querySelector('#category-insert-modal')
        insertModal.style.display = 'flex'
    }
    const deleteCategory = obj => {
        const companyNo = $(obj).parent().parent().prev().children().eq(0).val()
        const companyName = $(obj).parent().parent().prev().children().eq(1).val()
        
        if (confirm('" '+companyName + ' " 카테고리를 삭제하겠습니까?')) {
            $.ajax({
                url : '/deleteCompany.do',
                type : 'POST',
                data : {companyNo : companyNo, companyName : companyName},
                success : data => {
                    $(obj).parent().parent().parent().remove()
                }
            })
        }
    }
    const updateCategory = obj => {
        const companyNo = $(obj).parent().parent().prev().children().eq(0).val()
        const companyName = $(obj).parent().parent().prev().children().eq(1).val()
        if (confirm('" '+companyName + ' " 카테고리를 수정하시겠습니까?')) {
            $.ajax({
                url : '/updateCompany.do',
                type : 'POST',
                data : {companyNo : companyNo, companyName : companyName},
                success : data => {
                    alert('수정되었습니다')
                }
            })
        }
    }
    function getCategryList(companyNo) {
        $.ajax({
            url : "/getOrderlyCompany.do",
            type : "get",
            data : {companyNo : companyNo},
            success : function(data) {
                
            }
        })
    }
</script>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp" />