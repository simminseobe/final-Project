<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>영상관 관리</title>
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
                            <div class="container">
                                <h1>상영 관 목록</h1>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>관 번호</th>
                                            <th>좌석 수</th>
                                            <th>소재지</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>100</td>
                                            <td>1층</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>80</td>
                                            <td>2층</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>120</td>
                                            <td>3층</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h1>상영 관 등록</h1>
                                <form>
                                    <div class="form-group">
                                        <label for="inputSeatCount">좌석 수:</label>
                                        <input type="text" class="form-control" id="inputSeatCount">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputLocation">소재지:</label>
                                        <input type="text" class="form-control" id="inputLocation">
                                    </div>
                                    <button type="submit" class="btn btn-default">등록</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
            </div>
            <script>
            </script>
        </div>
    </body>

    </html>