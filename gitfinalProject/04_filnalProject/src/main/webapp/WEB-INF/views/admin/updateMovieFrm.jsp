<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>영화 수정</title>
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
                            <form action="/updateMovie.do" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="movieTitle">제목</label>
                                    <input type="text" class="form-control" id="movieTitle" name="movieTitle"
                                        value="${movie.movieTitle}">
                                </div>
                                <div class="form-group">
                                    <label for="movieDirector">감독</label>
                                    <input type="text" class="form-control" id="movieDirector" name="movieDirector"
                                        value="${movie.movieDirector}">
                                </div>
                                <div class="form-group">
                                    <label for="movieActor">배우</label>
                                    <input type="text" class="form-control" id="movieActor" name="movieActor"
                                        value="${movie.movieActor}">
                                </div>
                                <div class="form-group">
                                    <label for="movieGenre">장르</label>
                                    <select class="form-select" id="movieGenre" name="movieGenre"
                                        aria-label="Default select example">
                                        <option value="드라마">드라마</option>
                                        <option value="애니메이션">애니메이션</option>
                                        <option value="액션">액션</option>
                                        <option value="어드벤처">어드벤처</option>
                                        <option value="판타지">판타지</option>
                                        <option value="뮤지컬">뮤지컬</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="movieDate">개봉일</label>
                                    <input type="date" class="form-control" id="movieDate" name="movieDate"
                                        value="${movie.movieDate}">
                                </div>
                                <div class="form-group">
                                    <label for="movieTime">상영시간</label>
                                    <input type="text" class="form-control" id="movieTime" name="movieTime"
                                        value="${movie.movieTime}">
                                </div>
                                <div class="form-group">
                                    <label for="movieRating">영화 등급</label>
                                    <input type="text" class="form-control" id="movieRating" name="movieRating"
                                        value="${movie.movieRating}">
                                </div>
                                <div class="form-group">
                                    <label for="movieVideo">영화 영상 링크</label>
                                    <input type="text" class="form-control" id="movieVideo" name="movieVideo">
                                    <input type="text" class="form-control" id="movieVideo" name="movieVideo">
                                    <input type="text" class="form-control" id="movieVideo" name="movieVideo">
                                    <input type="text" class="form-control" id="movieVideo" name="movieVideo">
                                    <input type="text" class="form-control" id="movieVideo" name="movieVideo">
                                </div>
                                <div class="form-group">
                                    <label for="filmSociety">필름 소사이어티</label>
                                    <input type="checkbox" id="filmSociety" name="filmSociety" value="Y">
                                    <label for="classicSociety">클래식 소사이터티</label>
                                    <input type="checkbox" id="classicSociety" name="classicSociety" value="Y">
                                    <label for="specialMovie">특별영화</label>
                                    <input type="checkbox" id="specialMovie" name="specialMovie" value="Y">
                                </div>
                                <div class="form-group">
                                    <label for="movieMain">메인 이미지</label>
                                    <input type="file" class="form-control-file" id="movieMain" name="movieMain">
                                </div>
                                <div class="form-group">
                                    <label for="moviePoster">포스터 이미지</label>
                                    <input type="file" multiple class="form-control-file" id="moviePoster"
                                        name="moviePoster">
                                </div>
                                <div class="form-group">
                                    <label for="movieContent">내용</label>
                                    <textarea class="form-control" id="movieContent" name="movieContent"
                                        rows="3">${movie.movieContent}</textarea>
                                </div>
                                <div class="row">
                                    <div class="col text-center">
                                        <button class="btn btn-primary" type="submit">영화 등록</button>
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