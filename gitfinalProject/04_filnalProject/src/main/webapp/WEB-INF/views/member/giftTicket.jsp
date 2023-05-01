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
	<style>
		.addGiftTicketSerial{
			float: right;
		}
		#addGiftTicket{
			padding : 8px 8px;
			border-radius : 10px 10px 10px 10px;
			background-color : #fff;
			border-color : #503396;
			margin : 20px 10px;
		}
		[name=addGiftTicketSerial]{
			padding: 5px 5px;
			border: none;
    		outline: none;
    		border-bottom: 2px solid #503396;
		}
		.header-detail{
			padding: 0 50px;
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
				<h2>영화관람권</h2>
			</div>
			<div class="header-detail">
				• 보유하신 영화관람권/예매권 내역입니다.<br><br>
				• 소지하신 지류(종이)관람권은 등록 후 이용하실 수 있습니다.<br>
			</div>
			<div class="addGiftTicketSerial">
			 <input type="text" name="addGiftTicketSerial" placeholder="8자리 숫자 입력"><button id="addGiftTicket">관람권 등록</button>
			</div>
			<div class="tab-content">
				<table>
					<tbody>
						<tr>
							<th>일련번호</th>
							<th>티켓명</th>
							<th>유효기간</th>
							<th>상태</th>
						</tr>
						<c:forEach items="${list}" var="giftTicket" varStatus="i">
						<tr>
							<td>${giftTicket.giftTicketSerial }</td>
							<td>${giftTicket.giftTicketName }</td>
							<td>${giftTicket.giftTicketDate }</td>
							<td>${giftTicket.giftTicketStatus }</td>
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
						• 등록된 관람권은 홈페이지/모바일 예매 시 사용하실 수 있으며, 스크래치가 개봉된 지류(종이)관람권은 현장사용이 불가합니다.<br><br>
• 관람권으로 예매 후 취소한 경우, 사용하신 관람권은 유효기간 내 재사용할 수 있습니다.<br><br>
• 유효기간이 지난 관람권은 사용이 불가합니다. (관람일 기준)<br><br>
• 관람권은 금액권이 아니므로 관람하시는 영화의 티켓 가격 대비 차액은 환급되지 않습니다.<br><br>
• (조조/청소년 등 할인가격 영화 관람 시 차액 환불 불가)<br><br>
• 관람권 종류에 따라 규정된 사용정책이 다르니, 사용전 관람권정보를 확인바랍니다.<br><br>
• 관람권 사용 시, 관람권별로 규정된 멤버십 포인트가 적립됩니다.<br><br>
					</div>
				</div>

			</div>
			
		</div>
	</div>
				</td>
</table>

	<script src="/resources/js/member/purchaseDetail.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
   $("#addGiftTicket").on("click",function(){
    	const giftTicketSerial = $("[name=addGiftTicketSerial]").val();
    	const memberNo = $("[name=memberNo]").val();
    	console.log(memberNo);
		$.ajax({
			url : "/addGiftTicket.do",
			type: "get",
			data: {giftTicketSerial:giftTicketSerial , memberNo:memberNo},
			success : function(data){
				console.log(data)
				if(data=="ok"){
					alert("등록에 성공하였습니다.");
				}else{
					alert("이미 등록된 관람권입니다.");
				}
				
			}
			
		});	
	});
   
   $("#useGiftTicket").on("click",function(){
   	const giftTicketSerial = $("[name=useGiftTicketSerial]").val();
   	const memberNo = $("[name=memberNo]").val();
   	console.log(memberNo);
		$.ajax({
			url : "/useGiftTicket.do",
			type: "get",
			data: {giftTicketSerial:giftTicketSerial , memberNo:memberNo},
			success : function(data){
				console.log(data)
				if(data=="ok"){
					alert("사용성공.");
				}else{
					alert("사용실패.");
				}
				
			}
			
		});	
	});
   
   
   
   $(document).ready(function(){
	   
	   
	});
   

</script>
	