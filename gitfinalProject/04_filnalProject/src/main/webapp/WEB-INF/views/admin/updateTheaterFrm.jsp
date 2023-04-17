<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>극장 수정</title>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp"></jsp:include>
            <div id="layoutSidenav">
                <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">극장 관리</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">극장 수정</li>
                            </ol>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                입력 양식
                            </div>
                            <div class="card-body">
                                <div class="container">
                                    <h1>극장 수정</h1>
                                    <form action="/updateTheater.do" method="post">
                                        <input type="hidden" name="theaterNo" value="${theater.theaterNo}">
                                        <div class="form-group">
                                            <label for="theaterLocal" class="my-2">지역</label>
                                            <c:choose>
                                                <c:when test="${theater.theaterLocal == '서울'}">
                                                    <select class="form-select" id="theaterLocal" name="theaterLocal"
                                                        aria-label="Default select example">
                                                        <option value="서울" selected>서울</option>
                                                        <option value="경기">경기</option>
                                                        <option value="인천">인천</option>
                                                        <option value="대전/충청/세종">대전/충청/세종</option>
                                                        <option value="부산/대구/경상">부산/대구/경상</option>
                                                        <option value="광주/전라">광주/전라</option>
                                                        <option value="강원">강원</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterLocal == '경기'}">
                                                    <select class="form-select" id="theaterLocal" name="theaterLocal"
                                                        aria-label="Default select example">
                                                        <option value="서울">서울</option>
                                                        <option value="경기" selected>경기</option>
                                                        <option value="인천">인천</option>
                                                        <option value="대전/충청/세종">대전/충청/세종</option>
                                                        <option value="부산/대구/경상">부산/대구/경상</option>
                                                        <option value="광주/전라">광주/전라</option>
                                                        <option value="강원">강원</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterLocal == '인천'}">
                                                    <select class="form-select" id="theaterLocal" name="theaterLocal"
                                                        aria-label="Default select example">
                                                        <option value="서울">서울</option>
                                                        <option value="경기">경기</option>
                                                        <option value="인천" selected>인천</option>
                                                        <option value="대전/충청/세종">대전/충청/세종</option>
                                                        <option value="부산/대구/경상">부산/대구/경상</option>
                                                        <option value="광주/전라">광주/전라</option>
                                                        <option value="강원">강원</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterLocal == '대전/충청/세종'}">
                                                    <select class="form-select" id="theaterLocal" name="theaterLocal"
                                                        aria-label="Default select example">
                                                        <option value="서울">서울</option>
                                                        <option value="경기">경기</option>
                                                        <option value="인천">인천</option>
                                                        <option value="대전/충청/세종" selected>대전/충청/세종</option>
                                                        <option value="부산/대구/경상">부산/대구/경상</option>
                                                        <option value="광주/전라">광주/전라</option>
                                                        <option value="강원">강원</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterLocal == '부산/대구/경상'}">
                                                    <select class="form-select" id="theaterLocal" name="theaterLocal"
                                                        aria-label="Default select example">
                                                        <option value="서울">서울</option>
                                                        <option value="경기">경기</option>
                                                        <option value="인천">인천</option>
                                                        <option value="대전/충청/세종">대전/충청/세종</option>
                                                        <option value="부산/대구/경상" selected>부산/대구/경상</option>
                                                        <option value="광주/전라">광주/전라</option>
                                                        <option value="강원">강원</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterLocal == '광주/전라'}">
                                                    <select class="form-select" id="theaterLocal" name="theaterLocal"
                                                        aria-label="Default select example">
                                                        <option value="서울">서울</option>
                                                        <option value="경기">경기</option>
                                                        <option value="인천">인천</option>
                                                        <option value="대전/충청/세종">대전/충청/세종</option>
                                                        <option value="부산/대구/경상">부산/대구/경상</option>
                                                        <option value="광주/전라" selected>광주/전라</option>
                                                        <option value="강원">강원</option>
                                                    </select>
                                                </c:when>
                                                <c:otherwise>
                                                    <select class="form-select" id="theaterLocal" name="theaterLocal"
                                                        aria-label="Default select example">
                                                        <option value="서울">서울</option>
                                                        <option value="경기">경기</option>
                                                        <option value="인천">인천</option>
                                                        <option value="대전/충청/세종">대전/충청/세종</option>
                                                        <option value="부산/대구/경상">부산/대구/경상</option>
                                                        <option value="광주/전라">광주/전라</option>
                                                        <option value="강원" selected>강원</option>
                                                    </select>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label for="theaterBranch" class="my-2"></label>
                                            <input type="text" class="form-control" id="theaterBranch"
                                                name="theaterBranch" value="${theater.theaterBranch}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="theaterAddr" class="my-2"></label>
                                            <input type="text" class="form-control" id="theaterAddr" name="theaterAddr"
                                                value="${theater.theaterAddr}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="theaterFacility" class="my-2">보유 시설</label>
                                            <c:choose>
                                                <c:when test="${theater.theaterFacility == '부티크'}">
                                                    <select class="form-select" id="theaterFacility"
                                                        name="theaterFacility" aria-label="Default select example">
                                                        <option value="부티크" selected>부티크</option>
                                                        <option value="MX">MX</option>
                                                        <option value="장애인석">장애인석</option>
                                                        <option value="스위트룸">스위트룸</option>
                                                        <option value="돌비">돌비</option>
                                                        <option value="컴포트">컴포트</option>
                                                        <option value="스페셜석">스페셜석</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterFacility == 'MX'}">
                                                    <select class="form-select" id="theaterFacility"
                                                        name="theaterFacility" aria-label="Default select example">
                                                        <option value="부티크">부티크</option>
                                                        <option value="MX" selected>MX</option>
                                                        <option value="장애인석">장애인석</option>
                                                        <option value="스위트룸">스위트룸</option>
                                                        <option value="돌비">돌비</option>
                                                        <option value="컴포트">컴포트</option>
                                                        <option value="스페셜석">스페셜석</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterFacility == '장애인석'}">
                                                    <select class="form-select" id="theaterFacility"
                                                        name="theaterFacility" aria-label="Default select example">
                                                        <option value="부티크">부티크</option>
                                                        <option value="MX">MX</option>
                                                        <option value="장애인석" selected>장애인석</option>
                                                        <option value="스위트룸">스위트룸</option>
                                                        <option value="돌비">돌비</option>
                                                        <option value="컴포트">컴포트</option>
                                                        <option value="스페셜석">스페셜석</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterFacility == '스위트룸'}">
                                                    <select class="form-select" id="theaterFacility"
                                                        name="theaterFacility" aria-label="Default select example">
                                                        <option value="부티크">부티크</option>
                                                        <option value="MX">MX</option>
                                                        <option value="장애인석">장애인석</option>
                                                        <option value="스위트룸" selected>스위트룸</option>
                                                        <option value="돌비">돌비</option>
                                                        <option value="컴포트">컴포트</option>
                                                        <option value="스페셜석">스페셜석</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterFacility == '돌비'}">
                                                    <select class="form-select" id="theaterFacility"
                                                        name="theaterFacility" aria-label="Default select example">
                                                        <option value="부티크">부티크</option>
                                                        <option value="MX">MX</option>
                                                        <option value="장애인석">장애인석</option>
                                                        <option value="스위트룸">스위트룸</option>
                                                        <option value="돌비" selected>돌비</option>
                                                        <option value="컴포트">컴포트</option>
                                                        <option value="스페셜석">스페셜석</option>
                                                    </select>
                                                </c:when>
                                                <c:when test="${theater.theaterFacility == '컴포트'}">
                                                    <select class="form-select" id="theaterFacility"
                                                        name="theaterFacility" aria-label="Default select example">
                                                        <option value="부티크">부티크</option>
                                                        <option value="MX">MX</option>
                                                        <option value="장애인석">장애인석</option>
                                                        <option value="스위트룸">스위트룸</option>
                                                        <option value="돌비">돌비</option>
                                                        <option value="컴포트" selected>컴포트</option>
                                                        <option value="스페셜석">스페셜석</option>
                                                    </select>
                                                </c:when>
                                                <c:otherwise>
                                                    <select class="form-select" id="theaterFacility"
                                                        name="theaterFacility" aria-label="Default select example">
                                                        <option value="부티크">부티크</option>
                                                        <option value="MX">MX</option>
                                                        <option value="장애인석">장애인석</option>
                                                        <option value="스위트룸">스위트룸</option>
                                                        <option value="돌비">돌비</option>
                                                        <option value="컴포트">컴포트</option>
                                                        <option value="스페셜석" selected>스페셜석</option>
                                                    </select>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label for="theaterContent" class="my-2">극장 설명</label>
                                            <textarea class="form-control" id="theaterContent" name="theaterContent"
                                                rows="3" required>${theater.theaterContent}</textarea>
                                        </div>
                                        <div class="row">
                                            <div class="col text-center">
                                                <button class="btn btn-primary my-3" type="submit">극장 수정</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </main>
                    <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
                </div>
                <script>
                    $("#theaterContent").summernote({
                        height: 400,
                        lang: "ko-KR",
                        callbacks: {
                            onImageUpload: function (files) {
                                uploadImage(files[0], this);
                            }
                        }
                    });
                </script>
        </body>


        </html>