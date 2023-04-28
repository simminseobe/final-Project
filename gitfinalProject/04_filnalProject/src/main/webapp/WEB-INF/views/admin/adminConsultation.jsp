<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>관리자 채팅창</title>
			<style>

			</style>
		</head>

		<body class="sb-nav-fixed">
			<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageHeader.jsp"></jsp:include>
			<div id="layoutSidenav">
				<jsp:include page="/WEB-INF/views/admin/adminCommon/adminPageSideBar.jsp"></jsp:include>
				<div id="layoutSidenav_content">
					<main>
						<input type="hidden" id="memberLevel" value="${sessionScope.m.memberLevel }">
						<div class="container-fluid px-4">
							<h1 class="mt-4">상담 관리</h1>
							<ol class="breadcrumb mb-4">
								<li class="breadcrumb-item active">1대1 상담 채팅</li>
							</ol>
							<div class="card mb-4">
								<div class="card-body">
									친절 항상!!
								</div>
							</div>
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table me-1"></i>
									채팅 리스트
								</div>
								<div class="card-body">
									<table class="table table-hover" align="center">
										<thead>
											<tr>
												<th>상담번호</th>
												<th>상담 주제</th>
												<th>상담자</th>
												<th>상담 날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty consultationsList}">
													<tr>
														<td colspan="4" align="center">존재하는 채팅방이 없습니다.</td>
													</tr>
												</c:when>

												<c:otherwise>
													<c:forEach var="consultation" items="${consultationsList }">
														<tr>
															<td>${consultation.consultationNo }</td>
															<td>
																${consultation.consultationTitle }
																<c:if test="${!empty sessionScope.m }">
																	<button class="btn btn-primary"
																		onclick="location.href = '/adminChat.do?consultationNo='+'${consultation.consultationNo }'+'&chatMember='+'${sessionScope.m.memberId }'+'&memberLevel'+'${sessionScope.m.memberLevel }'">
																		상담하기
																	</button>
																</c:if>
															</td>
															<td>
																${consultation.consultationMember }
															</td>
															<td>
																${consultation.consultationDate }
															</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<!-- 로그인이 되어있는 경우 -->
									<c:if test="${!empty sessionScope.m }">
										<div class="btn-area">
											<button type="button" class="btn btn-danger" data-bs-toggle="modal"
												data-bs-target="#consultationModal">
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
													<button type="button" class="close"
														data-bs-dismiss="modal">&times;</button>
												</div>
												<!--  모달 바디 -->
												<div class="modal-body">
													<label for="title" class="mr-sm-2">주제</label>
													<input type="text" class="form-controll mb-2 mr-sm-2"
														placeholder="상담 주제 작성" id="title" name="title" required>
													<input type="hidden" id="memberId"
														value="${sessionScope.m.memberId}">
												</div>
												<!-- 모달 푸터 -->
												<div class="modal-footer">
													<button class="btn btn-primary" onclick="registerConsultation()">상담
														채팅
														입장</button>
													<button type="button" class="btn btn-danger"
														data-bs-dismiss="modal">취소</button>
												</div>
											</div>
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
				function registerConsultation() {
					let consultationTitle = $("#title").val();
					let consultationMember = $("#memberId").val();
					let memberLevel = $("#memberLevel").val();

					console.log(consultationTitle);
					console.log(consultationMember);

					$.ajax({
						url: "/registerConsultation.do",
						method: "POST",
						data: { consultationTitle: consultationTitle, consultationMember: consultationMember, memberLevel: memberLevel },
						async: false,
						success: function (result) {
							console.log(result);
						},
					});
				}
			</script>
		</body>


		</html>