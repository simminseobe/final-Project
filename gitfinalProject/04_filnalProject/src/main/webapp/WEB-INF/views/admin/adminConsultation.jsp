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
									<table class="table table-hover" align="center" id="datatablesSimple">
										<thead>
											<tr>
												<th>상담번호</th>
												<th>상담 주제</th>
												<th>상담자</th>
												<th>상담 날짜</th>
												<th>상담 삭제</th>
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
																		onclick="location.href = '/adminChat.do?consultationNo='+'${consultation.consultationNo }'+'&chatMember='+'${sessionScope.m.memberId }'+'&memberLevel='+'${sessionScope.m.memberLevel }'">
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
															<td>
																<button class="btn btn-danger"
																	onclick="deleteConsultation(this);">
																	삭제
																</button>
															</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
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
				function deleteConsultation(button) {
					let consultationNo = $(button).parent().parent().children().eq(0).text();

					$.ajax({
						url: "/deleteConsultation.do",
						type: "post",
						data: { consultationNo: consultationNo },
						success: function (result) {
							if (result > 0) {
								alert("성공");
								location.reload();
							} else {
								alert("실패");
							}
						}
					});
				}
			</script>
		</body>

		</html>