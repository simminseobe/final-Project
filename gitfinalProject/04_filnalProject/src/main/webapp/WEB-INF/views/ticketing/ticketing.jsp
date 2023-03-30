<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="all-wrap">
		<div class="header-wrap">
			<div class="header-title">
				<h1>빠른예매</h1>
			</div>
		</div>
		<div class="content-wrap">
			<div class="date-list">
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