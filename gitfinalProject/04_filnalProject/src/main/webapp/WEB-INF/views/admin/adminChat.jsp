<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
					<div class="container-fluid px-4">
						<h1 class="mt-4">문의 관리</h1>
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
											<th>문의번호</th>
											<th>문의 주제</th>
											<th>문의자</th>
											<th>문의 날짜</th>
										</tr>
									</thead>

									<tbody>
										<c:choose>

											<c:when test="${empty inqueryList}">
												<tr>
													<td colspan="4" align="center">존재하는 채팅방이 없습니다.</td>
												</tr>
											</c:when>

											<c:otherwise>
												<c:forEach var="inquery" items="${inqueryList }">
													<tr>
														<td>${inquery.inqueryNo }</td>
														<td>
															${inquery.inqueryTitle }
															<c:if test="${!empty sessionScope.m.memberNo }">
																<button class="btn btn-primary"
																	onclick="location.href='/enterInquery.do'">
																	입장
																</button>
															</c:if>
														</td>
														<td>
															${inquery.inqueryMember }
														</td>
														<td>
															${inquery.inqueryDate }
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<!-- 로그인이 되어있는 경우 -->
								<c:if test="${!empty sessionScope.m.memberNo }">
									<div class="btn-area">
										<button type="button" class="btn btn-danger" data-bs-toggle="modal"
											data-bs-target="#inqueryModal">
											1대1 문의 하기
										</button>
									</div>
								</c:if>
								<div class="modal fade" id="inqueryModal">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<!-- 모달 해더 -->
											<div class="modal-header">
												<h4 class="modal-title">문의하기</h4>
												<button type="button" class="close"
													data-bs-dismiss="modal">&times;</button>
											</div>
											<form action="/registerInquery.do" method="post">
												<!--  모달 바디 -->
												<div class="modal-body">
													<label for="title" class="mr-sm-2">주제</label>
													<input type="text" class="form-controll mb-2 mr-sm-2"
														placeholder="문의 주제 작성" id="title" name="title">
												</div>

												<!-- 모달 푸터 -->
												<div class="modal-footer">
													<button type="submit" class="btn btn-primary">문의 상담 입장</button>
													<button type="button" class="btn btn-danger"
														data-bs-dismiss="modal">취소</button>
												</div>
											</form>
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

		</script>
	</body>


	</html>