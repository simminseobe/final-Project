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
                                                <option disabled>선택</option>
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
            $(document).ready(function () {
                const theaterLocal = "서울";

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

                selectScheduleCalendar("강남");
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

                        let firstBranch = branchSelect.children().eq(0).val();

                        selectScheduleCalendar(firstBranch);
                    }
                });
            });

            function selectScheduleCalendar(theaterBranch) {
                var calendarDiv = document.getElementById('calendar');
                var initialLocaleCode = 'ko';
                var localeSelectorEl = $('#locale-selector');

                $.ajax({
                    url: "/selectScheduleCalendar.do",
                    method: "GET",
                    dataType: "json",
                    data: { theaterBranch: theaterBranch },
                    success: function (data) {
                        let today = new Date();

                        var calendar = new FullCalendar.Calendar(calendarDiv, {
                            timeZone: 'local',
                            initialDate: today,
                            initialView: 'timeGridWeek',
                            headerToolbar: {
                                left: 'prev,next today',
                                center: 'title',
                                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                            },
                            navLinks: true,
                            editable: true,
                            selectable: true,
                            droppable: true,

                            eventAdd: function () {
                                console.log();
                            },

                            select: function (arg) {
                                var title;
                                var title = prompt('영화를 입력해주세요.');

                                if (title) {
                                    $.ajax({
                                        url: "/dupTitleChk.do",
                                        type: "post",
                                        data: { movieTitle: title },
                                        async: false,
                                        success: function (data) {
                                            if (data == "null") {
                                                alert("없는 영화 이름입니다");
                                                title = null;
                                            }
                                        },
                                        error: function () {
                                            console.log("에러발생");
                                        }
                                    });
                                }

                                if (title) {
                                    calendar.addEvent({
                                        title: title,
                                        start: arg.start,
                                        end: arg.end,
                                        allDay: arg.allDay,
                                    });
                                }

                                var obj = new Object();

                                obj.title = title;
                                obj.start = arg.start;
                                obj.end = arg.end;
                                obj.branch = theaterBranch;

                                if (title) {
                                    $.ajax({
                                        url: "/registerSchedule.do",
                                        method: "POST",
                                        dataType: "json",
                                        data: JSON.stringify(obj),
                                        contentType: 'application/json',
                                        success: function (result) {
                                            if (result > 0) {
                                                console.log(result);

                                                selectScheduleCalendar(theaterBranch);
                                            }
                                        },
                                    });
                                }

                                calendar.unselect();
                            },

                            eventDrop: function (info) {
                                if (confirm("'" + info.event.title + "'의 일정을 수정하시겠습니까 ?")) {
                                    var obj = new Object();

                                    obj.oldTitle = info.oldEvent._def.title;
                                    obj.oldBranch = theaterBranch;
                                    obj.oldStart = info.oldEvent._instance.range.start;
                                    obj.oldEnd = info.oldEvent._instance.range.end;

                                    var scheduleNo;

                                    $.ajax({
                                        url: "/selectscheduleNo.do",
                                        method: "POST",
                                        dataType: "json",
                                        data: JSON.stringify(obj),
                                        contentType: 'application/json',
                                        async: false,
                                        success: function (data) {
                                            scheduleNo = data;
                                        },
                                    });

                                    var obj = new Object();

                                    obj.start = info.event._instance.range.start;
                                    obj.end = info.event._instance.range.end;
                                    obj.scheduleNo = scheduleNo;

                                    $.ajax({
                                        url: "/updateSchedule.do",
                                        method: "POST",
                                        dataType: "json",
                                        data: JSON.stringify(obj),
                                        contentType: 'application/json',
                                        success: function (result) {
                                            if (result > 0) {
                                                console.log(result);

                                                selectScheduleCalendar(theaterBranch);
                                            }
                                        },
                                    });

                                } else {
                                    selectScheduleCalendar(theaterBranch);
                                }
                            },

                            eventResize: function (info) {
                                if (confirm("'" + info.event.title + "'의 일정을 수정하시겠습니까 ?")) {
                                    var obj = new Object();

                                    obj.oldTitle = info.oldEvent._def.title;
                                    obj.oldBranch = theaterBranch;
                                    obj.oldStart = info.oldEvent._instance.range.start;
                                    obj.oldEnd = info.oldEvent._instance.range.end;

                                    var scheduleNo;

                                    $.ajax({
                                        url: "/selectscheduleNo.do",
                                        method: "POST",
                                        dataType: "json",
                                        data: JSON.stringify(obj),
                                        contentType: 'application/json',
                                        async: false,
                                        success: function (data) {
                                            scheduleNo = data;
                                        },
                                    });

                                    var obj = new Object();

                                    obj.start = info.event._instance.range.start;
                                    obj.end = info.event._instance.range.end;
                                    obj.scheduleNo = scheduleNo;

                                    $.ajax({
                                        url: "/updateSchedule.do",
                                        method: "POST",
                                        dataType: "json",
                                        data: JSON.stringify(obj),
                                        contentType: 'application/json',
                                        success: function (result) {
                                            if (result > 0) {
                                                console.log(result);

                                                selectScheduleCalendar(theaterBranch);
                                            }
                                        },
                                    });
                                } else {
                                    selectScheduleCalendar(theaterBranch);
                                }
                            },
                            // 클릭으로 일정 삭제
                            eventClick: function (info) {
                                if (confirm("'" + info.event.title + "' 의 일정을 삭제하시겠습니까 ?")) {
                                    // 확인 클릭 시
                                    info.event.remove();

                                    var obj = new Object();

                                    obj.oldTitle = info.event._def.title;
                                    obj.oldBranch = theaterBranch;
                                    obj.oldStart = info.event._instance.range.start;
                                    obj.oldEnd = info.event._instance.range.end;

                                    var scheduleNo;

                                    $.ajax({
                                        url: "/selectscheduleNo.do",
                                        method: "POST",
                                        dataType: "json",
                                        data: JSON.stringify(obj),
                                        contentType: 'application/json',
                                        async: false,
                                        success: function (data) {
                                            scheduleNo = data;
                                        },
                                    });

                                    var obj = new Object();

                                    obj.scheduleNo = scheduleNo;

                                    $.ajax({
                                        url: "/deleteSchedule.do",
                                        method: "POST",
                                        dataType: "json",
                                        data: JSON.stringify(obj),
                                        contentType: 'application/json',
                                        success: function (result) {
                                            if (result > 0) {
                                                selectScheduleCalendar(theaterBranch);
                                            }
                                        }
                                    })
                                } else {
                                    selectScheduleCalendar(theaterBranch);
                                }
                            },
                            events: data
                        });

                        calendar.render();
                    }
                });
            };
        </script>
    </body>

    </html>