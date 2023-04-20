<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp" />
<div id="layoutSidenav">
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp" />
<div id="admin-main-content">
    <h1>categoryList</h1>
        <c:forEach items="${list }" var="c">
            <button class="my-btn my-blue" onclick="categoryDetail(this)" value="${c.pcNo}">${c.pcCategory}</button>
        </c:forEach>
    </ul>
</div>
</div>
<script>
    const categoryDetail = obj => {
        const pcNo = obj.value
        $.ajax({
            url : '/getCategoryItems.do',
            type : 'POST',
            data : {pcNo : pcNo},
            success : data => {
                console.dir(data)
            }
        })
    }

</script>
<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp" />