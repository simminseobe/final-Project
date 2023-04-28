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
					margin-bottom: 200px;
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
					background-color: #503396;
					color: white;
				}
				.reserved{
					background-image: url(https://img.megabox.co.kr/static/pc/images/common/bg/bg-seat-condition-finish.png)!important;
					background-size: 100%;
				}
				.seat:not(.reserved, .clicked){
					background-color: #ccc;
				}
				.choice-result {
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
					padding: 15px 20px 0 0;
				}

				.result-title {
					overflow: hidden;
					position: relative;
					margin-left: 20px;
					padding: 5px 0 0 10px;
					border-bottom: 1px solid #434343;
					height: 50px;
					font-size: 19px;
				}

				.result-info {
					position: relative;
					min-height: 121px;
					margin-left: 20px;
					padding: 0 104px 0 0;
					font-size: .8667em;
					border-bottom: 1px solid #434343;
					height: 120px;
				}
				.info-branch{
					padding: 10px;
					font-size: 15px;
					color: #c4c4c4;
				}
				.tBrch{
					padding-bottom: 15px;
				}
				.info-time{
					padding: 10px;
					font-size: 15px;
				}
				.result-seat {
					overflow: hidden;
					position: relative;
					min-height: 200px;
					margin: 10px 0 0 20px;
					border-radius: 5px;
					border: 1px solid #434343;
					height: 200px;
				}
				.numberOfPeople{
					overflow: hidden;
					height: 30px;
					margin: 25px 0 0 20px;
					padding: 10px 0;
				}
				.numberOfPeople>div>span{
					color: #c4c4c4;
				}
				.numArea1{
					float: left;
					padding-right: 10px;
				}
				.numArea2{
					float: left;
					padding-right: 10px;
				}
				.numArea3{
					float: left;
				}
				.result-pay {
					width: 260px;
					margin: 5px 0 0 20px;
					
					height: 50px;
				}
				.pay-tit{
					float: left;
					line-height: 35px;
					font-size: 15px;
				}
				.money{
					float: right;
				}
				.amount{
					display: block;
					float: left;
					line-height: 35px;
					font-size: 24px;
					color: #59bec9;
					font-weight: 400;
				}
				.won{
					display: block;
					float: right;
					padding: 0 0 0 5px;
					line-height: 35px;
					font-size: 15px;
				}

				.result-btn {
					position: absolute;
					overflow: hidden;
					bottom: 5px;
					width: 100%;
					height: 40px;
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

				.pageNext {
					border: 0;
					display: block;
					float: left;
					margin: 0;
					width: 150px;
					height: 40px;
					line-height: 40px;
					background-color: #e0e0e0;	/*좌석선택 후 다음버튼 color:#fff , bg-color:#329eb1*/
					color: #aaaaaa;
					font-size: 20px;
					text-align: center;
				}
				.choice-seat-area>p{
					padding: 5px;
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
							<button type="button" id="reset-btn">초기화</button>
						</div>
					</div>

					<div class="content-wrap">
						<div class="how-many">
							<div class="cell">
								<p class="select-many-people adult">성인</p>
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
								<p class="select-many-people teen">청소년</p>
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
								<p class="select-many-people spec">우대</p>
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
					<div class="choice-result">
						<div class="result-wrap">
							<div class="result-title">
								${schedule.movieTitle}
							</div>
							
							<div class="result-info">
								<div class="info-branch">
									<p class="tBrch">${schedule.theaterBranch}</p>
									<p class="toDate">${choiceDataDay.choiceDataDay}</p>
								</div>
								<div class="info-time">
									${schedule.scheduleStart}
									${schedule.scheduleEnd}
								</div>
							</div>
							<div class="result-seat">
								<div class="choice-seat-area">
									<p>선택좌석</p>
									<div class="selectedSeats-area">
										
									</div>
								</div>
							</div>
							<div class="numberOfPeople">
								<div class="numArea1"></div>
								<div class="numArea2"></div>
								<div class="numArea3"></div>
							</div>
							<div class="result-pay">
								<p class="pay-tit">최종결제금액</p>
								<div class="money">
									<span class="amount"></span>
									<span class="won">원</span>
								</div>
							</div>
							<div class="result-btn">
								<button type="button" class="pagePrevious">이전</button>
								<button type="button" class="pageNext">다음</button>
								<!--<input type="hidden" id="memberYN" value="${sessionScope.m.memberId }">-->
							</div>
						</div>
					</div>
				<button class="nowTotal">선택된 인원 수 : </button>
				<span class="hiddenSpan" title="선택한영화의 scheduleNo" style="display: none;">${schedule.scheduleNo}</span>
				</div>

			</div>
			<script>
				
				var scheduleNo = $(".hiddenSpan").text();
				$(function(){
					$.ajax({
						url : "/holdSeat.do",
						type : "post",
						data : {scheduleNo:scheduleNo},
						dataType : "json",
						success : function(data){
							console.log(data);
							for(let i = 0; i<data.length;i++){
								const seats = $(".seat");
								seats.each(function(index,item){
									if($(item).val() == data[i]){
										$(item).prop("disabled",true);
										$(item).addClass("reserved");
										$(item).off("click");
										
									}
								})
							}
						}
					});
				});
				var countAdult;	//인원 수 
				var countTeen;
				var countSpecial;
				//우측 선택된 인원 수 출력
				//.now1(성인)의 인원 수 구하는 함수
				function getAdultCount(){
					countAdult = parseInt($('#now1').text());
					console.log("성인 "+countAdult);
					$(".numberOfPeople>div.numArea1").empty();
					if(countAdult === 0){
						return;
					}
					const span = $("<span>").addClass("adultSpan");
					span.text("성인 "+countAdult);
					$(".numberOfPeople>div.numArea1").append(span);
					adultCountResult = $(".adultSpan").text();
				}
				//.now2(청소년)의 인원 수 구하는 함수
				function getTeenCount(){
					countTeen = parseInt($('#now2').text());
					console.log("청소년 "+countTeen);
					$(".numberOfPeople>div.numArea2").empty();
					if(countTeen === 0){
						return;
					}
					const span = $("<span>").addClass("teenSpan");
					span.text("청소년 "+countTeen);
					$(".numberOfPeople>div.numArea2").append(span);
					teenCountResult = $(".teenSpan").text();
				}
				//.now3(우대)의 인원 수 구하는 함수
				function getSpecCount(){
					countSpecial = parseInt($('#now3').text());
					console.log("우대 "+countSpecial);
					$(".numberOfPeople>div.numArea3").empty();
					if(countSpecial === 0){
						return;
					}
					const span = $("<span>").addClass("specSpan");
					span.text("우대 "+countSpecial);
					$(".numberOfPeople>div.numArea3").append(span);
					specCountResult = $(".specSpan").text();
					
				}
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
					var adultCountResult;//연령종류:수(성인 : 1)
					var teenCountResult;
					var specCountResult;
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
							$(input).on('click', function(e) {
								
								const now = $(".now");
								let totalCount = 0;
								now.each(function(no,item){
									totalCount += Number($(item).text());
								});

								console.log(totalCount);
								if(totalCount > $(".mySeat").length){
									if($(this).hasClass("clicked")) {
										$(this).removeClass("clicked");
										const index = selectedSeats.indexOf($(this).val());
										selectedSeats.splice(index,1);
									}else{
										$(this).addClass("clicked");
										selectedSeats.push($(this).val());
										selectedSeats.sort();
									}
									console.log(selectedSeats);
									$(".selectedSeats-area").empty();
									
									$(selectedSeats).each(function(no,item){
										const div = $("<div>").addClass("mySeat")
										div.text(item)
										$(".selectedSeats-area").append(div)
									});
									if(totalCount ==  $(".mySeat").length){
										$('.seat:not(.clicked)').prop('disabled', true );
										
										
									}
								}
								
								
								
							})
						}
					}
				
				
					function mapping(input, i, j) {
						const row = String.fromCharCode(65 + i); // A부터 G까지의 알파벳을 구합니다.
						const seatNumber = j + 1; // 0부터 6까지의 숫자에 1을 더하여 좌석 번호를 구합니다.
						input.value = row + seatNumber; // 알파벳과 숫자를 조합하여 좌석 값을 설정합니다.
					}

					// 성인 버튼
					$('.how-many .cell:nth-child(1) .down').click(function () {
						var $count = $(this).closest('.count');
						var $now = $count.find('.now');
						var nowVal = parseInt($now.text());
						if (nowVal > 0) {
							$now.text(nowVal - 1);
							nowTotal(); // nowTotal() 함수 호출
							getAdultCount(); //adultCount()함수호출 : 성인 수
						}
					});
					$('.how-many .cell:nth-child(1) .up').click(function () {
						var adultCount = parseInt($('.how-many .cell:nth-child(1) .now').text());
						var teenCount = parseInt($('.how-many .cell:nth-child(2) .now').text());
						var specCount = parseInt($('.how-many .cell:nth-child(3) .now').text());

						// 선택한 인원 수와 같은 개수의 좌석 선택 버튼을 활성화합니다.
						var total = adultCount + teenCount + specCount;
						if(total < 8){
							var $count = $(this).closest('.count');
							var $now = $count.find('.now');
							$now.text(parseInt($now.text()) + 1);
							nowTotal(); // nowTotal() 함수 호출
							getAdultCount(); //adultCount()함수호출 : 성인 수
							
							$('.seat:not(.clicked)').prop('disabled', false );
							
							$('.reserved').prop('disabled', true );
							console.log("aaaa", $(".reserved").eq(0).prop("disabled"));
						} else {
							alert("8명 제한입니다");
						}						
					});

					// 청소년 버튼
					$('.how-many .cell:nth-child(2) .down').click(function () {
						var $count = $(this).closest('.count');
						var $now = $count.find('.now');
						var nowVal = parseInt($now.text());
						if (nowVal > 0) {
							$now.text(nowVal - 1);
							nowTotal(); // nowTotal() 함수 호출
							getTeenCount(); //teenCount()함수호출 : 청소년 수
						}
					});
					$('.how-many .cell:nth-child(2) .up').click(function () {
						var adultCount = parseInt($('.how-many .cell:nth-child(1) .now').text());
						var teenCount = parseInt($('.how-many .cell:nth-child(2) .now').text());
						var specCount = parseInt($('.how-many .cell:nth-child(3) .now').text());

						// 선택한 인원 수와 같은 개수의 좌석 선택 버튼을 활성화합니다.
						var total = adultCount + teenCount + specCount;
						if(total < 8){
							var $count = $(this).closest('.count');
							var $now = $count.find('.now');
							$now.text(parseInt($now.text()) + 1);
							nowTotal(); // nowTotal() 함수 호출
							getTeenCount(); //teenCount()함수호출 : 청소년 수
							$('.seat:not(.clicked)').prop('disabled', false );
							
						} else {
							alert("8명 제한입니다");
						}
					});

					// 우대 버튼
					$('.how-many .cell:nth-child(3) .down').click(function () {
						var $count = $(this).closest('.count');
						var $now = $count.find('.now');
						var nowVal = parseInt($now.text());
						if (nowVal > 0) {
							$now.text(nowVal - 1);
							nowTotal(); // nowTotal() 함수 호출
							getSpecCount() //specCount()함수호출 : 우대 수
						}
					});
					$('.how-many .cell:nth-child(3) .up').click(function () {
						var adultCount = parseInt($('.how-many .cell:nth-child(1) .now').text());
						var teenCount = parseInt($('.how-many .cell:nth-child(2) .now').text());
						var specCount = parseInt($('.how-many .cell:nth-child(3) .now').text());

						// 선택한 인원 수와 같은 개수의 좌석 선택 버튼을 활성화합니다.
						var total = adultCount + teenCount + specCount;
						if(total < 8){
							var $count = $(this).closest('.count');
							var $now = $count.find('.now');
							$now.text(parseInt($now.text()) + 1);
							nowTotal(); // nowTotal() 함수 호출
							getSpecCount() //specCount()함수호출 : 우대 수
							$('.seat:not(.clicked)').prop('disabled', false );
							
						} else {
							alert("8명 제한입니다");
						}
					});


				
				$("#reset-btn").on("click",function(){
					$('.now').text('0');
					nowTotal(); // nowTotal() 함수 호출
					calculateAmount();
					getAdultCount();
					getTeenCount();
					getSpecCount()
					$(".selectedSeats-area").empty();
					const input = $("input");
					input.removeClass("clicked")
					$('.seat').prop('disabled', true );
				});
				/*
				$(".pageNext").on("click",function(){
					if($("#memberYN").val() == ''){
						location.href = "/login.do";
					}else{
						location.href = "/paymentMethod.do";
					}
				});
				*/
				//calculateAmount()함수 호출
				$(".how-many").on("click",function(){
					calculateAmount();
				});
				//span.amount에 (연령대*금액)합계금액 출력 (천 단위에서 ,찍기위해 .toLocaleString()추가)
				function calculateAmount() {
					const adultPrice = 100;//18000
					const teenPrice = 100;//12000
					const specPrice = 100;//7000

					const adultCount = parseInt($('#now1').text());
					const teenCount = parseInt($('#now2').text());
					const specCount = parseInt($('#now3').text());

					const adultAmount = adultCount * adultPrice;
					const teenAmount = teenCount * teenPrice;
					const specAmount = specCount * specPrice;

					const totalAmount = adultAmount + teenAmount + specAmount;
					console.log(totalAmount);
					console.log(totalAmount);
					
					$(".amount").text(totalAmount.toLocaleString());
				}
////////////////////////////////////////////////////////////
				
////////////////////////////////////////////////////////////			
				// .now 값을 합치고 버튼의 텍스트를 업데이트하는 함수
				var allPeopleCount;
				function nowTotal() {
				var now1 = parseInt($('#now1').text());
				var now2 = parseInt($('#now2').text());
				var now3 = parseInt($('#now3').text());
				allPeopleCount = now1 + now2 + now3;
				// 버튼의 텍스트를 업데이트
				$('.nowTotal').text('선택된 인원 수 : ' + allPeopleCount);
				
				}
				

				////////////////////////////////////////////////////////////
				
				$(document).ready(function() {
					// 인원 수 선택 버튼이 클릭될 때마다 좌석 선택 버튼을 활성화하거나 비활성화합니다.
					$('.how-many .count').on('click', function() {
						// 선택한 성인, 청소년, 우대 인원 수를 가져옵니다.
						var adultCount = parseInt($('.how-many .cell:nth-child(1) .now').text());
						var teenCount = parseInt($('.how-many .cell:nth-child(2) .now').text());
						var specCount = parseInt($('.how-many .cell:nth-child(3) .now').text());

						// 선택한 인원 수와 같은 개수의 좌석 선택 버튼을 활성화합니다.
						var total = adultCount + teenCount + specCount;
						$('.seat').prop('disabled', false);
						$('.reserved').prop('disabled', true );
						console.log("aaaa", $(".reserved").eq(0).prop("disabled"));
						//$('.seat').slice(total).prop('disabled', true );
					});

					$('.seat').prop('disabled', true );
				});
				
				
				////////////////////////////////////////////////////////////	
				$(".pagePrevious").on("click",function(){
					location.href="/ticketing.do";
				});
				
				$(".pageNext").on("click",function(){
					var movieTitle = $(".result-title").text();	
					var theaterBranch = $(".tBrch").text();
					var scheduleStartEnd = $(".info-time").text();
					var choiceDtDay = $(".toDate").text();// 상영시간
					
					var joinSeats = selectedSeats.join("/"); //좌석 구분자 "/" 추가
					var numOfPeople = $(".numberOfPeople").text();//연령
					var totalAmount = $(".amount").text();
					scheduleNo = $(".hiddenSpan").text();//선택한 영화의 스케쥴넘버
					console.log("자르기 전 "+numOfPeople);//
					
					//////////////////////////////////////////////////////////////////////////////
					//regExp = /^[ㄱ-ㅎㅏ-ㅣ가-힣]+$/;
					
					const adultCount = parseInt($('#now1').text());
					const teenCount = parseInt($('#now2').text());
					const specCount = parseInt($('#now3').text());
					const countArr = new Array();
					for(let i=0;i<adultCount;i++){
						countArr.push(1);
					}
					for(let i=0;i<teenCount;i++){
						countArr.push(2);
					}
					for(let i=0;i<specCount;i++){
						countArr.push(3);
					}



					////////////////////////////////////////////////////////////////////////////////////
					console.log(scheduleNo);
					console.log(theaterBranch);
					console.log(choiceDtDay);
					console.log(numOfPeople);//성인,청소년,우대
					console.log(countArr);//1,2,3
					console.log("joinSeats : "+joinSeats);
					location.href = "/paymentMethod.do?movieTitle=" + movieTitle + "&scheduleStartEnd=" + scheduleStartEnd + "&theaterBranch=" + theaterBranch +"&choiceDtDay="+choiceDtDay +"&joinSeats="+joinSeats+"&numOfPeople="+numOfPeople+"&countArr="+countArr.join("/")+"&totalAmount="+totalAmount+"&scheduleNo="+scheduleNo;
				});
			</script>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</body>

		</html>