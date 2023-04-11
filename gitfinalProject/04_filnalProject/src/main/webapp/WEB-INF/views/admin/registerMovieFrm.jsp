<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>영화 등록</title>
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
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            영화 등록 양식
                        </div>
                        <div class="container">
                            <form action="/registerMovie.do" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="movieTitle" class="my-1">영화 제목</label>
                                    <input type="text" class="form-control" id="movieTitle" name="movieTitle"
                                        placeholder="영화 제목을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="movieDirector" class="my-1">감독</label>
                                    <input type="text" class="form-control" id="movieDirector" name="movieDirector"
                                        placeholder="감독 이름을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="movieActor" class="my-1">배우</label>
                                    <input type="text" class="form-control" id="movieActor" name="movieActor"
                                        placeholder="배우들을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="movieGenre" class="my-1">장르</label>
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
                                    <label for="movieType" class="my-1">상영타입</label>
                                    <select class="form-select" id="movieType" name="movieType"
                                        aria-label="Default select example">
                                        <option value="2D">2D</option>
                                        <option value="2D(자막)">2D(자막)</option>
                                        <option value="2D ATMOS(자막)">2D ATMOS(자막)</option>
                                        <option value="2D Dolby(자막)">2D Dolby(자막)</option>
                                        <option value="판타지">3D</option>
                                        <option value="2D(자막)">3D(자막)</option>
                                        <option value="2D ATMOS(자막)">3D ATMOS(자막)</option>
                                        <option value="2D Dolby(자막)">3D Dolby(자막)</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="movieDate" class="my-1">개봉일</label>
                                    <input type="date" class="form-control" id="movieDate" name="movieDate">
                                </div>
                                <div class="form-group">
                                    <label for="movieTime" class="my-1">상영시간</label>
                                    <input type="text" class="form-control" id="movieTime" name="movieTime">
                                </div>
                                <div class="form-group">
                                    <label for="movieRating" class="my-1">심의 등급</label>
                                    <input type="text" class="form-control" id="movieRating" name="movieRating">
                                </div>
                                <div class="form-group">
                                    <label for="movieVideo" class="my-1">영화 영상 링크</label>
                                    <input type="text" class="form-control my-1" id="movieVideo" name="movieVideo">
                                    <input type="text" class="form-control my-1" id="movieVideo" name="movieVideo">
                                    <input type="text" class="form-control my-1" id="movieVideo" name="movieVideo">
                                    <input type="text" class="form-control my-1" id="movieVideo" name="movieVideo">
                                    <input type="text" class="form-control my-1" id="movieVideo" name="movieVideo">
                                </div>
                                <div class="form-group">
                                    <label for="filmSociety" class="form-check-label my-1">필름 소사이어티</label>
                                    <input type="checkbox" class="form-check-input my-1" id="filmSociety"
                                        name="filmSociety" value="Y">
                                    <label for="classicSociety" class="form-check-label my-1">클래식 소사이터티</label>
                                    <input type="checkbox" class="form-check-input my-1" id="classicSociety"
                                        name="classicSociety" value="Y">
                                    <label for="specialMovie" class="form-check-label my-1">특별영화</label>
                                    <input type="checkbox" class="form-check-input my-1" id="specialMovie"
                                        name="specialMovie" value="Y">
                                </div>
                                <div class="form-group my-1">
                                    <div class="input-group mb-3">
                                        <div class="input-group w-50">
                                            <label class="input-group-text" for="movieMain">메인 이미지</label>
                                            <input type="file" class="form-control" id="movieMain" name="movieMain"
                                                aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-outline-secondary"
                                                id="inputGroupFileAddon04" data-bs-toggle="modal"
                                                data-bs-target="#main-post-modal">
                                                미리보기
                                            </button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="main-post-modal" tabindex="-1"
                                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">메인 포스터</h5>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="d-flex justify-content-center">
                                                                        <img id="main-post-image">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">닫기</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" class="my-1">
                                    <div class="input-group w-50">
                                        <label class="input-group-text" for="moviePoster">포스터 이미지</label>
                                        <input type="file" class="form-control" id="moviePoster" name="moviePoster"
                                            aria-describedby="inputGroupFileAddon04" aria-label="Upload" multiple>
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-outline-secondary"
                                            id="inputGroupFileAddon04" data-bs-toggle="modal"
                                            data-bs-target="#movie-post-modal">
                                            미리보기
                                        </button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="movie-post-modal" tabindex="-1"
                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">영화 포스터</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-4 my-2">
                                                                    <img id="movie-post-image" class="img-fluid">
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-4 my-2">
                                                                    <img id="movie-post-image" class="img-fluid">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">닫기</button>
                                                        <button type="button" class="btn btn-primary">수정</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group my-1">
                                        <label for="movieContent" class="my-1">소개</label>
                                        <textarea class="form-control" id="movieContent" name="movieContent"
                                            rows="3"></textarea>
                                    </div>
                                    <div class="row my-3">
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
        <script>
            $("#movieMain").on("change", function (event) {
                var file = event.target.files[0];
                var reader = new FileReader();

                reader.onload = function (e) {

                    $("#main-post-image").attr("src", e.target.result);
                }

                reader.readAsDataURL(file);
            })

            $("#moviePoster").on("change", function (event) {
                var file = event.target.files[0];
                var reader = new FileReader();

                reader.onload = function (e) {

                    $("#movie-post-image").attr("src", e.target.result);
                }

                reader.readAsDataURL(file);
            })
        </script>
    </body>

    </html>