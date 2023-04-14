<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
			<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
			<style>
				.date-list {
					border-top: 1px solid black;
				}

				/*
			.date-btn {
				font-size: 20px;
			}
			*/
				/*날짜부분*/
				.reserve-date {
					padding-top: 5px;
					display: flex;
					flex-direction: row;
					align-items: center;
					overflow: scroll;
					overflow-y: hidden;
				}

				.movie-date-wrapper {
					display: flex;
					justify-content: center;
					align-items: center;
					padding: 5px 2px;
					width: 100px;
					/* 버튼 가로 크기 조정 */
					/* 기타 버튼 스타일링 속성들 */
				}

				.movie-week-of-day {
					margin-left: 5px;
					font-size: 10px;
					width: 12px;
					height: 22px;
					line-height: 22px;
				}

				.movie-day {
					text-align: center;
					width: 34px;
					height: 22px;
					font-size: 17px;
					font-weight: bold;
				}

				.saturday {
					color: #31597E;
					font-weight: bold;
				}

				.sunday {
					color: #AF2D2D;
					font-weight: bold;
				}

				.movie-date-wrapper {
					background-color: transparent;
					border: 0;
				}

				.movie-date-wrapper-active {
					background-color: #333333;
				}

				.movie-date-wrapper-active>* {
					color: white;
				}

				/**/
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

				.content-wrap {
					margin-bottom: 200px;
				}

				.scroll-container{
					position: relative;

				}
				
				.oneMovie {
					position: relative;
					background-color: transparent;
					width: 100%;
					height: 20px;
					padding: 3px 30px 3px 30px;
					border: 0;
				}

				.age-12 {
					position: absolute;
					left: 5px;
					top: 3px;
					border: 1px solid orange;
					width: 20px;
				}

				.movie-title {
					position: absolute;
					left: 30px;
					top: 3px;
				}

				.heart {
					position: absolute;
					right: 5px;
					top: 3px;
					display: block;
					margin: 0 2px 0 0;
					font-size: 10px;
					width: 12px;
					height: 11px;
					font-variation-settings:
					'FILL' 0,
					'wght' 700,
					'GRAD' 0,
					'opsz' 20
				}
				
				

			</style>
		</head>

		<body>
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			<div class="all-wrap" style="width: 1000px; margin: 0 auto;">
				<div class="header-line" style="height: 100px;"></div>
				<div class="header-wrap">
					<div class="header-title" style="margin-top: 30px; margin-bottom: 30px;">
						<h1 style="font-size: 30px;">빠른예매</h1>
						<h1>
							<a href="/choiceSeat.do">좌석선택(test)</a>
						</h1>
						<h1>
							<a href="/paymentMethod.do">결제수단(test)</a>
						</h1>
						<button class="test1" id="jQ5">서버에서 리스트 데이터 받기</button>
						<p class="ajaxResult" id="result5" style="min-height: 100px; border: 2px solid #ccc;"></p>
						<button class="test2" id="jQ7">서버에서 리스트 데이터 받기</button>
						<p class="ajaxResult" id="result7" style="min-height: 100px; border: 2px solid #ccc;""></p>
						<!-- 
				<h1>
					<a href="/testPage.do">테스트페이지(test)</a>
				</h1>
				<h1>
					<a href="/testPage2.do">테스트페이지2(test)</a>
				</h1>
				-->
					</div>
				</div>
				<div class="content-wrap">
					<div class="date-list">


						<div class="day-part">
							<div class="reserve-title"></div>
							<div class="reserve-date"></div>
						</div>


					</div>




					<div class="choice-wrap">
						<div class="choice-movie">
							<div class="choice choice-header">
								<p>영화</p>
								<div class="list-area">
									<div class="movie-list" style="background-color: #fff; height: 340px;">
										<div class="scroll-container">
											<ul>
												<c:forEach items="${list }" var="movieList">
													<li>
														<button type="button" class="oneMovie">
															<span class="movie-grade age-12">${movieList.movieRating}</span>
															<span class="movie-title">${movieList.movieTitle}</span>
															<i class="material-symbols-outlined heart">favorite</i>
														</button>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="choice-theater">
							<div class="choice choice-header">
								<p>극장</p>
								<div class="theater-list" style="background-color: #fff; height: 340px;"></div>
							</div>
						</div>
						<div class="choice-time">
							<div class="choice choice-header">
								<p>시간</p>
								<div class="time-list" style="background-color: #fff; height: 340px;"></div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<script>
				const date = new Date();
				// console.log(date.getFullYear());
				const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
				const reserveDate = document.querySelector(".reserve-date");


				const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
				const year = date.getFullYear();
				const month = date.getMonth();
				for (i = date.getDate(); i <= lastDay.getDate(); i++) {

					const button = document.createElement("button");
					const spanWeekOfDay = document.createElement("span");
					const spanDay = document.createElement("span");

					//class넣기
					button.classList = "movie-date-wrapper"
					spanWeekOfDay.classList = "movie-week-of-day";
					spanDay.classList = "movie-day";

					//weekOfDay[new Date(2020-03-날짜)]
					const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

					//요일 넣기
					if (dayOfWeek === "토") {
						spanWeekOfDay.classList.add("saturday");
						spanDay.classList.add("saturday");
					} else if (dayOfWeek === "일") {
						spanWeekOfDay.classList.add("sunday");
						spanDay.classList.add("sunday");
					}
					spanWeekOfDay.innerHTML = dayOfWeek;
					button.append(spanWeekOfDay);
					//날짜 넣기
					spanDay.innerHTML = i;
					button.append(spanDay);
					//button.append(i);
					reserveDate.append(button);

					dayClickEvent(button);
				}




				function dayClickEvent(button) {
					button.addEventListener("click", function () {
						const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
						movieDateWrapperActive.forEach((list) => {
							list.classList.remove("movie-date-wrapper-active");
						})
						button.classList.add("movie-date-wrapper-active");
					})
				}
				
				
				
				
				function getMega(){
					console.log("꾹");
					$.ajax({
						url : "/ticketing.do",
						type : "get",
						success : function() {
							console.log("서버호출완료!");
						},
						error : function(){
							console.log("서버호출실패!");
						},
						complete : function(){
							console.log("무조건 호출");
						}
					});
				}


				/////////AJAXtest/////////AJAXtest///////////AJAXtest///////////AJAXtest///////
				$("#jQ5").on("click",function(){
					const result = $("#result5");
					result.empty();
					$.ajax({
						url : "https://www.megabox.co.kr/booking",
						type : "get",
						dataType : "json",
						success : function(data){
							for(let i=0; i<data.length; i++){
								const div = $("div></div>");
								div.append(data[i].movieAges);
								div.append("/");
								div.append(data[i].movieTitles);
								div.append("/");
								div.append(data[i].movieOpenDates);
								result.append(div);
							}
						},
						error : function(){

						}
					});
				});
				$("#jQ7").on("click",function(){
					const result = $("#result7");
					result.empty();
					$.ajax({
						url : "http://www.cgv.co.kr/movies/",
						type : "get",
						dataType : "json",
						success : function(data){
							console.log(data);
						},
						error : function(){
							console.log("호출실패");
						}
					});
				});

				
			</script>
			<script src="/resources/js/seat.js"></script>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</body>

		</html>