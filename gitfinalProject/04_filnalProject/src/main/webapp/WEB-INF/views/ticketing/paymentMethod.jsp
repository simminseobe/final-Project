<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.result-title {
	
}

.result-info {
	
}

.result-seat {
	
}

.result-pay {
	
}

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
	background-color: #e0e0e0;
	color: #aaaaaa;
	font-size: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="all-wrap" style="width: 1000px; margin: 0 auto;">
		<div class="header-line" style="height: 100px;"></div>
		<div class="header-wrap">
			<div class="header-title"
				style="margin-top: 30px; margin-bottom: 30px;">
				<h1 style="font-size: 30px;">빠른예매</h1>
			</div>
		</div>
		<div class="content-all-wrap">

			<div class="content-title-wrap">
				<div class="content-title">
					<p class="title-p">관람권 및 할인적용</p>
					<button type="button" onclick="resetBtn()" id="reset-btn">초기화</button>
				</div>
			</div>

			<div class="content-wrap">
				<div class="discount">
					<div class="sub-discount"></div>
				</div>
				<div class="discount">
					<div class="sub-discount"></div>
				</div>
				<div class="discount">
					<div class="sub-discount"></div>
				</div>
				
				<div class="payment">
					<div class="payment-title">
						<p class="title-p">결제수단선택</p>
					</div>
					<div class="payment-choice">
						<div class="radio-box">


							<input type="radio" name="payment" id="card" value="card">
							<label for="card">신용/체크카드</label> <input type="radio"
								name="payment" value="card">
						</div>
					</div>
				</div>

			</div>


			<div class="content-result">
				<div class="result-wrap">
					<div class="result-title"></div>
					<div class="result-info"></div>
					<div class="result-seat"></div>
					<div class="pay"></div>
					<div class="result-btn">
						<a href="/ticketing.do" class="pagePrevious">이전</a> <a
							href="javascript:void(0)" class="pageNext">다음</a> <input
							type="hidden" id="memberYN" value="${sessionScope.m.memberId }">
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>