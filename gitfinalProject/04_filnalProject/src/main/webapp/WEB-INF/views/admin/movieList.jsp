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
                            <h1 class="mt-4">영화 관리</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">영화 목록</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-body">
                                    살제 영화와 다를 수 있습니다.
                                </div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    리스트
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
                                                    <td>
                                                        <button class="update-movie-btn btn btn-primary"
                                                            onclick="updateMovie(this);">수정</button>
                                                    </td>
                                                    <td>
                                                        <button class="delete-movie-btn btn btn-primary"
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

                    location.href = "/updateMovieFrm.do?movieNo=" + movieNo;
                }

                function deleteMovie(button) {
                    const movieNo = $(button).parent().parent().children().eq(0).text();

                    location.href = "/deleteMovie.do?movieNo=" + movieNo;
                }
            </script>
        </body>

        </html>