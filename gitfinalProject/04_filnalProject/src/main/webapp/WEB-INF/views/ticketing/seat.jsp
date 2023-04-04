<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	.content-all-wrap{
		position: relative;
	}
	.content-title-wrap{
		border-top: 1px solid black;
		width: 640px;
		overflow: hidden;
	}
	.content-title{
		height: 50px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.title-p{
		font-size: 20px;
		width: 400px;
		height: 30px;
		line-height: 30px;
		float: left;
	}
	.content-wrap{
		width:640px; 
		height:500px; 
		border: 1px solid #d8d9db;
	}
	#reset-btn{
		border: 1px solid #d8d9db;
		border-radius: 5px;
		width: 100px;
		height: 30px;
		font-size: 15px;
		background-color: #fff;
		float: right;
	}
	.how-many{
		border-bottom: 1px solid #ebebeb;
		background-color: #ebebeb;
		height: 40px;
		padding: 10px 0 10px 20px;
		min-height: 50px;
	}

	.cell{
		float: left;
		width: 25%;
	}
	.select-many-people{
		float: left;
		padding: 0 10px 0 0;
		line-height: 30px;
	}
	.count{
		float: left;
		width: 100px;
	}
	.down{
		float: left;
		width: 30px;
		height: 30px;
		border: 1px solid #ccc;
		border-radius: 5px 0 0 5px;

	}
	.number{
		position: relative;
		float: left;
		width: 40px;
	}
	.now{
		width: 40px;
		height: 30px;
		border: 1px solid #ccc;
		border-width: 1px 0;
	}
	.num-choice{
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
	.on{
		color: #fff;
		background-color: #555;
	}
	.up{
		float: left;
		width: 30px;
		height: 30px;
		border: 1px solid #ccc;
		border-radius: 0 5px 5px 0;
	}
	.seat-wrap{
		height: 450px;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	.screen{
		height: 50px;
	}
	.screen>img{
		width: 500px;
		height: 30px;
	}
	.content-result{
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
		padding: 5px 5px 5px 5px;
	}
	
	.result-wrap{
		
	}
	.result-title{
		
	}
	.result-info{
		
	}
	.result-seat{

	}
	.result-pay{

	}
	.result-btn{

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
									<button type="button" class="now">0</button>
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
									<button type="button" class="now">0</button>
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
									<button type="button" class="now">0</button>
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
							<img src="/src/main/webapp/resources/images/common/screen.png">
						</div>
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

						</div>
					</div>
				</div>
			</div>


		</div>

</body>
</html>