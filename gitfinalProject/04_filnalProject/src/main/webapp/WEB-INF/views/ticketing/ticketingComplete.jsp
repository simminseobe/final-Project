<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	.ticket-body{
		border-radius: 10px;
	}
	.ticket-body-all-wrap{
		position: relative;
		height: 430px;
		padding: 15px 0;
	}
	.ticket-body-wrap{
		overflow: hidden;
	}
	.ticket-body-left{
		float: left;
		border-top-left-radius: 15px;
		border-bottom-left-radius: 15px;
		width: 300px; 
		height: 400px; 
		background-color: #444;
		
	}
	.t-num{
		overflow: hidden;
		width: 300px;
		margin: 30px 60px;
	}
	.t-num>p{
		margin-right: 10px;
		text-align: center;
		font-size: 18px;
		color: #c4c4c4;
		float: left;
	}
	.t-num>p:last-child{
		text-align: center;
		color: #59bec9;
		font-size: 20px;
		font-weight: bold;
		float: left;
	}
	.t-img>img{
		display: block;
		width: 180px;
		height: 250px;
		margin: 0 auto;
	}
	.ticket-body-right{
		float: left;
		border-top-right-radius: 15px;
		border-bottom-right-radius: 15px;
		width: 693px; 
		height: 400px; 
		background-color: #333;
		padding: 25px 50px;
	}
	.complete-msg{
		color: #59bec9;
		font-size: 25px;
		font-weight: bold;
		width: 560px;
		height: 45px;
		border-bottom: 1px solid #434343;
	}
	
	.complete-msg>h1>i{
		font-style: italic;
	}
	.complete-content{
		padding: 25px 0 25px 25px;
		height: 270px;
		border-bottom: 1px solid #434343;
	}
	.content-tt{
		float: left;
	}
	.content-tt>ul>li{
		list-style-type: square;
		color: #c4c4c4;
		font-size: 18px;
		padding: 6px;
		width: 120px;
	}
	.content-ct{
		float: left;
		width: 250px;
		height: 210px;
	}
	.content-ct>ul>li{
		color: #fff;
		font-size: 18px;
		padding: 6px 0;
	}
	.top-white-circle{
		position: absolute;
		top: 0;
		left: 285px;
		width: 30px;
		height: 30px;
		border-radius: 40px;
		background-color: #fff;
	}
	.bottom-white-circle{
		position: absolute;
		bottom: 0;
		left: 285px;
		width: 30px;
		height: 30px;
		border-radius: 40px;
		background-color: #fff;
	}
	.bottom-white-circle{
		position: absolute;
	}
	

	.announce{
		border: 1px solid #c4c4c4;
		border-radius: 5px;
		padding: 10px;
		font-size: 13px;
		margin: 0 auto;
		width: 990px;
	}
	.announce>ul>li>ul>li>p{
		padding: 15px 0;
	}
	.a-li{
		padding: 5px 0;
	}
	.a-li>p{
		padding: 2px 0 2px 10px;
	}
	.bottom-wrap{
		margin-bottom: 200px;
	}
	
	.goHome-btn{
		display: block;
		border-radius: 5px;
		border: 1px solid #503396;
		background-color: #503396;
		color: #fff;
		width: 100px;
		height: 40px;
		line-height: 35px;
		font-size: 15px;
		text-align: center;
		margin: 0 auto;
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
				<h1 style="font-size: 30px; color: #503396;">예매완료</h1>
			</div>
			<div class="ticket-body-all-wrap">
				<div class="ticket-body-wrap">
					<div class="top-white-circle"></div>
					<div class="ticket-body-left">
						
						<div class="t-num">
							<p>티켓 결제번호</p>
							<p>${ticketingComplete.payNo}</p>
						</div>
						
						
						<div class="t-img" style="margin-top: 10px;">
							<img src="/resources/upload/movie/${mfp}">
						</div>
					</div>
					<div class="ticket-body-right">
						<div class="t-info">
							<div class="complete-msg">
								<h1>예매가 완료되었습니다<i>!</i></h1>
							</div>
							<div class="complete-content">
								<div class="content-tt">
									<ul>
										<li>예매영화</li>
										<li>관람극장</li>
										<li>관람일시</li>
										<li>관람인원</li>
										<li>좌석번호</li>
										<li>전화번호</li>
										<li>결제정보</li>
									</ul>
								</div>
								<div class="content-ct">
									<ul>
										<li>${ticketingComplete.movieTitle}</li>
										<li>${ticketingComplete.theaterBranch}</li>
										<li>
											<span style="padding-right: 10px;">${ticketingComplete.choiceDtDay}</span>
											<span>${ticketingComplete.scheduleStart}</span>
										</li>
										<li>${ticketingComplete.numOfPeople}</li>
										<li>${ticketingComplete.joinSeats}</li>
										<li>${ticketingComplete.memberPhone}</li>
										<li>
											<span style="color: #59bec9; font-size: 22px;">${ticketingComplete.payPrice}</span>
											<span>원</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="bottom-white-circle"></div>
					<div class="deg" style="position: absolute; right: 0; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:33px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:53px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:73px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:93px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:113px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:133px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:153px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:173px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:193px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:213px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:233px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:253px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:273px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:293px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:313px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:333px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:353px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:373px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
					<div class="deg" style="position: absolute; right: 0; top:393px; width: 20px; height: 20px; transform: rotate(45deg); background-color: #fff;"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="btn-wrap" style="height: 55px;">
		<a href="/" class="goHome-btn">홈으로</a>
	</div>
	<div class="bottom-wrap">
		<div class="announce">
			<ul>
				<li>상영안내</li>
				<ul>
					<li class="a-li">
						<p>- 쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</p>
						<p>- 지연입장에 의한 관람불편을 최소화하고자 본 영화는 10분 후 시작됩니다.</p>
						<p>- 상영시간 20분전까지 취소 가능하며, 캡쳐화면으로는 입장하실 수 없습니다.</p>
					</li>
				</ul>
			</ul>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
		
	</script>
</body>
</html>