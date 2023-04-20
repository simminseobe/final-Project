<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet"
				href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
			<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
			<link rel="stylesheet" href="/resources/css/ticketing/screenList.css">
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

				.movie-list {
					overflow-y: auto;
					overflow-x: hidden;
				}

				.movie-list::-webkit-scrollbar {
					width: 10px;
				}

				.movie-list::-webkit-scrollbar-thumb {
					background-color: #2f3542;
					border-radius: 10px;
					background-clip: padding-box;
					border: 2px solid transparent;
				}

				.movie-list::-webkit-scrollbar-track {
					background-color: grey;
					border-radius: 10px;
					box-shadow: inset 0px 0px 5px white;
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
					margin-bottom: 100px;
				}

				.scroll-container {
					position: relative;
					height: 100%;
				}

				.scroll-container>ul>li>button {
					position: relative;
					background-color: transparent;
					width: 100%;
					height: 20px;
					padding: 3px 30px 3px 30px;
					border: 0;
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
					font-variation-settings: 'FILL' 0, 'wght' 700, 'GRAD' 0, 'opsz' 20
				}

				.theater-list {
					display: block;
					width: 100%;
					height: 320px;
				}

				.scroll {
					overflow: hidden;
					display: block;
					width: 100%;
					height: 100%;
				}

				.mid>ul {
					position: relative;
					height: 100%;
					overflow: hidden;
				}

				.mid>ul::after {
					content: '';
					display: block;
					position: absolute;
					left: 40%;
					top: 0;
					width: 1px;
					height: 100%;
					background-color: #ecf0f4;
				}



				.mid>ul>li.btn.on {
					color: #4444;
					background-color: #ebebeb;
				}

				/*
				.scroll>ul>li>button.on{
					color: #fff;
					font-weight: 400;
					background-color: #666;
				}
				*/
				.mid>ul>li.btn {
					overflow: visible;
					position: relative;
					width: 50%;
					padding: 0 10px;
				}

				.mid>ul>li>button {
					display: block;
					position: relative;
					
					min-height: 28px;
					padding: 3px;
					text-align: left;
					background-color: transparent;
					letter-spacing: 0;
					float: left;
				}
				.mid>ul>li>span{
					float: left;
					padding-top: 9px;
				}

				.scroll button {
					margin: 0;
					padding: 0;
					border: 0;
					letter-spacing: 1px;
					background-color: transparent;
				}

				button {
					cursor: pointer;
					overflow: visible;
				}
				.mid{
					width: 100%;
					height: 100%;
				}

				.mid>ul>li>button.on:after {
					content: '';
					display: block;
					position: absolute;
					right: -6px;
					top: 50%;
					z-index: 2;
					width: 6px;
					height: 11px;
					margin: -6px 0 0 0;
				}

				.mid>ul>li>button>span {
					display: inline-block;
					margin: 0 20px 0 0;
					vertical-align: middle;
				}

				.depth.on {
					display: block;
				}

				.depth {
					display: none;
					position: absolute;
					left: 38%;
					top: 320px;
					width: 177px;
					height: 340px;
					padding: 0;
				}

				.detail-list {
					width: 100%;
					height: 100%;
					margin: 0;
				}

				.scroll-box {
					max-height: none;
					position: relative;
					overflow-y: auto;
					overflow-x: hidden;
					height: 100%;
					max-width: 100%;
					outline: 0;
					direction: ltr;
				}

				.scroll-box::-webkit-scrollbar {
					width: 10px;
				}

				.scroll-box::-webkit-scrollbar-thumb {
					background-color: #2f3542;
					border-radius: 10px;
					background-clip: padding-box;
					border: 2px solid transparent;
				}

				.scroll-box::-webkit-scrollbar-track {
					background-color: grey;
					border-radius: 10px;
					box-shadow: inset 0px 0px 5px white;
				}

				.container {
					margin-right: 5px;
					overflow: hidden;
					width: auto;
					height: auto;
				}

				.brchNo>li>button {
					height: 30px;
					/*#btn*/
					padding-left: 12px;
					padding-right: 0;
					display: block;
					position: relative;
					width: 100%;
					min-height: 28px;
					padding: 3px 30px 3px 30px;
					text-align: left;
					font-size: .8667em;
					background-color: transparent;
					letter-spacing: 0;
					
				}

				/*
.brch {
	position: relative;
	height: 100%;
}

.brch:after {
	content: '';
	display: block;
	position: absolute;
	left: 50%;
	top: 0;
	width: 1px;
	height: 100%;
	background-color: #ecf0f4;
}
*/		
					
				

				/*
.scrollTools {
	width: 5px;
	opacity: 1;
	position: absolute;
	width: 16px;
	height: auto;
	left: auto;
	top: 0;
	right: 0;
	bottom: 0;
}

.draggerContainer {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	height: 320px;
}

.dragger {
	cursor: pointer;
	width: 100px;
	height: 30px;
	z-index: 1;
}

.dragger_bar {
	width: 5px;
	border-radius: 2px;
	background-color: #555;
	position: relative;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}

.draggerRail {
	background-color: #ebebeb;
	width: 5px;
	border-radius: 2px;
	height: 100%;
	margin: 0 auto;
}
*/
.mid>ul>li{
	overflow: hidden;
}
.mid>ul>li>button{
	float: left;
}
.mid>ul>li>span{
	float: left;
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
							<a href="/ticketing2.do">예매페이지(test)</a>
						</h1>
						<h1>
							<a href="/choiceSeat.do">좌석선택(test)</a>
						</h1>
						<h1>
							<a href="/paymentMethod.do">결제수단(test)</a>
						</h1>
						<!--
				<button class="test1" id="jQ5">서버에서 리스트 데이터 받기</button>
				<p class="ajaxResult" id="result5"
					style="min-height: 100px; border: 2px solid #ccc;"></p>
				<button class="test2" id="jQ7">서버에서 리스트 데이터 받기</button>
				<p class="ajaxResult" id="result7"
					style="min-height: 100px; border: 2px solid #ccc;"></p>
				-->
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
					<!-- 
					<div class="date-list">


						<div class="day-part">
							<div class="reserve-title"></div>
							<div class="reserve-date"></div>
						</div>
					-->
					<div class="day">
						<!-- 페이지 네이션으로 입력할 것 -->
						<!--일에 따라서 class가 바뀐다. -->
						<div class="month"></div>
						<div class="now-day"></div>
					</div>




					<div class="choice-wrap">
						<div class="choice-movie">
							<div class="choice choice-header">
								<p>영화</p>
								<div class="list-area">
									<div class="movie-list" style="background-color: #fff; height: 340px;">
										<div class="scroll-container" style="height: 100px;">

											<ul>
												<!-- 
										<c:forEach items="${list }" var="movieList">
											<li>
												<button type="button" class="oneMovie">
													<span class="movie-grade age-12">${movieList.movieRating}</span>
													<span class="movie-title">${movieList.movieTitle}</span> <i
														class="material-symbols-outlined heart">favorite</i>
												</button>
											</li>
										</c:forEach>
								-->
											</ul>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="choice-theater">
							<div class="choice choice-header">
								<p>극장</p>
								<div class="theater-list" style="background-color: #fff; height: 340px;">
									<div class="scroll" id="brchList">
										<div class="mid">

											<ul>
												<!--
													<li class="theater-city active">
														<button type="button" class="btn">
															<span class="sel-city seoul">서울</span>
														</button>
													-->
												</ul>
											</div>
												<div class="depth on">
													<div class="detail-list" style="max-height: none;">
														<div class="scroll-box">
															<div class="container"
																style="position: relative; top: 0; left: 0;">
																<ul class="brchNo">
															<!--		
															<li>
																<button id="btn" type="button">강남</button>
															</li>
															<li>
																<button id="btn" type="button">강남2</button>
															</li>
															
															<li>
																<button id="btn" type="button">강남100</button>
															</li>
															-->
														</ul>
														
													</div>
														<!--

															<div id="scrollbar_vertical" class="scrollTools"
															style="display: block;">
															<div class="draggerContainer">
																<div id="dragger_vertical" class="dragger"
																style="position: absolute; min-height: 30px; display: block; top: 0px; height: 183px; max-height: 310px;">
																<div class="dragger_bar"
																style="line-height: 30px;"></div>
															</div>
															<div class="draggerRail"></div>
														</div>
													</div>
												-->

														</div>
													</div>
												</div>
												<!--
											</li>
											
											
											
											
											
											
											
										-->
									</div>
								</div>
							</div>
						</div>
						<div class="choice-time">
							<div class="choice choice-header">
								<p>시간</p>
								<div class="time-check"></div>
								<div class="movie-check" style="background-color: #fff; height: 298px;"></div>
								<!--<div class="time-list" style="background-color: #fff; height: 340px;"></div> -->
							</div>
						</div>
					</div>
				</div>

			</div>

			<script>
				/*
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
				*/
				const dataDate = new Date();
				let year = dataDate.getFullYear();
				let month = dataDate.getMonth();
				let dataDay = dataDate.getDate();
				let dayLabel = dataDate.getDay();
				let dayNumber = Number(dataDay);
				$('div.month').text((Number(month) + 1) + "월");

				const reserveDate = $('div.now-day');

				const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];
				let thisWeek = [];
				let button = "";
				let spanWeekOfDay = "";
				let spanDay = "";
				let div = "";
				for (let i = dayNumber; i <= dayNumber + 11; i++) {

					div = document.createElement("div");
					button = document.createElement("button");
					spanWeekOfMonth = document.createElement("span");
					spanWeekOfDay = document.createElement("span");
					spanDay = document.createElement("strong");
					spanWeekOfMonth.classList = "movie-week-of-month";
					spanWeekOfDay.classList = 'movie-week-of-day';
					spanDay.classList = 'movie-day';
					let resultDay = new Date(year, month, i);
					let yyyy = resultDay.getFullYear();
					let mm = Number(resultDay.getMonth()) + 1;
					let dd = resultDay.getDate();
					let d = resultDay.getDay();

					mm = String(mm).length === 1 ? '0' + mm : mm;
					dd = String(dd).length === 1 ? '0' + dd : dd;
					d = String(d).length === 1 ? '0' + d : d;
					spanWeekOfMonth.innerHTML = mm;
					spanWeekOfDay.innerHTML = dd;

					button.append(spanWeekOfDay);
					if (d == '01') {
						d = weekOfDay[1];
						button.classList = "mon";
						button.setAttribute('data-day', dd + "/" + mm + "/" + yyyy);
					} else if (d == '02') {
						d = weekOfDay[2];
						button.classList = "mon";
						button.setAttribute('data-day', dd + "/" + mm + "/" + yyyy);
					} else if (d == '03') {
						d = weekOfDay[3];
						button.classList = "mon";
						button.setAttribute('data-day', dd + "/" + mm + "/" + yyyy);
					} else if (d == '04') {
						d = weekOfDay[4];
						button.classList = "mon";
						button.setAttribute('data-day', dd + "/" + mm + "/" + yyyy);
					} else if (d == '05') {
						d = weekOfDay[5];
						button.classList = "mon";
						button.setAttribute('data-day', dd + "/" + mm + "/" + yyyy);
					} else if (d == '06') {
						d = weekOfDay[6];
						button.classList = "mon sat";
						button.setAttribute('data-day', dd + "/" + mm + "/" + yyyy);
					} else if (d == '00') {
						d = weekOfDay[0];
						button.classList = "mon sun";
						button.setAttribute('data-day', dd + "/" + mm + "/" + yyyy);
					}
					if (i === dayNumber) {
						button.classList = "mon active";
						//해당날짜는 버튼이 눌려있게 설정함
					}
					spanDay.innerHTML = d;
					button.append(spanDay);
					reserveDate.append(button);


					thisWeek[i] = yyyy + "-" + mm + '-' + dd + '-' + d;
				}
				//날짜 클릭시 활성화 버튼과 hidden으로 data값 전송
				$('div.now-day').on('click', 'button.mon', function () {
					let $btnActive = $(this);
					let dataAttr = $btnActive.attr('data-day');
					if ($btnActive.hasClass('active')) {
						$('button.mon').removeClass('active');
					} else {
						$('button.mon').removeClass('active');
						$btnActive.addClass('active');
					}
				})
				//날짜 클릭했으면 활성화버튼 해제 
				$('div.now-day').on('click', 'button.active', function () {
					let $btnMon = $(this);
					$btnMon.attr('class', 'mon');
				})

				//시간출력하는 부분
				$('div.time-check').append(function () {
					let currentDate = new Date();
					let msg = Number(currentDate.getHours());
					for (let i = msg; i < msg + 10; i++) {
						let button = "";
						let $time = $('div.time-check');
						button = document.createElement("button");
						button.classList = 'time-check-button';
						if (i > 24) {
							button.innerHTML = Number();
						} else {
							button.innerHTML = Number(i);
							$time.append(button);
						}
					}
				})
				function timeAppend(event) {
					let day = $('div.mon.active').find('span.movie-week-of-day').text();
					let dayNm = parseInt(day);
					let mday = Number(currentDate.getDate());
					if (dayNm != mday) {
						for (let i = 1; i < 25; i++) {
							let button = "";
							let $time = $('div.time-check');
							button = document.createElement("button");
							button.classList = 'time-check-button';
							if (i > 24) {
								button.innerHTML = Number();
							} else if (i > 10) {
								button.innerHTML = Number("" + i);
								$time.append(button);
							} else {
								button.innerHTML = Number(i);
								$time.append(button);
							}
						}
					} else {
						let currentDate = new Date();
						let msg = Number(currentDate.getHours());
						for (let i = msg; i < msg + 10; i++) {
							let button = "";
							let $time = $('div.time-check');
							button = document.createElement("button");
							button.classList = 'time-check-button';
							if (i > 24) {
								button.innerHTML = Number();
							} else {
								button.innerHTML = Number(i);
								$time.append(button);
							}
						}
					}
				}
				var choiceDataDay;
				//날짜 누르면 해당 날짜에 있는 영화들 출력
				$(".mon").on("click", function () {
					choiceDataDay = $(this).attr("data-day");

					$.ajax({
						url: "/choiceDay.do",
						type: "post",
						dataType: "json",
						data: { dataDay: choiceDataDay },
						success: function (data) {
							console.log(data);
							$(".scroll-container>ul").empty();
							//$(".scroll-container").text("dataDay: " + dataDay);
							for (var i = 0; i < data.length; i++) {
								const li = $("<li>");
								const btn = $("<button>");

								li.append(btn);
								//btn.attr("href","/allMovieList.do?movieNo="+data[i].movieNo);
								btn.text(data[i].MOVIE_TITLE);
								btn.attr("onclick", "selMovie(this);");

								$(".scroll-container>ul").append(li);


							}
						}
					});
				});
				var movieTitle;
				var theaterLocal;
				// 영화 누르면 영화에 저장되어있는 상영지역 출력
				function selMovie(button) {
					movieTitle = $(button).text();
					$.ajax({
						url: "/choiceDayTheater.do",
						type: "post",
						data: { movieTitle: movieTitle, choiceDataDay: choiceDataDay },
						dataType: "json",
						success: function (data) {
							console.log(data);
							$(".mid>ul").empty();
							for (var i = 0; i < data.length; i++) {
								const li = $("<li>");
								const btn = $("<button>");
								const span = $("<span>");
									
								li.append(btn);
								li.append(span);
								
								btn.text(data[i].theaterLocal);
								span.text(" ("+data[i].count+")");
								btn.attr("onclick","selBranch(this);");
								
								$(".mid>ul").append(li);
								

								theaterLocal = btn.text();
								console.log(theaterLocal+" 있음");

								
							}
						}
					});
				}
				var theaterBranch;
				//local선택하면 속해있는 branch 출력
				function selBranch(button){
					theaterLocal = $(button).text();
					console.log(theaterLocal+" 누름");
					$.ajax({
						url : "/choiceLocalBranch.do",
						type : "post",
						data : {movieTitle:movieTitle,choiceDataDay:choiceDataDay,theaterLocal:theaterLocal},
						dataType : "json",
						success : function(data){
							console.log(data);
							$(".container>ul").empty();
							for (var i = 0; i < data.length; i++) {
								const li = $("<li>");
								const btn = $("<button>");
								
								
								li.append(btn);
								
								btn.text(data[i]);
								
								
								$(".container>ul").append(li);
								btn.attr("onclick","selSchedule(this);");

								theaterBranch = btn.text();
								console.log(theaterBranch+" 있음");
							}
						}
					});
				}
				var theaterSchedule;
				//branch클릭하면 스케쥴 출력
				function selSchedule(button){
					theaterBranch = $(button).text();
					console.log(theaterBranch+" 누름");
					$.ajax({
						url : "/choiceBranchSchedule.do",
						type : "post",
						data : {movieTitle:movieTitle,choiceDataDay:choiceDataDay,theaterLocal:theaterLocal,theaterBranch:theaterBranch},
						dataType : "json",
						success : function(data){
							console.log(data);
						}
					});
				}

				
				
				


				//ex)서울 누르면 강남....나옴
				// $(".theater-city").on("click", function () {
				// 	$(".theater-city").removeClass("active");
				// 	$(this).addClass("active");
				// 	const contents = $(".container");
				// 	contents.hide();
				// 	const index = $(".theater-city").index(this);
				// 	contents.eq(index).show();
				// });
				// $(".theater-city").eq(0).click();
				//서울 누르면 서울 내 있는 지역들 나옴 (ul아래 li,button 생성)
				// $(".btn").on("click", function () {
				// 	const theaterLocal = $(this).find(".sel-city").text();

				// 	$.ajax({
				// 		url: "/selectBranchList.do",
				// 		type: "get",
				// 		data: { theaterLocal: theaterLocal },
				// 		success: function (data) {
				// 			$(".brchNo").empty();
				// 			console.log(data);
				// 			for (var i = 0; i < data.length; i++) {
				// 				console.log(data[i]);
				// 				const li = $("<li>");
				// 				const btn = $("<button>");

				// 				li.append(btn);
				// 				btn.attr("href", "/selectOneTheaterBrch.do?theaterNo=" + data[i].theaterNo);
				// 				btn.text(data[i].theaterBranch);

				// 				$(".brchNo").append(li);

				// 			}
				// 		}
				// 	});
				// });
				// $(document).ready(function () {
				// 	$(".seoul").click();
				// });

				/////////AJAXtest/////////AJAXtest///////////AJAXtest///////////AJAXtest///////
				// function getMega() {
				// 	console.log("꾹");
				// 	$.ajax({
				// 		url: "/ticketing.do",
				// 		type: "get",
				// 		success: function () {
				// 			console.log("서버호출완료!");
				// 		},
				// 		error: function () {
				// 			console.log("서버호출실패!");
				// 		},
				// 		complete: function () {
				// 			console.log("무조건 호출");
				// 		}
				// 	});
				// }
				// $("#jQ5").on("click", function () {
				// 	const result = $("#result5");
				// 	result.empty();
				// 	$.ajax({
				// 		url: "https://www.megabox.co.kr/booking",
				// 		type: "get",
				// 		dataType: "json",
				// 		success: function (data) {
				// 			for (let i = 0; i < data.length; i++) {
				// 				const div = $("div></div>");
				// 				div.append(data[i].movieAges);
				// 				div.append("/");
				// 				div.append(data[i].movieTitles);
				// 				div.append("/");
				// 				div.append(data[i].movieOpenDates);
				// 				result.append(div);
				// 			}
				// 		},
				// 		error: function () {

				// 		}
				// 	});
				// });
				// // $("#jQ7").on("click", function () {
				// 	const result = $("#result7");
				// 	result.empty();
				// 	$.ajax({
				// 		url: "http://www.cgv.co.kr/movies/",
				// 		type: "get",
				// 		dataType: "json",
				// 		success: function (data) {
				// 			console.log(data);
				// 		},
				// 		error: function () {
				// 			console.log("호출실패");
				// 		}
				// 	});
				// });


				//////////////////////////////////////////////////////////////////////





			</script>
			<!-- <script src="/resources/js/seat.js"></script> -->
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</body>

		</html>