<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/myPoint.css">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<style>
		.pointDetail{
			overflow: hidden;
			
		}
		.pointDetail>div{
			float: left;
			
		}
		.pointDetail>div:nth-child(1){
			font-size: 40px;
			color : #fff;
			font-weight: bold;
			background-color : #1d1e36;
			width: 45%;
			height: 200px;
			border-top-left-radius : 20px;
			border-bottom-left-radius : 20px;
			padding: 50px 90px;
		}
		.pointDetail>div:nth-child(2){
			font-size: 40px;
			color : #fff;
			font-weight: bold;
			background-color : #d6d6d6;
			width: 45%;
			height: 200px;
			border-top-right-radius : 20px;
			border-bottom-right-radius : 20px;
			padding: 50px 50px;
		}
		.pointDetail span{
			font-size: 60px;
			color : #59cf4c;
			font-weight: bold;
		}
		.nextGrade{
			font-size: 20px;
			color : #fff;
		}
	
	</style>
	<table>
	<td>
	<div class="menubar">
		<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
	<td>
	<div class="wrapper">
		<div class="booklist-wrap">
			<div class="booklist-header">
				<h2>포인트 내역</h2>
			</div>
			<div class="pointDetail">
			<div>사용가능포인트<br><span>&nbsp;${mpAmount } P</span></div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재 등급<br>
				<c:if test="${sessionScope.m.memberLevel == 3}">
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VIP</span>
		</c:if>
		<c:if test="${sessionScope.m.memberLevel == 2}">
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GOLD</span><br>
		<div class="nextGrade">&nbsp;&nbsp;&nbsp;다음 등급까지 ${12000-mpAmount } P 남았습니다.</div>
		</c:if>
		<c:if test="${sessionScope.m.memberLevel == 1}">
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WHITE</span><br>
		<div class="nextGrade">&nbsp;&nbsp;&nbsp;다음 등급까지 ${6000-mpAmount } P 남았습니다.</div>
		</c:if>
			</div>
			</div>
			<div class="tab-content">
				<table>
					<tbody>
						<tr>
							<th>일자</th>
							<th>구분</th>
							<th>포인트</th>
						</tr>
						<c:forEach items="${list}" var="point" varStatus="i">
						<tr>
							<td>${point.pointDate }</td>
							<td>${point.pointStatus }</td>
							<td>${point.pointAmount }</td>
						</tr>
						</c:forEach>							
						<tr>
						<!-- 페이징 처리 -->
							<th colspan="9">${pageNavi }</th>
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
						• 사용 가능 포인트는 현재 기준 온,오프라인에서 실제 사용 가능한 포인트입니다.<br><br>
						• 1년 이내 적립포인트가 6,000점 이상일 경우 GOLD, 12,000점 이상일 경우 VIP로 자동 승급됩니다.
					</div>
				</div>

			</div>
			
		</div>
	</div>
				</td>
</table>

	<script src="/resources/js/member/purchaseDetail.js" ></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />