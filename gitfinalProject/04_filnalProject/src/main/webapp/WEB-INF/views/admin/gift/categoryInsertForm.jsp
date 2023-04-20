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
                    <span>추가할 카테고리</span>
                    <span><input id="insertCt" type="text" name="pcCategory"></span>
                </p>
                <p><button class="my-btn my-blue" type="button" onclick="modalCancel()">취소</button><button class="my-btn my-blue" type="button" onclick="submitBtn()">카테고리 추가</button></p>
            </div>
        </div>
        <div class="input-form">
            <table id="categoryTable">
                <tr>
                    <td colspan="2">
                        <button class="my-btn my-blue" type="button" onclick="addCategoryModal()">카테고리 추가하기</button>
                    </td>
                </tr>
                <tr id="update-delete">
                    <th>카테고리</th>
                    <th>수정/삭제</th>
                </tr>
                <c:forEach items="${list}" var="c">
                    <tr>
                        <th><input type="hidden" name="pcNo" value="${c.pcNo}"><input type="text" name="pcCategory" value="${c.pcCategory}"></th>
                        <th><div class="delete-update-btn"><button class="my-btn my-blue" type="button" onclick="updateCategory(this)">UPDATE</button><button class="my-btn my-blue" type="button" onclick="deleteCategory(this)">DELETE</button></div></th>
                    </tr>
                </c:forEach>
            </table>
            </div>
    </div>
</div>

<script>
    const submitBtn = () => {
        const pcCategory = $('#insertCt').val()
        if(pcCategory == '') {
            alert('카테고리 제목을 작성하세요')
        } else {
            $.ajax({
                url : '/insertCategory.do',
                type : 'POST',
                data : {pcCategory : pcCategory},
                success : (data) => {
                    const tr = $('<tr>')
                    const th = $('<th>')
                    const pcNo = $('<input>')
                    const pcCategory = $('<input>')

                    pcCategory.attr('type','text').attr('name', 'pcCategory').attr('value',data.pcCategory)
                    pcNo.attr('type','hidden').attr('name', 'pcNo').attr('value',data.pcNo)
                    th.append(pcNo).append(pcCategory)
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
        $('#insertCt').val('')
    }
    const addCategoryModal = () => {
        const insertModal = document.querySelector('#category-insert-modal')
        insertModal.style.display = 'flex'
    }
    const deleteCategory = obj => {
        const pcNo = $(obj).parent().parent().prev().children().eq(0).val()
        const pcCategory = $(obj).parent().parent().prev().children().eq(1).val()
        
        if (confirm('" '+pcCategory + ' " 카테고리를 삭제하겠습니까?')) {
            $.ajax({
                url : '/deleteCategory.do',
                type : 'POST',
                data : {pcNo : pcNo, pcCategory : pcCategory},
                success : data => {
                    $(obj).parent().parent().parent().remove()
                }
            })
        }
    }
    const updateCategory = obj => {
        const pcNo = $(obj).parent().parent().prev().children().eq(0).val()
        const pcCategory = $(obj).parent().parent().prev().children().eq(1).val()
        if (confirm('" '+pcCategory + ' " 카테고리를 수정하시겠습니까?')) {
            $.ajax({
                url : '/updateCategory.do',
                type : 'POST',
                data : {pcNo : pcNo, pcCategory : pcCategory},
                success : data => {
                    alert('수정되었습니다')
                }
            })
        }
    }
    function getCategryList(pcNo) {
        $.ajax({
            url : "/getOrderlyCategory.do",
            type : "get",
            data : {pcNo : pcNo},
            success : function(data) {
                
            }
        })
    }
</script>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp" />