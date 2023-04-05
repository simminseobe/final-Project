<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
		<style>
			.date-list {
				border: 1px solid black;
			}

			.date-btn {
				font-size: 20px;
			}

			.choice-wrap {
				overflow: hidden;
			}

			.choice-movie {
				background-color: antiquewhite;
				height: 400px;
				width: 250px;
				float: left;
				padding-left: 20px;
				padding-right: 20px;
				padding-bottom: 20px;
			}

			.choice-theater {
				background-color: aqua;
				height: 400px;
				width: 300px;
				float: left;
				padding-left: 20px;
				padding-right: 20px;
				padding-bottom: 20px;
			}

			.choice-time {
				background-color: brown;
				height: 400px;
				width: 450px;
				float: left;
				padding-left: 20px;
				padding-right: 20px;
				padding-bottom: 20px;
			}

			.choice-header p {
				height: 40px;
				font-size: 20px;
				padding-top: 5px;
			}
		</style>
	</head>

	<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<div class="all-wrap" style="width:1000px; margin: 0 auto;">
			<div class="header-line" style="height:100px;"></div>
			<div class="header-wrap">
				<div class="header-title" style="margin-top:30px; margin-bottom:30px;">
					<h1 style="font-size:30px;">빠른예매</h1>
					<h1><a href="/choiceSeat.do">좌석선택(test)</a></h1>
					<h1><a href="/paymentMethod.do">결제수단(test)</a></h1>
				</div>
			</div>
			<div class="content-wrap" style="height:500px;">
				<div class="date-list" style="height:30px;">
					<!-- 이전 버튼 -->
					<button class="prev-date-btn">&lt;</button>

					<!-- 날짜 버튼들 -->
					<button class="date-btn">2022.03.01(화)</button>
					<button class="date-btn">2022.03.02(수)</button>
					<button class="date-btn">2022.03.03(목)</button>
					<!-- ... 중략 ... -->
					<button class="date-btn">2022.03.31(목)</button>

					<!-- 다음 버튼 -->
					<button class="next-date-btn">&gt;</button>
				</div>
				<div class="choice-wrap">
					<div class="choice-movie">
						<div class="choice choice-header">
							<p>영화</p>
							<div class="movie-list" style="background-color: #fff; height: 340px;">
								<h1><button onclick="test1()">영화목록</button></h1>
							</div>
						</div>
					</div>
					<div class="choice-theater">
						<div class="choice choice-header">
							<p>극장</p>
							<div class="theater-list" style="background-color: #fff; height: 340px;">

							</div>
						</div>
					</div>
					<div class="choice-time">
						<div class="choice choice-header">
							<p>시간</p>
							<div class="time-list" style="background-color: #fff; height: 340px;">

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<script>
			function test1(){

				
				$.ajax({
				url: "https://megabox.co.kr/on/oh/ohb/SimpleBooking/selectBokdList.do",
				type: "GET",
				success : function(data){
					console.log(data);

				}
			});
			
		}

		</script>
	</body>

	</html>