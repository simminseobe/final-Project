<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/purchaseDetail.css">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<table>
	<td>
	<div class="menubar">
		<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
	<td>
	<div class="wrapper">
		<div class="booklist-wrap">
			<div class="booklist-header">
				<h2>예매 내역</h2>
			</div>
			<div class="menu-wrap">
				<ul class="tabs">
					<li class="active-tab">예매</li>
					<li>구매</li>
				</ul>
			</div>

			<div class="tab-content">
				<table>
					<tbody>
						<c:forEach items="${list}" var="p" varStatus="i">
						<tr>
							<th>예매번호</th>
							<th>영화제목</th>
							<th>상영관</th>
							<th>좌석번호</th>
							<th>상영날짜</th>
							<th>영화 시작시간</th>
							<th>영화 종료시간</th>
							<th>인원수</th>
							<th>결제금액</th>
						</tr>
						<tr>
							<td>${p.payNo }</td>
							<td>${p.movieTitle }</td>
							<td>${p.theaterBranch }</td>
							<td>${p.seat }</td>
							<td>${p.movieDate }</td>
							<td>${p.startTime }</td>
							<td>${p.endTime }</td>
							<td>${p.list }</td>
							<td>${p.payPrice }</td>
						</tr>
						</c:forEach>							
						<tr>
						<!-- 페이징 처리 -->
							<th colspan="9">${pageNavi }</th>
						</tr>
					</tbody>
				</table>

				<div class="second-header">
					<h2>예매취소내역</h2>
				</div>
				<ul class="first-line">
					<li>상영일 기준 7일간 취소내역을 확인하실 수 있습니다.</li>
				</ul>
				<table>
					<tbody>
					<c:forEach items="${list2}" var="p2" varStatus="i">
						<tr>
							<th>예매번호</th>
							<th>영화제목</th>
							<th>상영관</th>
							<th>좌석번호</th>
							<th>상영날짜</th>
							<th>인원수</th>
							<th>취소금액</th>
						</tr>
						<tr>
							<td>${p2.payNo }</td>
							<td>${p2.movieTitle }</td>
							<td>${p2.theaterBranch }</td>
							<td>${p2.seat }</td>
							<td>${p2.movieDate }</td>
							<td>${p2.list }</td>
							<td>${p2.payPrice }</td>
						</tr>
					</c:forEach>
						<tr>
						<!-- 페이징 처리 -->
							<th colspan="7">${pageNavi }</th>
						</tr>
					</tbody>
				</table>

				<p>
					<!--btn-primary -->
					<button class="btn collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseExample"
						aria-expanded="false" aria-controls="collapseExample">
						이용안내 <i class="nextImg active-btn icon"></i>
					</button>
				</p>
				<div class="collapse" id="collapseExample">
					<div class="card card-body">
						<b>[예매 안내]</b><br> 만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.<br>
						예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.<br> 메가박스 모바일앱을 이용할 경우
						티켓출력없이 모바일티켓을 통해 바로 입장하실 수 있습니다.<br>
						<br> <b>[티켓교환 안내]</b><br> 극장의 무인발권기(KIOSK)를 통해 예매번호 또는
						고객확인번호(생년월일+휴대폰번호)를 입력하여 편리하게 티켓을 발권하실 수 있습니다.<br> 무인발권기 이용이
						어려우신경우, 티켓교환권을 출력하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다.<br> (티켓교환권
						출력이 어려운경우 예매번호와 신분증을 지참하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다)<br>
						<br> <b>[예매취소 안내]</b><br> 온라인(홈페이지/모바일) 예매 취소는 상영시간
						20분전까지 입니다.<br> 위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.<br>
						LIVE 공연 콘텐트는 취소 기준은 아래와 같습니다.<br> 관람 4일전 : 취소 가능<br> 관람
						3일 ~ 1일전 : 취소 수수료 부담 후 취소 가능<br> 관람 당일 : 취소 및 환불 불가<br>
						공연 관람시 시작 시간 이후에는 입장이 제한 됩니다.<br> 발권된 티켓은 상영시간 전까지 현장 방문 시에만
						취소가 가능합니다.<br>
					</div>
				</div>

			</div>
			<div class="tab-content">

				<div class="second-header">
					<h2>구매내역</h2>
				</div>
				<table>
					<tbody>
						<tr>
							<th>결제일시</th>
							<th>구분</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>상태</th>
						</tr>
						<tr>
							<td>2023-01-01</td>
							<td>스토어</td>
							<td>팝콘</td>
							<td>14,000</td>
							<td>
								<button type="button" class="my-btn my-blue">구매취소</button>
							</td>
						</tr>
						<tr>
							<th colspan="5">${pageNavi }</th>
						</tr>
					</tbody>
				</table>

				<p>
					<!--btn-primary -->
					<button class="btn collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseExample"
						aria-expanded="false" aria-controls="collapseExample">
						이용안내</button>
				</p>
				<div class="collapse" id="collapseExample">
					<div class="card card-body">
						<b>[스토어 구매/취소 안내]</b><br> 스토어 상품은 구매 후 취소가능기간 내 100% 환불이
						가능하며, 부분환불은 불가 합니다.<br> (ex. 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만
						가능하며 그 중 사용하신 쿠폰이 있는 경우 환불이 불가합니다)<br> 스토어 교환권은 MMS로 최대 1회
						재전송 하실 수 있습니다.<br> <br> <b>[모바일오더 구매/취소 안내]</b><br>
						ⓘ 모바일오더는 모바일앱을 통해 이용하실 수 있습니다.<br> 모바일오더는 구매 후 즉시 조리되는 상품으로
						취소가 불가 합니다.<br> 극장 매점에서 주문번호가 호출되면 상품을 수령하실 수 있습니다.<br>
						극장 상황에 따라 상품준비시간이 다소 길어질 수 있습니다.<br>
					</div>
				</div>

			</div>
			<!-- 페이징 처리 -->
		</div>
	</div>
				</td>
</table>

	<script src="/resources/js/member/purchaseDetail.js" ></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />