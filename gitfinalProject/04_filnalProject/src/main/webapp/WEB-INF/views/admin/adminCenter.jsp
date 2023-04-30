<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <!-- Templates BootStrap 5.2.3 기반 -->
        <link href="/resources/css/admin/styles.css" rel="stylesheet" />
        <link href="/resources/css/admin/adminCenter.css" rel="stylesheet" />
        <title>고객센터</title>
        <style>
            .container {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
        <div id="contents">
            <h2 class="tit">1:1 문의</h2>
            <div class="mypage-infomation mb30">
                <ul class="dot-list">
                    <li><span style="font-weight: bold;">고객님의 문의에 답변하는 직원은 <span style="color: #EB323A;">고객 여러분의 가족
                                중 한 사람일 수
                                있습니다.</span></span><br>
                        고객의 언어폭력(비하, 욕설, 협박, 성희롱 등)으로부터 직원을 보호하기 위해<br>
                        관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.<br>
                    </li>
                </ul>

            </div>

            <div class="agree-box">
                <dl>
                    <dt>
                        <span class="bg-chk mr10">
                            <input type="checkbox" id="chk">
                            <label for="chk" id="chk-lable"><strong>개인정보 수집에 대한 동의</strong></label>
                        </span>
                        <span class="font-orange">[필수]</span>
                    </dt>
                    <dd style="font-size:13px;">
                        귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집·이용에 대한 본인동의가 필요한 항목입니다.<br><br>

                        [개인정보의 수집 및 이용목적]<br>
                        회사는 1:1 문의 내역의 확인, 요청사항 처리 또는 완료 시 원활한 의사소통 경로 확보를 위해 수집하고 있습니다.<br><br>

                        [필수 수집하는 개인정보의 항목]<br>
                        아이디, IP주소, 문의 제목, 채팅 내역<br><br>

                        [개인정보의 보유기간 및 이용기간]<br>
                        <span class="ismsimp">문의 접수 ~ 처리 완료 후 3년<br>
                            (단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는 관계 법령에 따라 보존)<br>
                            자세한 내용은 '개인정보 처리방침'을 확인하시기 바랍니다.</span>
                    </dd>
                </dl>
            </div>
            <p class="reset mt10">* 원활한 서비스 이용을 위한 최소한의 개인정보이므로 동의하지 않을 경우 서비스를 이용하실 수 없습니다</p>
            <!-- 로그인이 되어있는 경우 -->
            <c:if test="${!empty sessionScope.m }">
                <div class="btn-area d-flex justify-content-center mt-5">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#consultationModal" id="consultation-btn">
                        1대1 상담 하기
                    </button>
                </div>
            </c:if>
            <div class="modal fade" id="consultationModal">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <!-- 모달 해더 -->
                        <div class="modal-header">
                            <h4 class="modal-title">1대1 상담하기</h4>
                            <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                        </div>
                        <!--  모달 바디 -->
                        <div class="modal-body">
                            <label for="title" class="mr-sm-2">주제</label>
                            <input type="text" class="form-controll mb-2 mr-sm-2" placeholder="상담 주제 작성" id="title"
                                name="title" required>
                            <input type="hidden" id="memberId" value="${sessionScope.m.memberId}">
                        </div>
                        <!-- 모달 푸터 -->
                        <div class="modal-footer">
                            <button class="btn btn-primary" onclick="registerConsultation()">상담
                                채팅
                                입장</button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="memberId" value="${sessionScope.m.memberId}">
        <input type="hidden" id="memberLevel" value="${sessionScope.m.memberLevel}">
        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        <script>
            $(document).ready(function () {
                toggleButton();

                $('#chk').change(function () {
                    toggleButton();
                });

                function toggleButton() {
                    if ($('#chk').is(':checked')) {
                        $('[data-bs-target="#consultationModal"]').prop('disabled', false);
                    } else {
                        $('[data-bs-target="#consultationModal"]').prop('disabled', true);
                    }
                }
            });

            function registerConsultation() {
                let consultationTitle = $("#title").val();
                let consultationMember = $("#memberId").val();
                let memberLevel = $("#memberLevel").val();

                $.ajax({
                    url: "/registerConsultation.do",
                    method: "POST",
                    data: { consultationTitle: consultationTitle, consultationMember: consultationMember },
                    async: false,
                    success: function (result) {
                        if (result > 0) {
                            location.href = "/adminChat.do?consultationNo=" + Number(result) + "&chatMember=" + consultationMember + "&memberLevel=" + memberLevel;
                        } else {
                            alert("문의 내용을 확인해주세요.");
                        }
                    },
                });
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
    </body>

    </html>