<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

			<style>
				.content-all-wrap {
					position: relative;
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
					border: 1px solid #d8d9db;
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


				.how-many {
					border-bottom: 1px solid #ebebeb;
					background-color: #ebebeb;
					height: 40px;
					padding: 10px 0 10px 20px;
					min-height: 50px;
				}

				.cell {
					float: left;
					width: 25%;
				}

				.select-many-people {
					float: left;
					padding: 0 10px 0 0;
					line-height: 30px;
				}

				.count {
					float: left;
					width: 100px;
				}

				.down {
					float: left;
					width: 30px;
					height: 30px;
					border: 1px solid #ccc;
					border-radius: 5px 0 0 5px;

				}

				.down:hover {
					cursor: pointer;
				}

				.number {
					position: relative;
					float: left;
					width: 40px;
				}

				.now {
					width: 40px;
					height: 30px;
					border: 1px solid #ccc;
					border-width: 1px 0;
				}

				.num-choice {
					display: none;
					position: absolute;
					left: 0;
					top: 30px;
					z-index: 20;
					width: 40px;
					border: 1px solid #ccc;
					border-top: 0;
					background-color: #fff;
				}

				.on {
					color: #fff;
					background-color: #555;
				}

				.up {
					float: left;
					width: 30px;
					height: 30px;
					border: 1px solid #ccc;
					border-radius: 0 5px 5px 0;
				}

				.up:hover {
					cursor: pointer;
				}

				.seat-wrap {
					height: 450px;
					padding-top: 20px;
					padding-bottom: 20px;
				}

				.screen {
					height: 40px;
					margin-top: 25px;
					margin-bottom: 25px;
					text-align: center;
				}

				.screen>img {
					width: 500px;
					height: 30px;
				}
				/*
				.seat {
					margin: 0 auto;
					width: 400px;
					height: 300px;

				}


				.seat-container {
					width: 300px;
					height: 25px;
					margin-left: 50px;

				}
				*/
				.seat {
				font-size: 10px;
	            width: 30px;
	            height: 30px;
	        	}
	        
		        .clicked {
		            background-color: red;
		            color: white;
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

				.result-title {}

				.result-info {}

				.result-seat {}

				.result-pay {}

				.result-btn {
					position: absolute;
					overflow: hidden;
					bottom: 5px;
					width: 100%;
					height: 40px;

				}

				.pagePrevious {
					display: block;
					float: left;
					margin: 0;
					width: 150px;
					height: 50px;
					line-height: 40px;
					background-color: #53565b;
					color: #fff;
					font-size: 20px;
					text-align: center;
				}

				.pageNext {
					display: block;
					float: left;
					margin: 0;
					width: 150px;
					height: 50px;
					line-height: 40px;
					background-color: #e0e0e0;	/*좌석선택 후 다음버튼 color:#fff , bg-color:#329eb1*/
					color: #aaaaaa;
					font-size: 20px;
					text-align: center;
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
					</div>
				</div>
				<div class="content-all-wrap">

					<div class="content-title-wrap">
						<div class="content-title">
							<p class="title-p">관람인원선택</p>
							<button type="button" onclick="resetBtn()" id="reset-btn">초기화</button>
						</div>
					</div>

					<div class="content-wrap">
						<div class="how-many">
							<div class="cell">
								<p class="select-many-people">성인</p>
								<div class="count">
									<!--버튼 시작-->
									<button type="button" class="down">-</button>
									<div class="number">
										<button type="button" class="now now1" id="now1">0</button>
										<ul class="num-choice">
											<li>
												<button type="button" class="btn on">0</button>
											</li>
										</ul>
									</div>
									<button type="button" class="up">+</button>
									<!--버튼 끝-->
								</div>
							</div>
							<div class="cell">
								<p class="select-many-people">청소년</p>
								<div class="count">
									<!--버튼 시작-->
									<button type="button" class="down">-</button>
									<div class="number">
										<button type="button" class="now now2" id="now2">0</button>
										<ul class="num-choice">
											<li>
												<button type="button" class="btn on">0</button>
											</li>
										</ul>
									</div>
									<button type="button" class="up">+</button>
									<!--버튼 끝-->
								</div>
							</div>
							<div class="cell" style="padding-left: 10px;">
								<p class="select-many-people">우대</p>
								<div class="count">
									<!--버튼 시작-->
									<button type="button" class="down">-</button>
									<div class="number">
										<button type="button" class="now now3" id="now3">0</button>
										<ul class="num-choice">
											<li>
												<button type="button" class="btn on">0</button>
											</li>
										</ul>
									</div>
									<button type="button" class="up">+</button>
									<!--버튼 끝-->
								</div>
							</div>

							
						</div>
						<div class="seat-wrap">
							<div class="screen">
								<img src="img/screen.png">
							</div>
							<div class="seat-div">
								<div class="seat-wrapper" style="width: 300px; margin: 0 auto;"></div>
							</div>
							<!--
							<div class="seat" style="position: relative;">
								<span class="lineA"
									style="position: absolute; width:20px; height:20px; border:1px solid #ccc; background-color:#fff; color: black; justify-content:center; align-items:center; display:flex;">A</span>
								<div class="seat-container"></div>
								<span class="lineB"
									style="position: absolute; width:20px; height:20px; border:1px solid #ccc; background-color:#fff; color: black; justify-content:center; align-items:center; display:flex;">B</span>
								<div class="seat-container"></div>
								<span class="lineC"
									style="position: absolute; width:20px; height:20px; border:1px solid #ccc; background-color:#fff; color: black; justify-content:center; align-items:center; display:flex;">C</span>
								<div class="seat-container"></div>
								<span class="lineD"
									style="position: absolute; width:20px; height:20px; border:1px solid #ccc; background-color:#fff; color: black; justify-content:center; align-items:center; display:flex;">D</span>
								<div class="seat-container"></div>
								<span class="lineE"
									style="position: absolute; width:20px; height:20px; border:1px solid #ccc; background-color:#fff; color: black; justify-content:center; align-items:center; display:flex;">E</span>
								<div class="seat-container"></div>
								<span class="lineF"
									style="position: absolute; width:20px; height:20px; border:1px solid #ccc; background-color:#fff; color: black; justify-content:center; align-items:center; display:flex;">F</span>
								<div class="seat-container"></div>
								<span class="lineG"
									style="position: absolute; width:20px; height:20px; border:1px solid #ccc; background-color:#fff; color: black; justify-content:center; align-items:center; display:flex;">G</span>
								<div class="seat-container"></div>
								<span class="lineH"
									style="position: absolute; width:20px; height:20px; border:1px solid #ccc; background-color:#fff; color: black; justify-content:center; align-items:center; display:flex;">H</span>
								<div class="seat-container"></div>
								<span class="lineI"
									style="position: absolute; width:20px; height:20px; border:1px solid #ccc; background-color:#fff; color: black; justify-content:center; align-items:center; display:flex;">I</span>
								<div class="seat-container"></div>





								
							<span class="seat-condition"
								style="position: absolute; left:55px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">1</span>
							<span class="seat-condition"
								style="position: absolute; left:75px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">2</span>
							<span class="seat-condition"
								style="position: absolute; left:95px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">3</span>
							<span class="seat-condition"
								style="position: absolute; left:115px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">4</span>

							<span class="seat-condition"
								style="position: absolute; left:155px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">6</span>
							<span class="seat-condition"
								style="position: absolute; left:175px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">7</span>
							<span class="seat-condition"
								style="position: absolute; left:195px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">8</span>
							<span class="seat-condition"
								style="position: absolute; left:215px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">9</span>

							<span class="seat-condition"
								style="position: absolute; left:255px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">11</span>
							<span class="seat-condition"
								style="position: absolute; left:275px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">12</span>
							<span class="seat-condition"
								style="position: absolute; left:295px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">13</span>
							<span class="seat-condition"
								style="position: absolute; left:315px; top:50px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">14</span>


							<span class="seat-condition" style="position: absolute; left:55px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">1</span>
							<span class="seat-condition" style="position: absolute; left:75px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">2</span>
							<span class="seat-condition" style="position: absolute; left:95px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">3</span>
							<span class="seat-condition" style="position: absolute; left:115px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">4</span>
							<span class="seat-condition" style="position: absolute; left:135px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">5</span>
							<span class="seat-condition" style="position: absolute; left:155px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">6</span>
							<span class="seat-condition" style="position: absolute; left:175px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">7</span>
							<span class="seat-condition" style="position: absolute; left:195px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">8</span>
							<span class="seat-condition" style="position: absolute; left:215px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">9</span>
							<span class="seat-condition" style="position: absolute; left:235px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">10</span>
							<span class="seat-condition" style="position: absolute; left:255px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">11</span>
							<span class="seat-condition" style="position: absolute; left:275px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">12</span>
							<span class="seat-condition" style="position: absolute; left:295px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">13</span>
							<span class="seat-condition" style="position: absolute; left:315px; top:75px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">14</span>
							
							
							
							<span class="seat-condition" style="position: absolute; left:55px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">1</span>
							<span class="seat-condition" style="position: absolute; left:75px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">2</span>
							<span class="seat-condition" style="position: absolute; left:95px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">3</span>
							<span class="seat-condition" style="position: absolute; left:115px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">4</span>
							<span class="seat-condition" style="position: absolute; left:135px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">5</span>
							<span class="seat-condition" style="position: absolute; left:155px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">6</span>
							<span class="seat-condition" style="position: absolute; left:175px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">7</span>
							<span class="seat-condition" style="position: absolute; left:195px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">8</span>
							<span class="seat-condition" style="position: absolute; left:215px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">9</span>
							<span class="seat-condition" style="position: absolute; left:235px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">10</span>
							<span class="seat-condition" style="position: absolute; left:255px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">11</span>
							<span class="seat-condition" style="position: absolute; left:275px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">12</span>
							<span class="seat-condition" style="position: absolute; left:295px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">13</span>
							<span class="seat-condition" style="position: absolute; left:315px; top:100px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">14</span>
							

							<span class="seat-condition" style="position: absolute; left:55px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">1</span>
							<span class="seat-condition" style="position: absolute; left:75px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">2</span>
							<span class="seat-condition" style="position: absolute; left:95px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">3</span>
							<span class="seat-condition" style="position: absolute; left:115px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">4</span>
							<span class="seat-condition" style="position: absolute; left:135px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">5</span>
							<span class="seat-condition" style="position: absolute; left:155px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">6</span>
							<span class="seat-condition" style="position: absolute; left:175px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">7</span>
							<span class="seat-condition" style="position: absolute; left:195px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">8</span>
							<span class="seat-condition" style="position: absolute; left:215px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">9</span>
							<span class="seat-condition" style="position: absolute; left:235px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">10</span>
							<span class="seat-condition" style="position: absolute; left:255px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">11</span>
							<span class="seat-condition" style="position: absolute; left:275px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">12</span>
							<span class="seat-condition" style="position: absolute; left:295px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">13</span>
							<span class="seat-condition" style="position: absolute; left:315px; top:125px; width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">14</span>
							

							</div>
							-->
						</div>
					</div>
					<div class="content-result">
						<div class="result-wrap">
							<div class="result-title">

							</div>
							<div class="result-info">

							</div>
							<div class="result-seat">

							</div>
							<div class="pay">

							</div>
							<div class="result-btn">
								<a href="/ticketing.do" class="pagePrevious">이전</a>
								<a href="javascript:void(0)" class="pageNext">다음</a>
								<input type="hidden" id="memberYN" value="${sessionScope.m.memberId }">
							</div>
						</div>
					</div>
				</div>

				<button class="nowTotal">선택된 인원 수 : 0</button>
			</div>
			<script>
				/*
				var seatContainer = $('.seat-container');
				for (var i = 1; i <= 15; i++) {
					seatContainer.append('<span class="seat-condition" id="repeat' + i + '" style="width:20px; height:20px; border:1px solid #02bfd3; background-color:#555; color: #fff; justify-content:center; align-items:center; display:flex;">' + i + '</span>');
				}
				seatContainer.css({
					'display': 'flex',
					'flex-direction': 'row'
				});
				*/
				
				let test = [];
			    let selectedSeats = new Array();
			    let selectedSeatsMap = [];
			    const seatWrapper = document.querySelector(".seat-wrapper");
			    let clicked = "";
			    let div = "";

			    for (let i = 0; i < 10; i++) {
			        div = document.createElement("div");
			        seatWrapper.append(div);
			        for (let j = 0; j < 10; j++) {
			            const input = document.createElement('input');
			            input.type = "button";
			            input.name = "seats"
			            input.classList = "seat";
			            //3중포문을 사용하지 않기위해 
			            mapping(input, i, j);
			            div.append(input);
			            input.addEventListener('click', function(e) {
			                console.log(e.target.value);
			                //중복방지 함수
			                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

			                //click class가 존재할때(제거해주는 toggle)
			                if (input.classList.contains("clicked")) {
			                    input.classList.remove("clicked");
			                    clicked = document.querySelectorAll(".clicked");
			                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
			                    clicked.forEach((data) => {
			                        selectedSeats.push(data.value);
			                    });
			                    //click class가 존재하지 않을때 (추가해주는 toggle)
			                } else {
			                    input.classList.add("clicked");
			                    clicked = document.querySelectorAll(".clicked");
			                    clicked.forEach((data) => {
			                        selectedSeats.push(data.value);
			                    })
			                }
			                console.log(selectedSeats);
			            })
			        }
			    }

			    function mapping(input, i, j) {
			        const row = String.fromCharCode(65 + i); // A부터 G까지의 알파벳을 구합니다.
			        const seatNumber = j + 1; // 0부터 6까지의 숫자에 1을 더하여 좌석 번호를 구합니다.
			        input.value = row + seatNumber; // 알파벳과 숫자를 조합하여 좌석 값을 설정합니다.
			    }
				
				$(document).ready(function () {
					// 성인 버튼
					$('.how-many .cell:nth-child(1) .down').click(function () {
						var $count = $(this).closest('.count');
						var $now = $count.find('.now');
						var nowVal = parseInt($now.text());
						if (nowVal > 0) {
							$now.text(nowVal - 1);
							nowTotal(); // nowTotal() 함수 호출
						}
					});
					$('.how-many .cell:nth-child(1) .up').click(function () {
						var $count = $(this).closest('.count');
						var $now = $count.find('.now');
						$now.text(parseInt($now.text()) + 1);
						nowTotal(); // nowTotal() 함수 호출
					});

					// 청소년 버튼
					$('.how-many .cell:nth-child(2) .down').click(function () {
						var $count = $(this).closest('.count');
						var $now = $count.find('.now');
						var nowVal = parseInt($now.text());
						if (nowVal > 0) {
							$now.text(nowVal - 1);
							nowTotal(); // nowTotal() 함수 호출
						}
					});
					$('.how-many .cell:nth-child(2) .up').click(function () {
						var $count = $(this).closest('.count');
						var $now = $count.find('.now');
						$now.text(parseInt($now.text()) + 1);
						nowTotal(); // nowTotal() 함수 호출
					});

					// 우대 버튼
					$('.how-many .cell:nth-child(3) .down').click(function () {
						var $count = $(this).closest('.count');
						var $now = $count.find('.now');
						var nowVal = parseInt($now.text());
						if (nowVal > 0) {
							$now.text(nowVal - 1);
							nowTotal(); // nowTotal() 함수 호출
						}
					});
					$('.how-many .cell:nth-child(3) .up').click(function () {
						var $count = $(this).closest('.count');
						var $now = $count.find('.now');
						$now.text(parseInt($now.text()) + 1);
						nowTotal(); // nowTotal() 함수 호출
					});
				});

				function resetBtn() {
					$('.now').text('0');
					nowTotal(); // nowTotal() 함수 호출
				}
				
				$(".pageNext").on("click",function(){
					if($("#memberYN").val() == ''){
						location.href = "/login.do";
					}else{
						location.href = "/paymentMethod.do";
					}
				});

				
				

				// .now 값을 합치고 버튼의 텍스트를 업데이트하는 함수
				function nowTotal() {
				var now1 = parseInt($('#now1').text());
				var now2 = parseInt($('#now2').text());
				var now3 = parseInt($('#now3').text());
				var nowTotal = now1 + now2 + now3;
				// 버튼의 텍스트를 업데이트
				$('.nowTotal').text('선택된 인원 수 : ' + nowTotal);
				}

				

			</script>


		</body>

		</html>