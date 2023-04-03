<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
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
                            <li class="breadcrumb-item active">영화 등록</li>
                        </ol>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            DataTable Example
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="movieTitle">영화 제목</label>
                                    <input type="text" class="form-control" id="movieTitle" placeholder="영화 제목을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="movieDirector">감독</label>
                                    <input type="text" class="form-control" id="movieDirector"
                                        placeholder="감독 이름을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="movieReleaseDate">개봉일</label>
                                    <input type="date" class="form-control" id="movieReleaseDate">
                                </div>
                                <div class="form-group">
                                    <label for="moviePoster">포스터 이미지</label>
                                    <input type="file" class="form-control-file" id="moviePoster">
                                </div>
                                <div class="form-group">
                                    <label for="movieSynopsis">줄거리</label>
                                    <textarea class="form-control" id="movieSynopsis" rows="3"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">영화 등록</button>
                            </form>
                        </div>
                    </div>
                </main>
                <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
            </div>
        </div>
    </body>

    </html>