<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>상영 스케줄 관리</title>

        <style>
            /* body 스타일 */
            html,
            body {
                /* overflow: hidden; */
                font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
                font-size: 14px;
            }

            /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
            .fc-header-toolbar {
                padding-top: 1em;
                padding-left: 1em;
                padding-right: 1em;
            }

            #theater-select {
                float: left;
            }
        </style>
    </head>

    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp"></jsp:include>
        <div id="layoutSidenav">
            <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상영 스케줄 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">스케줄 달력</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                날짜 드래그 후 영화와 상영관 선택
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                달력
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-1 mb-3">
                                            <select class="form-select form-select-lg"
                                                aria-label=".form-select-lg example" id="movie-local-selected">
                                                <option value="서울" selected>서울</option>
                                                <option value="경기">경기</option>
                                                <option value="인천">인천</option>
                                                <option value="대전/충청/세종">대전/충청/세종</option>
                                                <option value="부산/대구/경상">부산/대구/경상</option>
                                                <option value="광주/전라">광주/전라</option>
                                                <option value="강원">강원</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-2 mb-3" id="movie-branch">
                                            <select class="form-select form-select-lg"
                                                aria-label=".form-select-lg example" id="movie-branch-selected">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div id='calendar'></div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
            </div>
        </div>
        <script>
            $(document).ready(function (theaterBranch) {
                // $("#movie-branch-selected").children().eq(0).prop("selected", true);

                selectScheduleCalendar();
            });

            $("#movie-branch-selected").on("change", function () {
                let theaterBranch = $(this).val();

                selectScheduleCalendar(theaterBranch);
            });

            $("#movie-local-selected").on("change", function () {
                const theaterLocal = $(this).val();

                $.ajax({
                    url: "/selectBranchList.do",
                    type: "get",
                    data: { theaterLocal: theaterLocal },
                    success: function (data) {
                        const branchSelect = $("#movie-branch-selected");
                        branchSelect.empty();

                        for (var i = 0; i < data.length; i++) {
                            const option = $("<option>").val(data[i].theaterBranch).text(data[i].theaterBranch);
                            branchSelect.append(option);
                        }
                    }
                });
            });

            function selectScheduleCalendar(theaterBranch) {
                $.ajax({
                    url: "/selectScheduleCalendar.do", // 변경하기
                    method: "GET",
                    dataType: "json",
                    data: { theaterBranch: theaterBranch },
                    success: function (data) {
                        console.log(data); // log 로 데이터 찍어주기.
                        let today = new Date();

                        var calendarEl = document.getElementById('calendar');

                        var calendar = new FullCalendar.Calendar(calendarEl, {
                            initialDate: today,
                            initialView: 'dayGridMonth',
                            headerToolbar: {
                                left: 'prev,next today',
                                center: 'title',
                                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                            },
                            editable: true,
                            droppable: true, // this allows things to be dropped onto the calendar
                            drop: function (arg) {
                                // is the "remove after drop" checkbox checked?
                                if (document.getElementById('drop-remove').checked) {
                                    // if so, remove the element from the "Draggable Events" list
                                    arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                                }
                            },
                            /**
                             * data 로 값이 넘어온다. log 값 전달.
                             */
                            events: data
                        });

                        calendar.render();
                    },
                    error: function (jqXHR, textStatus) {
                        alert("Request failed: " + textStatus);
                    }
                });
            };
        </script>
    </body>

    </html>