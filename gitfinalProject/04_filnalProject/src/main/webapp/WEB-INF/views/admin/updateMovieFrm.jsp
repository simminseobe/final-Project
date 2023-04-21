<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                <li class="breadcrumb-item active">영화 수정</li>
                            </ol>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                영화 등록 양식
                            </div>
                            <div class="container">
                                <form action="/updateMovie.do" method="post" enctype="multipart/form-data"
                                    id="updateMovieFrm">
                                    <input type="hidden" name="movieNo" value="${movie.movieNo}">
                                    <div class="form-group">
                                        <label for="movieTitle" class="my-1">영화 제목</label>
                                        <input type="text" class="form-control" id="movieTitle" name="movieTitle"
                                            value="${movie.movieTitle}" placeholder="영화 제목을 입력하세요" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="movieDirector" class="my-1">감독</label>
                                        <input type="text" class="form-control" id="movieDirector" name="movieDirector"
                                            value="${movie.movieDirector}" placeholder="감독 이름을 입력하세요" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="movieActor" class="my-1">배우</label>
                                        <input type="text" class="form-control" id="movieActor" name="movieActor"
                                            value="${movie.movieActor}" placeholder="배우들을 입력하세요" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="movieGenre" class="my-1">장르</label>
                                        <c:choose>
                                            <c:when test="${movie.movieGenre == '드라마'}">
                                                <select class="form-select" id="movieGenre" name="movieGenre"
                                                    aria-label="Default select example">
                                                    <option value="드라마" selected>드라마</option>
                                                    <option value="애니메이션">애니메이션</option>
                                                    <option value="액션">액션</option>
                                                    <option value="어드벤처">어드벤처</option>
                                                    <option value="판타지">판타지</option>
                                                    <option value="뮤지컬">뮤지컬</option>
                                                </select>
                                            </c:when>
                                            <c:when test="${movie.movieGenre == '애니메이션'}">
                                                <select class="form-select" id="movieGenre" name="movieGenre"
                                                    aria-label="Default select example">
                                                    <option value="드라마" selected>드라마</option>
                                                    <option value="애니메이션" selected>애니메이션</option>
                                                    <option value="액션">액션</option>
                                                    <option value="어드벤처">어드벤처</option>
                                                    <option value="판타지">판타지</option>
                                                    <option value="뮤지컬">뮤지컬</option>
                                                </select>
                                            </c:when>
                                            <c:when test="${movie.movieGenre == '액션'}">
                                                <select class="form-select" id="movieGenre" name="movieGenre"
                                                    aria-label="Default select example">
                                                    <option value="드라마" selected>드라마</option>
                                                    <option value="애니메이션">애니메이션</option>
                                                    <option value="액션" selected>액션</option>
                                                    <option value="어드벤처">어드벤처</option>
                                                    <option value="판타지">판타지</option>
                                                    <option value="뮤지컬">뮤지컬</option>
                                                </select>
                                            </c:when>
                                            <c:when test="${movie.movieGenre == '어드벤쳐'}">
                                                <select class="form-select" id="movieGenre" name="movieGenre"
                                                    aria-label="Default select example">
                                                    <option value="드라마" selected>드라마</option>
                                                    <option value="애니메이션">애니메이션</option>
                                                    <option value="액션">액션</option>
                                                    <option value="어드벤처" selected>어드벤처</option>
                                                    <option value="판타지">판타지</option>
                                                    <option value="뮤지컬">뮤지컬</option>
                                                </select>
                                            </c:when>
                                            <c:when test="${movie.movieGenre == '판타지'}">
                                                <select class="form-select" id="movieGenre" name="movieGenre"
                                                    aria-label="Default select example">
                                                    <option value="드라마" selected>드라마</option>
                                                    <option value="애니메이션">애니메이션</option>
                                                    <option value="액션">액션</option>
                                                    <option value="어드벤처">어드벤처</option>
                                                    <option value="판타지" selected>판타지</option>
                                                    <option value="뮤지컬">뮤지컬</option>
                                                </select>
                                            </c:when>
                                            <c:otherwise>
                                                <select class="form-select" id="movieGenre" name="movieGenre"
                                                    aria-label="Default select example">
                                                    <option value="드라마" selected>드라마</option>
                                                    <option value="애니메이션">애니메이션</option>
                                                    <option value="액션">액션</option>
                                                    <option value="어드벤처">어드벤처</option>
                                                    <option value="판타지">판타지</option>
                                                    <option value="뮤지컬" selected>뮤지컬</option>
                                                </select>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="form-group">
                                        <label for="movieType" class="my-1">상영타입</label>
                                        <c:choose>
                                            <c:when test="${movie.movieType == '2D'}">
                                                <select class="form-select" id="movieType" name="movieType"
                                                    aria-label="Default select example">
                                                    <option value="2D" selected>2D</option>
                                                    <option value="2D ATMOS">2D ATMOS</option>
                                                    <option value="2D Dolby">2D Dolby</option>
                                                    <option value="3D">3D</option>
                                                    <option value="3D ATMOS">3D ATMOS</option>
                                                    <option value="3D Dolby">3D Dolby</option>
                                                </select>
                                            </c:when>
                                            <c:when test="${movie.movieType == '2D ATMOS'}">
                                                <select class="form-select" id="movieType" name="movieType"
                                                    aria-label="Default select example">
                                                    <option value="2D">2D</option>
                                                    <option value="2D ATMOS" selected>2D ATMOS</option>
                                                    <option value="2D Dolby">2D Dolby</option>
                                                    <option value="3D">3D</option>
                                                    <option value="3D ATMOS">3D ATMOS</option>
                                                    <option value="3D Dolby">3D Dolby</option>
                                                </select>
                                            </c:when>
                                            <c:when test="${movie.movieType == '2D Dolby'}">
                                                <select class="form-select" id="movieType" name="movieType"
                                                    aria-label="Default select example">
                                                    <option value="2D">2D</option>
                                                    <option value="2D ATMOS">2D ATMOS</option>
                                                    <option value="2D Dolby" selected>2D Dolby</option>
                                                    <option value="3D">3D</option>
                                                    <option value="3D ATMOS">3D ATMOS</option>
                                                    <option value="3D Dolby">3D Dolby</option>
                                                </select>
                                            </c:when>
                                            <c:when test="${movie.movieType == '3D'}">
                                                <select class="form-select" id="movieType" name="movieType"
                                                    aria-label="Default select example">
                                                    <option value="2D">2D</option>
                                                    <option value="2D ATMOS">2D ATMOS</option>
                                                    <option value="2D Dolby">2D Dolby</option>
                                                    <option value="3D" selected>3D</option>
                                                    <option value="3D ATMOS">3D ATMOS</option>
                                                    <option value="3D Dolby">3D Dolby</option>
                                                </select>
                                            </c:when>
                                            <c:when test="${movie.movieType == '3D ATMOS'}">
                                                <select class="form-select" id="movieType" name="movieType"
                                                    aria-label="Default select example">
                                                    <option value="2D">2D</option>
                                                    <option value="2D ATMOS">2D ATMOS</option>
                                                    <option value="2D Dolby">2D Dolby</option>
                                                    <option value="3D">3D</option>
                                                    <option value="3D ATMOS" selected>3D ATMOS</option>
                                                    <option value="3D Dolby">3D Dolby</option>
                                                </select>
                                            </c:when>
                                            <c:otherwise>
                                                <select class="form-select" id="movieType" name="movieType"
                                                    aria-label="Default select example">
                                                    <option value="2D">2D</option>
                                                    <option value="2D ATMOS">2D ATMOS</option>
                                                    <option value="2D Dolby">2D Dolby</option>
                                                    <option value="3D">3D</option>
                                                    <option value="3D ATMOS">3D ATMOS</option>
                                                    <option value="3D Dolby" selected>3D Dolby</option>
                                                </select>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="form-group">
                                        <label for="movieDate" class="my-1">개봉일</label>
                                        <input type="date" class="form-control" id="movieDate" name="movieDate"
                                            value="${movie.movieDate}" required>
                                        <p id="movieDateReg" style="display: none;">${movie.movieDate}</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="movieTime" class="my-1">상영시간</label>
                                        <input type="text" class="form-control" id="movieTime" name="movieTime"
                                            value="${movie.movieTime}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="movieRating" class="my-1">심의 등급</label>
                                        <input type="number" min="0" max="18" class="form-control" id="movieRating"
                                            name="movieRating" value="${movie.movieRating}" required>
                                    </div>
                                    <div class="form-group my-2">
                                        <label for="filmSociety" class="form-check-label my-1">필름 소사이어티</label>                                
                                        <c:choose>
                                            <c:when test='${movie.filmSociety eq "Y "}'>
                                                <input type="checkbox" class="form-check-input my-1" id="filmSociety"
                                                    name="filmSociety" value="Y" checked>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="checkbox" class="form-check-input my-1" id="filmSociety"
                                                    name="filmSociety" value="Y">
                                            </c:otherwise>
                                        </c:choose>

                                        <label for="classicSociety" class="form-check-label my-1">클래식 소사이어티</label>
                                        <c:choose>
                                            <c:when test='${movie.classicSociety eq "Y "}'>
                                                <input type="checkbox" class="form-check-input my-1" id="classicSociety"
                                                    name="classicSociety" value="Y" checked>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="checkbox" class="form-check-input my-1" id="classicSociety"
                                                    name="classicSociety" value="Y">
                                            </c:otherwise>
                                        </c:choose>

                                        <label for="specialMovie" class="form-check-label my-1">특별영화</label>
                                        <c:choose>
                                            <c:when test='${movie.specialMovie eq "Y "}'>
                                                <input type="checkbox" class="form-check-input my-1" id="specialMovie"
                                                    name="specialMovie" value="Y" checked>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="checkbox" class="form-check-input my-1" id="specialMovie"
                                                    name="specialMovie" value="Y">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="form-group my-2">
                                        <label for="" class="my-1">기존 이미지 관리</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group w-50">
                                                <!-- Button trigger modal -->
                                                <button type="button" class="btn btn-outline-secondary"
                                                    id="main-image-magnage" data-bs-toggle="modal"
                                                    data-bs-target="#main-magnage-modal">
                                                    메인 이미지
                                                </button>
                                                <button type="button" class="btn btn-outline-secondary"
                                                    id="post-image-magnage" data-bs-toggle="modal"
                                                    data-bs-target="#post-magnage-modal">
                                                    포스트 이미지
                                                </button>
                                                <!-- Modal -->
                                                <div class="modal fade" id="main-magnage-modal" tabindex="-1"
                                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">메인
                                                                    포스터 관리
                                                                </h5>
                                                                <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="container-fluid">
                                                                    <div class="row">
                                                                        <div
                                                                            class="d-flex flex-column align-items-center">
                                                                            <img src="/resources/upload/movie/${movie.mainFile.movieFileName}"
                                                                                style="width: 200px; height:300px;">
                                                                            <button class="my-3 btn btn-primary"
                                                                                onclick="deleteFile(this, ${movie.mainFile.movieFileNo}, '${movie.mainFile.movieFilePath }');">삭제</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class=" modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">닫기</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Modal -->
                                                <div class="modal fade" id="post-magnage-modal" tabindex="-1"
                                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">포스터
                                                                    관리
                                                                </h5>
                                                                <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="container-fluid">
                                                                    <div class="row">
                                                                        <c:forEach items="${movie.moviePost}"
                                                                            var="file">
                                                                            <div
                                                                                class="d-flex flex-column align-items-center">
                                                                                <img src="/resources/upload/movie/${file.movieFileName}"
                                                                                    style="width: 200px; height:300px;">
                                                                                <button class="my-3 btn btn-primary"
                                                                                    onclick="deleteFile(this, ${file.movieFileNo}, '${file.movieFilePath }');">삭제</button>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> -->
                                                        <div class=" modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">닫기</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group my-2">
                                        <label class="my-1">이미지 추가</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group w-50">
                                                <label class="input-group-text" for="movieMain">메인
                                                    이미지</label>
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
                                                                <h5 class="modal-title" id="exampleModalLabel">메인
                                                                    포스터
                                                                </h5>
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
                                    <div class="form-group" class="my-2">
                                        <div class="input-group w-50">
                                            <label class="input-group-text" for="moviePoster">포스터
                                                이미지</label>
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
                                                            <h5 class="modal-title" id="exampleModalLabel">영화 포스터
                                                            </h5>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="d-flex justify-content-center my-2"
                                                                        id="movie-post-image-div"
                                                                        style="flex-wrap: wrap;">
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
                                        <div class="form-group">
                                            <label for="movieVideo" class="my-3">기존 영상 관리</label>
                                            <c:forEach items="${movie.movieVideos}" var="video">
                                                <div class="input-group">
                                                    <input type="text" class="form-control my-2 ms-2 mb-2"
                                                        id="movieVideo" name="movieVideo" value="${video.videoLink}"
                                                        disabled>
                                                    <span class="input-group-btn">
                                                        <button type="button" class="btn btn-primary my-2"
                                                            onclick="deleteVideo(this, ${video.videoNo});">삭제</button>
                                                        <span id="movieVideoDup"></span>
                                                    </span>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="form-group" id="video-div">
                                            <label for="movieVideo" class="my-3">영상 링크 추가(이전 영상 추가 금지)</label>
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-primary my-3"
                                                    id="plusInput">추가</button>
                                            </span>
                                        </div>
                                        <div class="form-group my-1">
                                            <label for="movieContent" class="my-1">소개</label>
                                            <textarea class="form-control" id="movieContent" name="movieContent"
                                                rows="3" required>${movie.movieContent}</textarea>
                                        </div>
                                        <div class="row my-3">
                                            <div class="col text-center">
                                                <button class="btn btn-primary" type="submit">수정</button>
                                            </div>
                                        </div>
                                </form>
                            </div>
                        </div>
                </div>
                </main>
                <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
            </div>
            </div>
            <script>
                $(document).ready(function () {
                    const datetimeString = $("#movieDateReg").text();
                    const dateOnly = datetimeString.split(" ")[0];

                    $("#movieDate").val(dateOnly);
                });

                $("#movieContent").summernote({
                    height: 400,
                    lang: "ko-KR",
                    callbacks: {
                        onImageUpload: function (files) {
                            uploadImage(files[0], this);
                        }
                    }
                });

                $("#movieMain").on("change", function (event) {
                    var file = event.target.files[0];
                    var reader = new FileReader();

                    reader.onload = function (event) {
                        $("#main-post-image").css("width", "300px");
                        $("#main-post-image").css("height", "300px");

                        $("#main-post-image").attr("src", event.target.result);
                    }

                    reader.readAsDataURL(file);
                })

                $("#moviePoster").on("change", function (event) {
                    $("#movie-post-image-div").empty();

                    var files = event.target.files;

                    [...event.target.files].forEach(file => {
                        const img = $("<img>");
                        $("#movie-post-image-div").append(img);

                        var reader = new FileReader();

                        reader.onload = function (event) {
                            img.css("width", "200px");
                            img.css("height", "200px");
                            img.css("margin", "10px");

                            img.attr("src", event.target.result);
                        }

                        reader.readAsDataURL(file);
                    });
                });

                function deleteFile(obj, fileNo, filepath) {
                    const fileNoInput = $("<input>");

                    fileNoInput.attr("name", "fileNo");
                    fileNoInput.attr("value", fileNo);
                    fileNoInput.hide();

                    const filepathInput = $("<input>");

                    filepathInput.attr("name", "filepath");
                    filepathInput.attr("value", filepath);
                    filepathInput.hide();

                    $("#updateMovieFrm").append(fileNoInput).append(filepathInput);

                    $(obj).parent().remove();
                }

                function deleteVideo(obj, videoNo, videoLink) {
                    const videoNoInput = $("<input>");

                    videoNoInput.attr("name", "videoNo");
                    videoNoInput.attr("value", videoNo);
                    videoNoInput.hide();

                    $("#updateMovieFrm").append(videoNoInput);

                    $(obj).parent().parent().remove();
                }

                $("#plusInput").on("click", function () {
                    const videoInput = $("<input type='text' class='form-control my-1' id='movieVideo' name='movieVideo' required > ");

                    $("#video-div").append(videoInput);
                });
            </script>
        </body>

        </html>