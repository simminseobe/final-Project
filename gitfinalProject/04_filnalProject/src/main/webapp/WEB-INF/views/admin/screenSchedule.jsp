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
                overflow: hidden;
                font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
                font-size: 14px;
            }

            /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
            .fc-header-toolbar {
                padding-top: 1em;
                padding-left: 1em;
                padding-right: 1em;
            }
        </style>
    </head>

    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp"></jsp:include>
        <div id="layoutSidenav">
            <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <!-- calendar 태그 -->
                    <div id='calendar-container'>
                        <div id='calendar'></div>
                    </div>
                </main>
                <jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageFooter.jsp"></jsp:include>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                $(function () {
                    var request = $.ajax({
                        url: "/selectScheduleCalendar.do", // 변경하기
                        method: "GET",
                        dataType: "json"
                    });

                    request.done(function (data) {
                        console.log(data); // log 로 데이터 찍어주기.

                        var calendarEl = document.getElementById('calendar');

                        var calendar = new FullCalendar.Calendar(calendarEl, {
                            initialDate: '2022-02-07',
                            initialView: 'timeGridWeek',
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
                    });

                    request.fail(function (jqXHR, textStatus) {
                        alert("Request failed: " + textStatus);
                    });
                });

            });
        </script>
    </body>

    </html>