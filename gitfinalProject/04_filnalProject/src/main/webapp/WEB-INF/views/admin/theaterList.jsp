<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>상영관 목록</title>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp"></jsp:include>
            <div id="layoutSidenav">
                <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Tables</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                <li class="breadcrumb-item active">Tables</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-body">
                                    DataTables is a third party plugin that is used to generate the demo table below.
                                    For
                                    more
                                    information about DataTables, please visit the
                                    <a target="_blank" href="https://datatables.net/">official DataTables
                                        documentation</a>
                                    .
                                </div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    DataTable Example
                                </div>
                                <div class="card-body">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>지역</th>
                                                <th>지점</th>
                                                <th>시설</th>
                                                <th>작성자</th>
                                                <th>수정</th>
                                                <th>삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="theater">
                                                <tr>
                                                    <td>${theater.theaterNo}</td>
                                                    <td>${theater.theaterLocal}</td>
                                                    <td>${theater.theaterBranch}</td>
                                                    <td>${theater.theaterFacility}</td>
                                                    <td>${theater.enrollMember}</td>
                                                    <td>
                                                        <button class="update-movie-btn"
                                                            onclick="updateMovie(this);">수정</button>
                                                    </td>
                                                    <td>
                                                        <button class="delete-movie-btn"
                                                            onclick=" deleteMovie(this);">삭제</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>
                    <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
                </div>
            </div>
            <script>
                function updateMovie(button) {
                    const movieNo = $(button).parent().parent().children().eq(0).text();

                    console.log(movieNo);

                    location.href = "/updateMovieFrm.do?movieNo=" + movieNo;
                }

                function deleteMovie(button) {
                    const movieNo = $(button).parent().parent().children().eq(0).text();

                    console.log(movieNo);
                }
            </script>
        </body>

        </html>