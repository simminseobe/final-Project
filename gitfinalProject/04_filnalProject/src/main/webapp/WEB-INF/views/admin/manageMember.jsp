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
                            <h1 class="mt-4">회원 관리</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">회원 목록</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-body">
                                    회원 탈퇴는 되지 않습니다.
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
                                                <th>아이디</th>
                                                <th>이름</th>
                                                <th>전화번호</th>
                                                <th>생년월일</th>
                                                <th>이메일</th>
                                                <th>가입일</th>
                                                <th>성별</th>
                                                <th>회원 등급</th>
                                                <th>등급 변경</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="member">
                                                <tr>
                                                    <td>${member.memberNo}</td>
                                                    <td>${member.memberId}</td>
                                                    <td>${member.memberName}</td>
                                                    <td>${member.memberPhone}</td>
                                                    <td>${member.memberBirthYear}</td>
                                                    <td>${member.memberEmail}</td>
                                                    <td>${member.enrollDate}</td>
                                                    <td>${member.memberGender}</td>
                                                    <c:choose>
                                                        <c:when test="${member.memberLevel eq 0}">
                                                            <td>관리자</td>
                                                        </c:when>
                                                        <c:when test="${member.memberLevel eq 1}">
                                                            <td>White</td>
                                                        </c:when>
                                                        <c:when test="${member.memberLevel eq 2}">
                                                            <td>Gold</td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td>Vip</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td>
                                                        <button class="update-member-btn btn btn-primary"
                                                            id="update-btn" data-bs-toggle="modal"
                                                            data-bs-target="#update-memberLevel-modal"
                                                            onclick="selectMemberNo(this);">등급 변경
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- Modal -->
                                    <div class="modal fade" id="update-memberLevel-modal" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">회원 등급 변경</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="mb-3">
                                                            <label for="recipient-name"
                                                                class="col-form-label">등급</label>
                                                            <select name="memberLevel" id="memberLevel"
                                                                class="form-select form-select-lg mb-3">
                                                                <option value="0">관리자</option>
                                                                <option value="1">White</option>
                                                                <option value="2">Gold</option>
                                                                <option value="3">Vip</option>
                                                            </select>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">닫기</button>
                                                    <button type="button" class="btn btn-primary"
                                                        onclick="updateMemberLevel();">수정</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                    <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
                </div>
            </div>
            <script>
                var memberNo;

                function selectMemberNo(button) {
                    memberNo = $(button).parent().parent().children().eq(0).text();
                }

                function updateMemberLevel() {
                    let memberLevel = $("#memberLevel").val();

                    location.href = "/updateMemberLevel.do?memberNo=" + memberNo + "&memberLevel=" + memberLevel;
                }
            </script>
        </body>

        </html>