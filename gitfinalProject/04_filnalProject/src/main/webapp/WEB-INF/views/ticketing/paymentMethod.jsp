<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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

.discount-wrap{
	/* 감싸고 있는 것에서 높이가 빠져야 아래 아코디언메뉴들이 열리면서 숨겨져있다가 나오는 요소들의 높이를 더 가져가는 형식으로 됨*/
	margin-top: 20px;
}
.discount-type{
	position: relative;
	height: 55px;
	line-height: 30px;
	
	margin-left: 0;
	margin-bottom: 10px;
	border: 1px solid #d8d9db;
	font-weight: bold;
}
.discount-type>p{
	width: 500px;
	height: 55px;
	line-height: 55px;
	margin-right: 0;
	margin-left: 15px;
	font-size: 16px;
	float: left;
	
}
.more{
	position: absolute;
	font-size: 25px;
	color: #666;
	display: block;
	float: left;
	right: 20px;
	height: 55px;
	line-height: 55px;
	transition-duration: 0.7s;
}
.more:hover{
	cursor: pointer;
}
.active{
	transform: rotate(180deg);
}

.sub-div{
	overflow: hidden;
	display: none;
	width: 100%;
	
}
.sub-discount{
	float: left;
	border: 1px solid #d8d9db;
	width: 150px;
	height: 60px;
	line-height: 60px;
	margin-right: 5px;
	margin-bottom: 5px;
}
.sub-discount>p{
	text-align: center;
	font-size: 13px;
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

.paying {
	display: block;
	float: left;
	margin: 0;
	width: 150px;
	height: 50px;
	line-height: 40px;
	background-color: #329eb1;
	color: #fff;
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
				<div class="discount-wrap">
					<div class="discount-type">
						<p>메가박스 포인트/쿠폰</p>
						<span class="material-symbols-outlined more">expand_more</span>
					</div>
					<div class="sub-div">
						<div class="sub-discount"><p>메가박스 멤버쉽 포인트</p></div>
						<div class="sub-discount"><p>메가박스 할인쿠폰</p></div>
						<div class="sub-discount"><p>메가박스 VIP영화쿠폰</p></div>
					</div>
				</div>
				<div class="discount-wrap">
					<div class="discount-type">
						<p>관람권/모바일상품권</p>
						<span class="material-symbols-outlined more">expand_more</span>
					</div>
					<div class="sub-div">
						<div class="sub-discount"><p>메가박스 관람권</p></div>
						<div class="sub-discount"><p>메가박스/페이즈 금액권</p></div>
						<div class="sub-discount"><p>스토어교환권</p></div>
						<div class="sub-discount"><p>모바일 관람권</p></div>
						<div class="sub-discount"><p>도서문화상품권</p></div>
						<div class="sub-discount"><p>컬쳐랜드 모바일 문화상품권</p></div>
						<div class="sub-discount"><p>메가박스 아너스카드</p></div>
					</div>
				</div>
				<div class="discount-wrap">
					<div class="discount-type">
						<p>제휴포인트</p>
						<span class="material-symbols-outlined more">expand_more</span>
					</div>
					<div class="sub-div">
						<div class="sub-discount"><p>U+ 멤버쉽</p></div>
						<div class="sub-discount"><p>OK 캐쉬백</p></div>
						<div class="sub-discount"><p>L.POINT</p></div>
						<div class="sub-discount"><p>GS & POINT</p></div>
						<div class="sub-discount"><p>현대오일뱅크</p></div>
						<div class="sub-discount"><p>해피포인트</p></div>
						<div class="sub-discount"><p>블루멤버스 포인트</p></div>
						<div class="sub-discount"><p>중앙멤버쉽</p></div>
						<div class="sub-discount"><p>현대 M 포인트카드</p></div>
						<div class="sub-discount"><p>해피머니상품권 해피캐시</p></div>
						<div class="sub-discount"><p>도서상품권 북앤라이프캐시</p></div>
						<div class="sub-discount"><p>문화상품권 컬쳐캐시</p></div>
						<div class="sub-discount"><p>문화누리카드</p></div>
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
						<a href="/choiceSeat.do" class="pagePrevious">이전</a> 
						<a href="javascript:void(0)" class="paying">결제</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		/*다 열림*/
		/*
		$(".more").on("click",function(event){
			$(this).parent().next().slideToggle();
			$(this).toggleClass("active");
			event.stopPropagation();
		});
		$(".more").parent().on("click",function(){
			$(this).children().last().click();
		});
		*/
		/*하나가 열리면 다른건 닫힘*/
		$(".more").on("click", function() {
			var subDiv = $(this).parent().next(".sub-div");
			$(".sub-div").not(subDiv).slideUp(); 				// 다른 .sub-div 요소들을 닫음
			$(this).toggleClass("active");						//현재 효과가 적용된 곳에는 .active 추가
			$(".more").not($(this)).removeClass("active");;		// 다른 .more 요소들의 active 클래스 제거
			$(this).children(".more").toggleClass("active");;	// 현재 클릭한 .discount-type의 하위 .more 요소의 active 클래스 토글
			subDiv.slideToggle();; 								// 현재 클릭한 .discount-type의 다음 .sub-div 요소를 슬라이드 업/다운
			event.stopPropagation();							//이벤트버블링 막기
		});
		



		

		
	</script>
</body>
</html>