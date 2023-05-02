<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp"></jsp:include>
        <div id="layoutSidenav">
            <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">관리자 홈</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자 통계</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-secondary text-white mb-4">
                                    <div class="card-body">가입자</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/manageMember.do">${memberCnt}
                                            명</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">영화</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/MovieList.do">${movieCnt}
                                            개</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-info text-white mb-4">
                                    <div class="card-body">스케줄</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link"
                                            href="/screenSchedule.do">${scheduleCnt}
                                            개</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">1대1 문의</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link"
                                            href="/adminConsultation.do">${consultationCnt} 개</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar me-1"></i>
                                    일별 매출액
                                </div>
                                <div class="card-body">
                                    <canvas id="myAreaChart" width="100%" height="40"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                관리자 리스트
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
                                            <c:if test="${member.memberLevel eq 0}">
                                                <tr>
                                                    <td>${member.memberNo}</td>
                                                    <td>${member.memberId}</td>
                                                    <td>${member.memberName}</td>
                                                    <td>${member.memberPhone}</td>
                                                    <td>${member.memberBirthYear}</td>
                                                    <td>${member.memberEmail}</td>
                                                    <td>${member.enrollDate}</td>
                                                    <td>${member.memberGender}</td>
                                                    <td>관리자</td>
                                                    <td>
                                                        <button class="update-member-btn btn btn-primary"
                                                            id="update-btn" data-bs-toggle="modal"
                                                            data-bs-target="#update-memberLevel-modal"
                                                            onclick="selectMemberNo(this);">등급 변경
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:if>
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
                                                        <label for="recipient-name" class="col-form-label">등급</label>
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
            var salelist = [];
            var datelist = [];

            $(document).ready(function () {
                $.ajax({
                    url: "/selectSalesPerDay.do",
                    type: "post",
                    async: false,
                    success: function (data) {
                        $.each(data, function () {
                            salelist.push(this["accumulatedrevenue"]);
                            datelist.push(this["month"]);

                            var ctx = document.getElementById("myAreaChart").getContext("2d");

                            var myLineChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: datelist,
                                    datasets: [{
                                        label: "일별 누적 매출 수",
                                        data: salelist,
                                        fill: true,
                                        lineTension: 0.3,
                                        backgroundColor: "rgba(2,117,216,0.2)",
                                        borderColor: "rgba(2,117,216,1)",
                                        pointRadius: 5,
                                        pointBackgroundColor: "rgba(2,117,216,1)",
                                        pointBorderColor: "rgba(255,255,255,0.8)",
                                        pointHoverRadius: 5,
                                        pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                        pointHitRadius: 10,
                                        pointBorderWidth: 2
                                    }]
                                },
                                options: {
                                    scales: {
                                        xAxes: [{
                                            display: true,
                                            scaleLabel: {
                                                display: true,
                                                labelString: 'Date'
                                            }
                                        }],
                                        yAxes: [{
                                            display: true,
                                            scaleLabel: {
                                                display: true,
                                                labelString: '일별 매출액'
                                            },
                                            ticks: {
                                                beginAtZero: true,
                                                suggestedMax: 40000
                                            }
                                        }]
                                    },
                                    legend: {
                                        display: false
                                    }
                                }
                            });
                        });
                    }
                });
            });

            var memberNo;

            function selectMemberNo(button) {
                memberNo = $(button).parent().parent().children().eq(0).text();
            }

            function updateMemberLevel() {
                let memberLevel = $("#memberLevel").val();

                location.href = "/updateMemberLevel.do?memberNo=" + memberNo + "&memberLevel=" + memberLevel;
            }
        </script>
        <script src="resources/js/admin/chart-area-demo.js"></script>