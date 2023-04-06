<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>영화관 관리</title>
    </head>

    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp"></jsp:include>
        <div id="layoutSidenav">
            <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">영화관 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">영화관 등록</li>
                        </ol>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            영화관 등록 입력 양식
                        </div>
                        <div class="card-body">
                            <div class="container">
                                <h1>영화관 등록</h1>
                                <form>
                                    <div class="form-group">
                                        <label for="theaterLocal">지역</label>
                                        <select class="form-select" id="theaterLocal" name="theaterLocal"
                                            aria-label="Default select example">
                                            <option value="서울">서울</option>
                                            <option value="경기">경기</option>
                                            <option value="인천">인천</option>
                                            <option value="대전/충청/세종">대전/충청/세종</option>
                                            <option value="부산/대구/경상">부산/대구/경상</option>
                                            <option value="광주/전라">광주/전라</option>
                                            <option value="강원">강원</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="theaterAddr">영화관 상세 지역</label>
                                        <select class="form-select" id="theaterAddr" name="theaterAddr"
                                            aria-label="Default select example">
                                            <option value="없음">없음</option>
                                        </select>
                                        <button type="button" class="theaterAddr">지역 상세 조회</button>
                                    </div>
                                    <div class="form-group">
                                        <label for="theaternewAddr">영화관 상세 지역 새로 입력</label>
                                        <input type="text" class="form-control" id="theaternewAddr"
                                            name="theaternewAddr">
                                    </div>
                                    <div class="form-group">
                                        <label for="TheaterCode">영화관 코드(A~B, 1~100관)</label>
                                        <input type="text" class="form-control" id="TheaterCode" name="TheaterCode">
                                    </div>
                                    <button type="submit" class="btn btn-default">등록</button>
                                </form>
                            </div>
                            <div class="container">
                                <h1>상영 관 목록</h1>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>영화관 번호</th>
                                            <th>영화관 코드</th>
                                            <th>영화관 지역</th>
                                            <th>영화관 상세 지역</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>100</td>
                                            <td>1층</td>
                                            <td>1층</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>80</td>
                                            <td>2층</td>
                                            <td>1층</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>120</td>
                                            <td>3층</td>
                                            <td>1층</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>120</td>
                                            <td>3층</td>
                                            <td>1층</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
            </div>
            <script>
                $(".theaterAddr").on("click", function () {
                    const theaterLocal = $(this).parent().prev().children().eq(1).val();

                    $.ajax({
                        url: "/searchtheaterAddr.do",
                        type: "get",
                        data: { theaterLocal: theaterLocal },
                        success: function (theaterAddrList) {
                            console.log(theaterAddrList);
                            console.log(theaterAddrList.get(0).theaterAddrList);

                            // const option = $(`<option value="${theaterAddrList.theaterAddr.get(0)}">${theaterAddrList.theaterAddr.get(0)}</option>`);

                            // console.log(option.text());
                        },
                        error: function () {
                            alert("서버 연결 실패");
                        }
                    });
                });
            </script>
        </div>
    </body>

    </html>