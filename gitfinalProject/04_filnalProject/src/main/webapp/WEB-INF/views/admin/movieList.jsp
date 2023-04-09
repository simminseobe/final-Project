<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>영화 목록</title>
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
                                                <th>제목</th>
                                                <th>감독</th>
                                                <th>배우</th>
                                                <th>장르</th>
                                                <th>개봉일</th>
                                                <th>상영시간</th>
                                                <th>심의등급</th>
                                                <th>소사이어티</th>
                                                <th>수정</th>
                                                <th>삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="movie">
                                                <tr>
                                                    <td>${movie.movieNo}</td>
                                                    <td>${movie.movieTitle}</td>
                                                    <td>${movie.movieDirector}</td>
                                                    <td>${movie.movieActor}</td>
                                                    <td>${movie.movieGenre}</td>
                                                    <td>${movie.movieDate}</td>
                                                    <td>${movie.movieTime}</td>
                                                    <td>${movie.movieRating}</td>
                                                    <td>${movie.movieRating}</td>
                                                    <td><button onclick="">수정</button></td>
                                                    <td><button onclick="">삭제</button></td>
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
        </body>

        </html>