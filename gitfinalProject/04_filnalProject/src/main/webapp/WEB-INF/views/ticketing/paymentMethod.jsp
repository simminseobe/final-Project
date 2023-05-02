<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

			<link rel="stylesheet"
				href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
			<link rel="stylesheet" href="/resources/css/ticketing/payment_modal.css">
			<style>
				.content-all-wrap {
					position: relative;
					margin-bottom: 100px;
				}

				.content-title-wrap {
					border-top: 1px solid black;
					width: 640px;
					overflow: hidden;
				}

				.content-title {
					height: 50px;
					padding-top: 10px;
					padding-bottom: 10px;
				}

				.title-p {
					font-size: 20px;
					width: 400px;
					height: 30px;
					line-height: 30px;
					float: left;
				}

				.content-wrap {
					width: 640px;
					height: 500px;
				}

				#reset-btn {
					border: 1px solid #d8d9db;
					border-radius: 5px;
					width: 80px;
					height: 30px;
					font-size: 15px;
					background-color: #fff;
					float: right;
				}

				#reset-btn:hover {
					color: #444;
					background-color: #f2f4f8;
					border-color: #666;
					cursor: pointer;
				}



				.discount-type {
					position: relative;
					height: 55px;
					line-height: 30px;
					margin-left: 0;
					margin-bottom: 10px;
					border: 1px solid #d8d9db;
					font-weight: bold;
				}

				.discount-type>p {
					width: 500px;
					height: 55px;
					line-height: 55px;
					margin-right: 0;
					margin-left: 15px;
					font-size: 16px;
					float: left;
				}

				.more {
					top: 15px;
					position: absolute;
					font-size: 25px;
					color: #666;
					display: block;
					float: left;
					right: 20px;
					line-height: 55px;
					transition-duration: 0.7s;
				}

				.more:hover {
					cursor: pointer;
				}

				.active {
					transform: rotate(180deg);
				}

				.sub-div {
					overflow: hidden;
					display: none;
					width: 100%;
				}

				.sub-discount {
					float: left;
					border: 1px solid #d8d9db;
					width: 150px;
					height: 60px;
					line-height: 60px;
					margin-right: 5px;
					margin-bottom: 5px;
				}

				.sub-discount>p {
					text-align: center;
					font-size: 13px;
				}

				.content-result {
					overflow: hidden;
					position: absolute;
					left: 680px;
					top: 0;
					width: 300px;
					height: 550px;
					margin-left: 10px;
					color: #fff;
					background-color: #333;
					border-radius: 10px;
					padding: 5px 5px 5px 0;
				}

				.result-wrap {
					position: relative;
					width: 300px;
					height: 550px;
				}

				.result-head {
					overflow: hidden;
					position: relative;
					margin: 10px;
					height: 130px;
				}

				.result-title {
					padding: 10px 20px;
				}

				.result-title>p {
					font-size: 19px;

				}

				.result-branch>p {
					padding: 20px 0 20px 20px;
					color: #c4c4c4
				}

				.dayAndTime {
					overflow: hidden;
					padding: 0 20px;
				}

				.result-day {
					float: left;
					padding-right: 60px;
				}

				.result-day>p {
					color: #c4c4c4
				}

				.result-time {
					float: left;
					overflow: hidden;
				}

				.result-time>span {
					float: left;
					font-size: 15px;
					padding-right: 5px;
					color: #c4c4c4
				}

				.result-time>p {
					margin: 0;
					float: left;
					color: #c4c4c4
				}

				.interim {
					position: relative;
				}

				.minus {
					position: absolute;
					top: 120px;
					left: 135px;
					width: 30px;
					height: 30px;
					line-height: 30px;
					text-align: center;
					border-radius: 20px;
					background-color: #329eb1;
					text-align: center;
				}

				.result-price {
					margin: 5px 10px;
					height: 130px;
					background-color: #555;
				}

				.price-wrap {
					padding: 10px;
				}

				.choice-age {
					height: 20px;
					margin-top: 5px;
				}

				.people-age {
					float: left;
					margin-right: 5px;
					color: #c4c4c4
				}

				.people-count {
					float: left;
				}

				.price-amount-same {
					float: right;
					color: #c4c4c4
				}

				.price-box {
					overflow: hidden;
					padding-top: 10px;
					margin-top: 10px;
					border-top: 1px solid #666;
				}

				.price-tit {
					height: 40px;
					line-height: 40px;
					font-size: 13px;
					float: left;
				}

				.price-money {
					overflow: hidden;
					float: right;
				}

				.price-amount {
					display: block;
					float: left;
					padding: 0 0 0 5px;
					line-height: 35px;
					font-size: 15px;
				}

				.price-won {
					display: block;
					float: left;
					padding: 0 0 0 5px;
					line-height: 35px;
					font-size: 15px;
				}



				.result-discount {
					margin: 10px;
					height: 90px;
					background-color: #555;
				}

				.discount-wrap {
					padding: 10px 10px 10px 0;
					width: 650px;
				}

				.add-discount {
					padding: 10px;
				}

				.discount-box {
					overflow: hidden;
					padding-top: 10px;
					margin-top: 15px;
					border-top: 1px solid #666;
				}

				.discount-tit {
					height: 40px;
					line-height: 40px;
					font-size: 13px;
					float: left;
				}

				.discount-money {
					overflow: hidden;
					float: right;
				}

				.discount-amount {
					display: block;
					float: left;
					padding: 0 0 0 5px;
					line-height: 35px;
					font-size: 15px;
				}

				.discount-won {
					display: block;
					float: left;
					padding: 0 0 0 5px;
					line-height: 35px;
					font-size: 15px;
				}



				.result-pay-wrap {
					margin: 20px 10px;
				}

				.result-pay {
					width: 260px;
					margin: 0 auto;
					padding: 50px 0 10px 0;
					height: 50px;
				}

				.pay-tit {
					float: left;
					line-height: 35px;
					font-size: 15px;
				}

				.money {
					float: right;
				}

				.amount {
					display: block;
					float: left;
					line-height: 35px;
					font-size: 24px;
					color: #59bec9;
					font-weight: 400;
				}

				.won {
					display: block;
					float: right;
					padding: 0 0 0 5px;
					line-height: 35px;
					font-size: 15px;
				}

				.result-btn {
					position: absolute;
					overflow: hidden;
					bottom: 15px;
					width: 100%;
					height: 40px;
					overflow: hidden;
				}

				.pagePrevious {
					border: 0;
					display: block;
					float: left;
					margin: 0;
					width: 150px;
					height: 40px;
					line-height: 40px;
					background-color: #53565b;
					color: #fff;
					font-size: 20px;
					text-align: center;
				}

				.pagePrevious,
				.paying:hover {
					cursor: pointer;
				}

				.mega-point>p:hover {
					cursor: pointer;
				}

				.mega-voucher>p:hover {
					cursor: pointer;
				}

				#usePoint,
				#useGiftTicketConfirm {
					cursor: pointer;
				}

				input[type=reset]:hover {
					cursor: pointer;
				}

				.paying {
					border: 0;
					display: block;
					float: left;
					margin: 0;
					width: 150px;
					height: 40px;
					line-height: 40px;
					background-color: #329eb1;
					color: #fff;
					font-size: 20px;
					text-align: center;
				}
			</style>
		</head>

		<body>
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
			<div class="all-wrap" style="width: 1000px; margin: 0 auto;">
				<div class="header-line" style="height: 100px;"></div>
				<div class="header-wrap">
					<div class="header-title" style="margin-top: 30px; margin-bottom: 30px;">
						<h1 style="font-size: 30px;">빠른예매</h1>
					</div>
				</div>
				<div class="content-all-wrap">

					<div class="content-title-wrap">
						<div class="content-title">
							<p class="title-p">관람권 및 할인적용</p>
							
							<button type="button" id="reset-btn">초기화</button>
						</div>
					</div>

					<div class="content-wrap">
						<div class="discount-wrap mMoint">
							<div class="discount-type">
								<p>메가박스 포인트</p>
								<span class="material-symbols-outlined more">expand_more</span>
							</div>
							<div class="sub-div">
								<div class="sub-discount mega-point">
									<p>메가박스 멤버쉽 포인트</p>
								</div>
								

							</div>
						</div>
						<div class="discount-wrap voucher">
							<div class="discount-type">
								<p>관람권/모바일상품권</p>
								<span class="material-symbols-outlined more">expand_more</span>
							</div>
							<div class="sub-div">
								<div class="sub-discount mega-voucher">
									<p>메가박스 관람권</p>
								</div>
								<!--
								<div class="sub-discount">
									<p>스토어교환권</p>
								</div>
								-->

							</div>
						</div>
						<div class="hiddennn" style="width: 100px; height: 100px;">${payNo.payNo}</div>
						<!--
					<div class="discount-wrap etc-point">
						<div class="discount-type">
							<p>제휴포인트</p>
							<span class="material-symbols-outlined more">expand_more</span>
						</div>
						<div class="sub-div">
							<div class="sub-discount">
								<p>U+ 멤버쉽</p>
							</div>
							<div class="sub-discount">
								<p>OK 캐쉬백</p>
							</div>
							<div class="sub-discount">
								<p>L.POINT</p>
							</div>
							<div class="sub-discount">
								<p>GS & POINT</p>
							</div>
							<div class="sub-discount">
								<p>현대오일뱅크</p>
							</div>
							<div class="sub-discount">
								<p>해피포인트</p>
							</div>
							<div class="sub-discount">
								<p>블루멤버스 포인트</p>
							</div>
							<div class="sub-discount">
								<p>중앙멤버쉽</p>
							</div>
							<div class="sub-discount">
								<p>현대 M 포인트카드</p>
							</div>
							<div class="sub-discount">
								<p>해피머니상품권 해피캐시</p>
							</div>
							<div class="sub-discount">
								<p>도서상품권 북앤라이프캐시</p>
							</div>
							<div class="sub-discount">
								<p>문화상품권 컬쳐캐시</p>
							</div>
							<div class="sub-discount">
								<p>문화누리카드</p>
							</div>
						</div>
					</div>
					-->
						<input type="hidden" class="ssMemberNo" name="memberNo" value=${sessionScope.m.memberNo }>
						<div class="hidden" style="display: none;">
							<span class="ssMemberPhone">${sessionScope.m.memberPhone}</span>
							<span class="sNum">${ticketingInfo.scheduleNo}</span>
							<span class="seats">${ticketingInfo.joinSeats}</span>
						</div>

					</div>
					<div class="filter-test" style="display: none;">Test</div>
					<!--
								var payPrice;
								var movieTitle;
								var choiceDtDay;
								var sNum;
								
								movieTitle =  $(".result-title>p").text();
								memberNo = $(".ssMemberNo").text();
								choiceDtDay = $(".result-day>p").text();
								sNum = $(".sNum").text();
								const tAge = $(".people-age").text();
								
								
				-->
					<!--포인트 사용 (모달)-->
					<div class="modal-wrap">
						<div class="point-modal">
							<div class="modal-top">
								<h1>포인트사용</h1>
								<button type="button" id="selectPoint" style="display: none;">포인트 조회</button>
							</div>
							<div class="modal-content">
								<div>
									<input type="text" name="usePoint" value="0" placeholder="사용하실 포인트를 입력하세요"><button
										id="usePoint">사용</button>
									<input type="text" name="addPoint" style="display: none; width: 150px; float: left; margin: 0;"><button id="addPoint"
										style="display: none; float: left;">클릭</button>
									<input type="reset" value="닫기">
									<div class="point-view">
										<span>잔여포인트 : </span>
										<span class="remaining-point"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--관람권 사용 (모달)-->
					<div class="modal2-wrap">
						<div class="gTicket-modal">
							<div class="modal2-top">
								<h1>관람권사용</h1>
							</div>
							<div class="modal2-content">
								<div>
									
									<input type="text" name="useGiftTicketSerial" placeholder="관람권의 시리얼번호를 입력하세요">
									<button id="useGiftTicketConfirm">사용</button>
									<button id="useGiftTicket" style="display: none;">사용</button>
									<input type="reset" value="닫기">
								</div>
							</div>
						</div>
					</div>

					<div class="content-result">
						<div class="result-wrap">
							<div class="result-head">
								<div class="result-title">
									<p>${ticketingInfo.movieTitle}</p>
								</div>
								<div class="result-branch">
									<p>${ticketingInfo.theaterBranch}</p>
								</div>

								<div class="dayAndTime">
									<div class="result-day">
										<p>${ticketingInfo.choiceDtDay}</p>
									</div>
									<div class="result-time">
										<span class="material-symbols-outlined">
											schedule
										</span>
										<p>${ticketingInfo.scheduleStartEnd}</p>
									</div>
								</div>
							</div>
							<div class="interim">
								<span class="material-symbols-outlined minus" style="line-height: 130%;">remove</span>
								<div class="result-price">
									<div class="price-wrap">
										<div class="choice-age">
											<p class="people-age">${ticketingInfo.numOfPeople}</p>
											<p class="hidden-pp-age" style="display: none;">${ticketingInfo.countArr}</p>

											<div class="price-money-same">
												<span class="price-amount-same">${ticketingInfo.totalAmount}</span>
											</div>
										</div>
										<div class="price-box">
											<p class="price-tit">금액</p>
											<div class="price-money">
												<span class="price-amount">${ticketingInfo.totalAmount}</span>
												<span class="price-won">원</span>
											</div>
										</div>
									</div>
								</div>
								<div class="result-discount">
									<div class="add-discount">
										<div class="discount-box">
											<p class="discount-tit">할인적용</p>
											<div class="discount-money">
												<span class="discount-amount">0</span>
												<input type="hidden" id="dc-amount">
												<span class="discount-won">원</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="result-pay-wrap">
								<div class="result-pay">
									<p class="pay-tit">최종결제금액</p>
									<div class="money">
										<span class="amount">0</span>
										<input type="hidden" id="finalAmount">
										<span class="won">원</span>
									</div>
								</div>
							</div>
							<div class="result-btn">
								<button href="/choiceSeat.do" class="pagePrevious">이전</button>
								<button class="paying">결제</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
				

				






				$(".more").on("click", function () {
					var subDiv = $(this).parent().next(".sub-div");
					$(".sub-div").not(subDiv).slideUp(); // 다른 .sub-div 요소들을 닫음
					$(this).toggleClass("active"); //현재 효과가 적용된 곳에는 .active 추가
					$(".more").not($(this)).removeClass("active");
					; // 다른 .more 요소들의 active 클래스 제거
					$(this).children(".more").toggleClass("active");
					; // 현재 클릭한 .discount-type의 하위 .more 요소의 active 클래스 토글
					subDiv.slideToggle();
					; // 현재 클릭한 .discount-type의 다음 .sub-div 요소를 슬라이드 업/다운
					event.stopPropagation(); //이벤트버블링 막기
				});
				/*
				var totalAmount;
				totalAmount = $(".price-amount").text();
				var discountAmount;
				discountAmount = $('.discount-amount').text();
				console.log(totalAmount+": 윗블럭 금액(,포함)");
				console.log(discountAmount+": 아래블럭 할인적용(,포함)");
				
				const numericTotalAmount = totalAmount.replace(/[^0-9.-]+/g,"");
				const numericDiscountAmount = discountAmount.replace(/[^0-9.-]+/g,"");
				const finalAmount = numericTotalAmount - numericDiscountAmount;
				$('span.amount').text(finalAmount.toLocaleString());
				console.log("화면에 출력되는 최종결제금액 : "+totalAmount);
				$("#finalAmount").val(finalAmount);
				console.log("전달될 최종결제금액 : "+finalAmount);
	
				$(".pagePrevious").on("click",function(){
					location.href="/ticketing.do";
				});
	
				$(".voucher div.sub-div>.mega-voucher").on("click",function(){
					$(".discount-amount").text(totalAmount);
					console.log("관람권이라 "+totalAmount+" 원 전액할인");
					const numericTotalAmount = totalAmount.replace(/[^0-9.-]+/g,"");
					const numericDiscountAmount = discountAmount.replace(/[^0-9.-]+/g,"");
					const finalAmount = numericTotalAmount - numericDiscountAmount;
					$('span.amount').text(finalAmount.toLocaleString());
					console.log("화면에 출력되는 최종결제금액 : "+totalAmount);
					$("#finalAmount").val(finalAmount);
					console.log("전달될 최종결제금액 : "+finalAmount);
				});
				*/
				var totalAmount;	//윗블럭의 인원 수 옆 금액(,있음)
				var discountAmount;	//아랫블럭의 할인적용 금액
				//var topBlockAmount; // 윗블럭금액(,있음)
				var filterTopBlockAmount; // 윗블럭금액(,없음)
				//var bottomBlockAmount; // 아랫블럭금액(할인금액)(,있음)
				var filterBottomBlockAmount; // 아랫블럭금액(할인금액)(,없음)
				var finalAmount;	//최종결제금액(,있음)
				var notFilterFinalAmount;
				var filterFinalAmount; //최종결제금액(,없음)



				totalAmount = $(".price-amount-same").text();
				discountAmount = $(".discount-amount").text();
				filterTotalAmount = totalAmount.replace(/[^0-9.-]+/g, "");
				filterDiscountAmount = discountAmount.replace(/[^0-9.-]+/g, "");
				console.log("totalAmount :" + totalAmount);	//30,000
				console.log("discountAmount :" + discountAmount); //0
				console.log("filterTotalAmount :" + filterTotalAmount);//30000
				console.log("filterDiscountAmount :" + filterDiscountAmount); //0
				//finalAmount = totalAmount - discountAmount;
				//console.log("finalAmount :"+finalAmount);//30000
				filterFinalAmount = filterTotalAmount - filterDiscountAmount;
				console.log("filterFinalAmount :" + filterFinalAmount);//30000
				$('span.amount').text(filterFinalAmount.toLocaleString());
				$('#finalAmount').val(filterFinalAmount);
				console.log("filterFinalAmount :" + filterFinalAmount);//30000

				//포인트 버튼 눌러서 사용할 포인트 값 입력하는 모달창 띄우기
				$(".mMoint div.sub-div>.mega-point").on("click", function () {
					$(".modal-wrap").css("display", "flex");
					$("#selectPoint").click();
				});
				//사용할 포인트 input에 입력 -> 사용 시 할인금액에 적용
				var usePoint;
				var pointToDiscountAmount;
				$("#usePoint").on("click",function(){
					usePoint = $("[name=usePoint]").val();
					pointToDiscountAmount = $(".discount-amount").text(usePoint);
					closeModal();
					discountUsingPoint();
				});

				//닫기 버튼 클릭 시 closeModal()함수 호출
				$("input[type=reset]").on("click", function () {
					closeModal();
				});
				//닫는 closeModal()함수
				function closeModal() {
					$(".modal-wrap").css("display", "none");
					$(".modal2-wrap").css("display", "none");
				}
				/*
				//포인트 사용 시(선택금액)
				$(".mMoint div.sub-div>.mega-point").on("click", function () {
					$(".modal-wrap").css("display", "flex");
					$("#selectPoint").click();
				});
				$("#usePoint").on("click", function () {
					usePoint = $("[name=usePoint]").val();
					memberNo = $("[name=memberNo]").val();
					console.log("포인트 사용할 회원의 memberNo : " + memberNo);
					$.ajax({
						url: "/usePoint.do",
						type: "get",
						data: { usePoint: usePoint, memberNo: memberNo },
						success: function (data) {
							console.log(data)
							if (data == "ok") {
								alert("사용성공");
								closeModal();
								discountUsingPoint();
							} else {
								alert("사용실패");
							}
						}
					});
				});
				*/
				
				//calculator
				function discountUsingPoint() {
					console.log("userPoint" + usePoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
					const priceAmountSame = $(".price-amount-same").text();
					const filterPriceAmountSame = priceAmountSame.toString().replace(',', '');
					const filterUsePoint = usePoint.toString().replace(',', '');
					$(".discount-amount").text(usePoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
					const usePointAfterAmount = filterPriceAmountSame - filterUsePoint;
					console.log(priceAmountSame);
					console.log(filterPriceAmountSame);
					console.log(filterUsePoint);
					console.log(usePointAfterAmount);
					$(".amount").text(usePointAfterAmount.toLocaleString());
					$("#dc-amount").text(filterUsePoint);
					$("#finalAmount").text(usePointAfterAmount);
					$("#finalAmount").val(usePointAfterAmount);
				}
				
				//잔여포인트 조회
				$("#selectPoint").on("click",function(){
					memberNo = $(".ssMemberNo").val();

					$.ajax({
						url : "/selectPoint.do",
						type : "post",
						data : {memberNo:memberNo},
						dataType : "json",
						success : function(data){
							console.log(data);
							$(".remaining-point").text(data);
							
						}
					});
				});
				
				/*
				var memberNo = $(".ssMemberNo").text();
				$.ajax({
					url : "/selectPoint.do",
					type : "post",
					data : {memberNo:memberNo},
					dataType : "json",
					success : function(data){
						console.log(data);
					}
				});
				const priceAmountSame = $(".price-amount-same").text();
				const filterPriceAmountSame = priceAmountSame.toString().replace(',', '');
				const usePoint = filterPriceAmountSame * 0.6;
				$(".discount-amount").text(usePoint.toLocaleString());
				const usePointAfterAmount = filterPriceAmountSame - usePoint;
				console.log(priceAmountSame);
				console.log(filterPriceAmountSame);
				console.log(usePoint);
				console.log(usePointAfterAmount);
				$(".amount").text(usePointAfterAmount.toLocaleString());
				$("#finalAmount").text(usePointAfterAmount);
				*/


				//관람권 사용 시 모달 띄우기
				$(".voucher div.sub-div>.mega-voucher").on("click", function () {
					$(".modal2-wrap").css("display", "flex");
				});
				//사용할 관람권시리얼번호 input에 입력 -> 사용 시 할인금액에 적용
				var giftTicketSerial;
				var gTicketToDiscountAmount;
				$("#useGiftTicket").on("click",function(){
					

					closeModal();
				});

				/*
				//관람권 사용
				$("#useGiftTicket").on("click", function () {
					giftTicketSerial = $("[name=useGiftTicketSerial]").val();
					memberNo = $("[name=memberNo]").val();
					console.log(memberNo);
					$.ajax({
						url: "/useGiftTicket.do",
						type: "get",
						data: { giftTicketSerial: giftTicketSerial, memberNo: memberNo },
						success: function (data) {
							console.log(data)
							if (data == "ok") {
								alert("사용성공");
								closeModal();
								discountUsingGiftTicket();
							} else {
								alert("사용실패");
							}

						}

					});
				});
				
				*/
				$('#useGiftTicketConfirm').click(function() {
					if (!confirm("관람권할인은 취소할 수 없습니다. 관람권을 사용하시겠습니까?")) {
						alert("취소하셨습니다.");
					} else {
						$("#useGiftTicket").click();
					}
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
									alert("관람권을 사용하셨습니다.");
									discountUsingGiftTicket();
								}else{
									alert("사용실패.");
								}
								
							}
							
						});	
					});
				/*
				$(".filter-test").on("click",function(){
					discountUsingGiftTicket();
				});
				*/
				//관람권 50%적용 필터링(문자열과 정수사이)
				function discountUsingGiftTicket() {

					//할인 전 금액(,포함)
					const bigTopAmount = $(".price-amount").text();
					console.log("price-amount(,포함) : " + bigTopAmount);//18,000
					
					//할인 전 금액(,제외)
					const filterSmallTopAmount = $(".price-amount-same").text().toString().replace(',', '');
					console.log("price-amount-same : " + filterSmallTopAmount);	//18,000

					//할인금액(,제외)
					const filterPerSmallTopAmount = parseInt(filterSmallTopAmount)*0.5;
					console.log("input#dc-amount에 들어갈 금액 : "+filterPerSmallTopAmount);
					//할인금액(,포함)
					const perSmallTopAmount = filterPerSmallTopAmount.toLocaleString();
					console.log(".discount-amount에 들어갈 금액 : "+perSmallTopAmount);

					//최종결제금액(,제외)
					const filterBotAmount = filterSmallTopAmount-filterPerSmallTopAmount;
					console.log("input#finalAmount에 들어갈 금액 : "+filterBotAmount);
					//최종결제금액(,포함)
					const botAmount = filterBotAmount.toLocaleString();
					console.log(".amount에 들어갈 금액 : "+botAmount);
					
					//////////////////////////////////////////////////////////
					$(".discount-amount").text(perSmallTopAmount);
					$("#dc-amount").val(filterPerSmallTopAmount);
					$(".amount").text(botAmount);
					$("#finalAmount").val(filterBotAmount);
					

				}
				/*되면 삭제
				function discountUsingGiftTicket() {
					const priceAmountSame = $(".price-amount-same").text();
					const buttonAfterTotalAmont = $(".price-amount").text();
					const buttonAfterDiscountAmont = $(".discount-amount").text(priceAmountSame);
					console.log("나와라 좀" + priceAmountSame);	//18,000
					console.log("나와라 좀" + buttonAfterTotalAmont);//18,000
					console.log("나와라 좀" + buttonAfterDiscountAmont.text());//18,000
					const buttonAfterDiscountAmontt = buttonAfterDiscountAmont.text();
					console.log(buttonAfterDiscountAmont+"*50%" + buttonAfterDiscountAmontt);//18,000

					filterButtonAfterTotalAmont = buttonAfterTotalAmont.toString().replace(',', '');
					filterButtonAfterDiscountAmont = buttonAfterDiscountAmontt.toString().replace(',', '');
					console.log("나와라 좀 제발" + filterButtonAfterTotalAmont);//18000
					console.log("나와라 좀 제발" + filterButtonAfterDiscountAmont);//18000

					const buttonAfterFinalAmount = filterButtonAfterTotalAmont - filterButtonAfterDiscountAmont;
					console.log(buttonAfterFinalAmount);
					$('span.amount').text(buttonAfterFinalAmount); // 0이기 떄문에 .toLocaleString() 생략
					$('#finalAmount').val(buttonAfterFinalAmount);
				}
				*/
				$(".pagePrevious").on("click", function () {
					history.back();
				});

				var payPrice;
				var movieTitle;
				var theaterBranch;
				var memberNo;
				var scheduleStart;
				var memberPhone;

				var usedPoint;
				var addTarget;
				var addPoint;

				$(".paying").on("click", function () {
					payPrice = $("#finalAmount").val();	//input안의 값은 val() / 태그사이 값은 text()
					console.log(payPrice + " <-결제로 보낼 금액 재확인");
					const d = new Date();
					const date = d.getFullYear() + "" + (d.getMonth() + 1) + "" + d.getDate()
						+ "" + d.getHours() + "" + d.getMinutes() + "" + d.getSeconds();
					theaterBranch = $(".result-branch>p").text();
					scheduleStart = $(".result-time>p").text().substr(0, 5);
					memberNo = $(".ssMemberNo").val();
					memberPhone = $(".ssMemberPhone").text();
					//하이픈(-) 제거
					memberHyphenPhone = $(".ssMemberPhone").text().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3").replace("--", "-");;


					movieTitle = $(".result-title>p").text();
					choiceDtDay = $(".result-day>p").text();
					scheduleNo = $(".sNum").text();
					joinSeats = $(".seats").text();
					numOfPeople = $(".people-age").text();
					countArr = $(".hidden-pp-age").text();
					usePoint = $("[name=usePoint]").val();

					console.log("movieTitle :" + movieTitle);
					console.log("theaterBranch :" + theaterBranch);
					console.log("choiceDtDay :" + choiceDtDay);
					console.log("scheduleStart :" + scheduleStart);
					console.log("numOfPeople :" + numOfPeople);
					console.log("joinSeats :" + joinSeats);
					console.log("memberNo :" + memberNo);
					console.log("memberPhone :" + memberPhone);//하이픈(-) 없음
					console.log("memberHyphenPhone :" + memberHyphenPhone);//하이픈(-) 있음
					console.log("payPrice :" + payPrice);
					console.log("countArr :" + countArr);
					console.log("usePoint :" + usePoint);
					var pointAmount = usePoint;
					console.log("pointAmount :" + pointAmount);

					if (payPrice == 0) {
						location.href = "/ticketingComplete.do?movieTitle=" + movieTitle + "&theaterBranch=" + theaterBranch + "&choiceDtDay=" + choiceDtDay + "&scheduleStart=" + scheduleStart + "&numOfPeople=" + numOfPeople + "&joinSeats=" + joinSeats + "&memberPhone=" + memberPhone + "&payPrice=" + payPrice;
					} else {
						//console.log(payPrice + "," + memberNo + "," + choiceDtDay + "," + scheduleNo + "," + joinSeats + "," + numOfPeople);
						IMP.init("imp04040307");
						IMP.request_pay({
							pg: "html5_inicis",
							merchant_uid: "상품번호_" + date,	//상점에서 관리하는 주문번호
							name: movieTitle,	//결제이름
							amount: payPrice,		//결제금액
							buyer_email: "${sessionScope.m.memberEmail}",
							buyer_name: "${sessionScope.m.memberName}",
							buyer_tel: "${sessionScope.m.memberPhone}",
						}, function (rsp) {
							if (rsp.success) {
								alert("결제성공");

								$.ajax({
									url: "/paymentPage.do",
									type: "post",
									data: { payPrice: payPrice, memberNo: memberNo, choiceDtDay: choiceDtDay, countArr: countArr, joinSeats: joinSeats, scheduleNo: scheduleNo, pointAmount: pointAmount },
									dataType: "json",
									success: function (data) {
										if (data == 'fail') {
											alert('결제실패')
										} else {
											alert("결제등록성공");
											console.log(data);
											console.log(data.memberNo);//undefined (insert라 상관없음)
											console.log(data.pointAmount);//undefined (insert라 상관없음)
											console.log(data.payNo);
											const payNo = data.payNo;
											//
											
											$("#addPoint").click();
											//$("#useGiftTicket").click();
											
											location.href = "/ticketingComplete.do?movieTitle=" + movieTitle + "&theaterBranch=" + theaterBranch + "&choiceDtDay=" + choiceDtDay + "&scheduleStart=" + scheduleStart + "&numOfPeople=" + numOfPeople + "&joinSeats=" + joinSeats + "&memberHyphenPhone=" + memberHyphenPhone + "&payPrice=" + payPrice + "&payNo=" + payNo;


										}


									}
								});
							} else {
								alert("결제실패");
							}
						});
					}
				});
				////////////////////////////////////////////////////////////////////////////




				////////////////////////////////////////////////////////////////////////////

				$("#reset-btn").on("click", function () {
					usePoint = $("[name=usePoint]");
					var original = $(".price-amount-same");
					//usePoint = document.getElementsByName("name");
					//discountAmount = $(".discount-amount").text();
					//giftTicketSerial = $("[name=useGiftTicketSerial]").val();
					location.reload();
					/*
					if (discountAmount !== 0) {
						
						
						console.log("현재 할인금액 : "+discountAmount);
						$(".discount-amount").text("0");

							usePoint.val("0");
							$("#dc-amount").val(0);
							$("#dc-amount").text(0);
							console.log(usePoint);
							console.log($(".discount-amount").text());
							$(".amount").text(original.text());
							//const filterAmount = original.toString().replace(',', '');
						}
					*/
				});
				
				
				$(".pagePrevious").on("click", function () {
					history.back();
				});
				
					
					$("#addPoint").on("click",function(){
						/*
					usedPoint = $("[name=usePoint]").val();
					console.log("usedPoint : "+usedPoint);
					addTarget = $("[name=addPoint]").val(usedPoint);
					console.log("addTarget : "+addTarget);
					*/
					var savedMoney = $("#finalAmount").val();
					console.log("savedMoney : "+savedMoney);
					addPoint = savedMoney*0.1;
					console.log("savedMoney : "+savedMoney+" *10% = addPoint : "+addPoint);
					memberNo = $("[name=memberNo]").val();
					console.log("memberNo : "+memberNo);
					$.ajax({
						url : "/addPoint.do",
						type: "get",
						data: {addPoint:addPoint , memberNo:memberNo},
						success : function(data){
							console.log(data)
							if(data=="ok"){
								alert("적립성공");
								console.log("memberNo : "+memberNo);
								console.log("savedMoney : "+savedMoney);
								console.log("savedMoney : "+savedMoney+" *10% = addPoint : "+addPoint);
							}else{
								alert("실패");
							}
							
						}
						
					});	
					
				});
			
				//$("#addPoint").click();
				/*
			
					$("#addPoint").on("click", function () {
						usePoint = $("[name=usePoint]");
						const addHidden = document.querySelector('input[name=addPoint]');
						addHidden.value = usedPoint;
						console.log(usedPoint);
						console.log(addHidden.value);
						const addPoint = addHidden.value;
						console.log(addPoint);
						memberNo = $("[name=memberNo]").val();
						console.log(memberNo);
						$.ajax({
							url: "/addPoint.do",
							type: "get",
							data: { addPoint: addPoint, memberNo: memberNo },
							success: function (data) {
								console.log(data)
								if (data == "ok") {
									alert("포인트 사용취소");
									console.log("memberNo :"+memberNo);
									console.log("취소되어 재적립될 포인트 :"+addPoint);
									
									const before = $(".price-amount-same").text();
									const calc = $(".discount-amount").text("0");
									console.log(before);
									console.log(calc);
									
								} else {
									alert("포인트 사용취소실패");
								}

							}

						});
					});
				*/
				/*
				var addPoint;
				function addPointFunc() {
					usePoint = $("[name=usePoint]").val();
					addPoint = $("[name=addPoint]").val(usePoint);
					var zero = $(".discount-amount").text();
					memberNo = $("[name=memberNo]").val();
					console.log(memberNo);
					console.log(addPoint.val());
					$.ajax({
						url: "/addPoint.do",
						type: "get",
						data: { addPoint: addPoint, memberNo: memberNo },
						success: function (data) {
							console.log(data)
							if (data == "ok") {
								alert("포인트 사용취소");
								
								
								//zero.text(0);
							} else {
								alert("포인트 사용취소실패");
							}

						}

					});
				}
				*/
				function addGiftTicketFunc() {
					var zero = $(".discount-amount").text();
					giftTicketSerial = $("[name=useGiftTicketSerial]").val();
					memberNo = $("[name=memberNo]").val();
					console.log(memberNo);
					$.ajax({
						url: "/useGiftTicket.do",
						type: "get",
						data: { giftTicketSerial: giftTicketSerial, memberNo: memberNo },
						success: function (data) {
							console.log(data)
							if (data == "ok") {
								alert("관람권 사용취소");
								$("[name=useGiftTicketSerial]").val().empty();
								zero.text().empty();
							} else {
								alert("관람권 사용취소실패");
							}

						}

					});
				}

				

			</script>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</body>

		</html>