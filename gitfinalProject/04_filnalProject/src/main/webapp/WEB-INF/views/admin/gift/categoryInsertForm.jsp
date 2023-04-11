<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp" />

<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp" />
    <div id="admin-main-content">
        <h1>insert Category</h1>
        <form action="/insertCategory.do" method="post" id="categoryTable">
            <div class="input-form">
                <table id="categoryTable">
                    <tr>
                        <th>상품카테고리</th>
                        <th>카테고리명</th>
                        <th>상세 카테고리로 추가</th>
                    </tr>
                    <tr>
                        <th><input type="hidden" name="pcDepth" value="1"></th>
                        <th><input type="text" name="pcCategory"></th>
                        <th><select name="pcNo" id="categoryStep" onchange="getCategryList(this.value)">
                            <option value="0">상위카테고리</option>
                            <c:forEach items="${list}" var="category" varStatus="">
                                <option value="${category.pcNo}">${category.pcCategory}</option>
                            </c:forEach>
                        </select></th>
                    </tr>
                    <tr>
                        <th colspan="3">
                            <input type="submit" value="등록">
                        </th>
                    </tr>
                </table>
            </div>
        </form>

    </div>
</div>

<script>
    function submitBtn() {
        if($('input[name=pcCategory]').val() == '') {
            alert('카테고리 제목을 작성하세요')
        } else {
            // document.getElementById("categoryTable").submit()
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