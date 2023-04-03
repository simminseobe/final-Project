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
                            영화 등록 입력 양식
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
                                    <label for="movieDirector">배우</label>
                                    <input type="text" class="form-control" id="movieDirector" placeholder="배우들을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="movieDirector">장르</label>
                                    <select class="form-select" aria-label="Default select example">
                                        <option selected>드라마</option>
                                        <option value="1">애니메이션</option>
                                        <option value="2">액션</option>
                                        <option value="3">어드벤처</option>
                                        <option value="3">판타지</option>
                                        <option value="3">뮤지컬</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="movieReleaseDate">개봉일</label>
                                    <input type="date" class="form-control" id="movieReleaseDate">
                                </div>
                                <div class="form-group">
                                    <label for="movieReleaseDate">상영시간</label>
                                    <input type="text" class="form-control" id="movieReleaseDate">
                                </div>
                                <div class="form-group">
                                    <label for="moviePoster">메인 이미지</label>
                                    <input type="file" class="form-control-file" id="moviePoster">
                                </div>
                                <div class="form-group">
                                    <label for="moviePoster">포스트 이미지</label>
                                    <input type="file" class="form-control-file" id="moviePoster">
                                </div>
                                <div class="form-group">
                                    <label for="moviePoster">예고편 영상(링크를 걸어주세요.)</label>
                                    <input type="text" class="form-control" id="movieReleaseDate">
                                </div>
                                <div class="form-group">
                                    <label for="movieSynopsis">줄거리</label>
                                    <textarea class="form-control" id="movieSynopsis" rows="3"></textarea>
                                </div>
                                <div class="row">
                                    <div class="col text-center">
                                        <button class="btn btn-primary" type="submit"
                                            onclick="location.replace('/form.php')">등록</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </main>
                <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
            </div>
        </div>
    </body>

    </html>