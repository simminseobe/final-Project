<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.date-btn{
		font-size: 20px;
	}
</style>
</head>
<body>
	<div class="all-wrap" style="width:1000px; margin: 0 auto;">
		<div class="header-line" style="height:100px;"></div>
		<div class="header-wrap">
			<div class="header-title" style="margin-top:30px; margin-bottom:30px;">
				<h1 style="font-size:30px;">빠른예매</h1>
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
			<div>
				<div class="choice-movie">
					
				</div>
				<div class="choice-theater">
				
				</div>
				<div class="choice-time">
					
				</div>
			</div>
			
		</div>
	</div>
	<script>
		// 이전 버튼 클릭 이벤트
		document.querySelector(".prev-date-btn").addEventListener("click", function() {
		  // 이전 날짜로 이동하는 코드
		});
	
		// 날짜 버튼 클릭 이벤트
		document.querySelectorAll(".date-btn").forEach(function(button) {
		  button.addEventListener("click", function() {
		    // 해당 날짜 정보를 가져와서 예매 페이지를 열도록 하는 코드
		  });
		});
	
		// 다음 버튼 클릭 이벤트
		document.querySelector(".next-date-btn").addEventListener("click", function() {
		  // 다음 날짜로 이동하는 코드
		});
	</script>
</body>
</html>
