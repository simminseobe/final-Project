<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
		<style>
			* {
				box-sizing: border-box;
			}
			
			.all-wrap {
				width: 100%;
				margin: 0;
				padding: 40px 0 0 0;
			}

			.bg-wrap {
				position: relative;
				z-index: 1;
				height: 190px;
				margin: 0;
				color: #ccc;
				background-color: #111;
			}

			.bg-img {
				position: absolute;
				left: 50%;
				top: 0;
				z-index: 1;
				width: 1100px;
				margin: 0 0 0 -550px;
				height: 100%;
				background-position: center 0;
				background-repeat: no-repeat;
			}

			.bg-pattern {
				position: absolute;
				left: 0;
				top: 0;
				z-index: 2;
				width: 100%;
				height: 100%;
				background: url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-detail-pattern.png) repeat-x 0 0;
			}

			.bg-mask {
				position: absolute;
				left: 0;
				top: 0;
				z-index: 3;
				width: 100%;
				height: 100%;
				background: url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-detail-mask.png) no-repeat center 0;
			}
			.ahead-than-bg {
				position: relative;
				z-index: 4;
				width: 1100px;
				height: 100%;
				margin: 0 auto;
				padding: 0;
			}
			.city-area-wrap{
				display: block;
				position: relative;
				width: 100%;
			}
			.city-area{
				border-bottom: 1px solid rgba(255,255,255,.15);
			}
			.each-city{
				float: left;
				margin-left: 72px;
			}
			.each-city>a{
				position: relative;
				display: block;
				color: #fff;
				line-height: 60px;
				padding: 0 5px;
			}
			.sub{
				display: none;
				position: absolute;
				top: 60px;
				left: 0;
				width: 100%;
				padding: 10px 20px;
				background-color: #fff;
				border-radius: 8px;
				z-index: 10;
				box-shadow: 10px 10px 10px rgba(0,0,0,.2);
			}
			.sub>ul>li{
				float: left;
				margin: 5px 0;
			}
			.sub>ul>li>a{
				position: relative;
				display: block;
				vertical-align: middle;
				color: #444;
				padding: 0 11px;
				font-size: 15px;
			}
			.sub>ul>li>a:hover{
				color: #01738b;
			}
			.sub>ul>li>a::after{
				content: '';
				position: absolute;
				top: 50%;
				right: 0;
				width: 1px;
				height: 12px;
				margin-top: -6px;
				background-color: #d8d9db;
			}
			/*--------------------------------------------------*/
			/*--------------------------------------------------*/
			/*--------------------------------------------------*/
			.inner-wrap{
				width: 1100px;
				margin: 0 auto;
				padding-top: 40px;
			}
			.inner-wrap::after{
				clear: both;
			}
			.inner-wrap::before{
				content: '';
				display: table;
			}
			.tab-list{
				position: static;
				width: 100%;
				background-color: rgba(255,255,255);
				margin-bottom: 40px;
			}
			.tab-list::after{
				clear: both;
			}
			.tab-list::before{
				content: '';
				display: table;
			}
			.tab-list>ul{
				position: relative;
				width: 100%;
				height: 42px;
			}
			.tab-list>ul::after{
				content: '';
				display: block;
				position: absolute;
				left: 0;
				bottom: 0;
				z-index: 2;
				width: 100%;
				height: 1px;
				background-color: #503396;
			}
			.tab-list>ul>li.on{
				border: 1px solid #503396;
				border-bottom: 0;
				z-index: 3;
				color: #503396;
				background-color: #fff;
			}
			
			.tab-list>ul>li{
				float: left;
				height: 42px;
				margin: 0;
				border: 1px solid #ebebeb;
				border-width: 1px 0 1px 1px;
				position: relative;
				display: block;
				width: 100%;
				height: 41px;
				line-height: 40px;
				padding: 0;
				text-align: center;
				color: #222;
				font-size: 1.0667em;
				text-decoration: none;
			}
			.tab-list>ul>li:first-child{
				width: 50%;
			}
			.tab-list>ul>li:last-child{
				width: 50%;
			}
			.tab-list>ul>li>a{
				position: relative;
				display: block;
				width: 100%;
				height: 41px;
				line-height: 40px;
				padding: 0;
				text-align: center;
				color: #222;
				font-size: 1.0667em;
				text-decoration: none;
			}
			.tab-list>ul>li.on>a{
				z-index: 3;
				color: #503396;
				background-color: #fff;
			}
			.tab-list>ul>li.on>a:focus{
				color: #503396;
				text-decoration: none;
			}
		</style>
	</head>

	<body style="overflow: auto; overflow-y: scroll; letter-spacing: 0; line-height: 1.5; font-size: 15px; color: #444; font-weight: 400;">
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<div class="all-wrap">
			<div class="bg-wrap">
				<div class="bg-img"
					style="background-image: url(https://www.megabox.co.kr/static/pc/images/theater/img-theater-detail.jpg);">
				</div>
				<div class="bg-pattern"></div>
				<div class="bg-mask"></div>
				<div class="ahead-than-bg"> <!--.theater-all-->
					<div class="city-area-wrap"><!--.theater-area-list-->
						<ul class="city-area"><!--.area-depth1-->
							<li class="each-city on">
								<a href="#">서울</a>
								<div class="sub">
									<ul>
										<li><a href="#">강남</a></li>
										<li><a href="#">강남대로(씨티)</a></li>
										<li><a href="#">강동</a></li>
										<li><a href="#">군자</a></li>
										<li><a href="#">더 부티크 목동현대백화점</a></li>
										<li><a href="#">동대문</a></li>
										<li><a href="#">마곡</a></li>
										<li><a href="#">목동</a></li>
										<li><a href="#">상봉</a></li>
										<li><a href="#">상암월드컵경기장</a></li>
										<li><a href="#">성수</a></li>
										<li><a href="#">센트럴</a></li>
										<li><a href="#">송파파크하비오</a></li>
										<li><a href="#">신촌</a></li>
										<li><a href="#">이수</a></li>
										<li><a href="#">창동</a></li>
										<li><a href="#">코엑스</a></li>
										<li><a href="#">홍대</a></li>
										<li><a href="#">화곡</a></li>
										<li><a href="#">ARTNINE</a></li>
									</ul>
								</div>
							</li>
							<li class="each-city">
								<a href="#">경기</a>
								<div class="sub">
									<ul>
										<li><a href="#">고양스타필드</a></li>
										<li><a href="#">광명AK플라자</a></li>
										<li><a href="#">광명소하</a></li>
										<li><a href="#">금정AK플라자</a></li>
										<li><a href="#">김포한강신도시</a></li>
										<li><a href="#">남양주</a></li>
										<li><a href="#">남양주현대아울렛 스페이스원</a></li>
										<li><a href="#">동탄</a></li>
										<li><a href="#">미사강변</a></li>
										<li><a href="#">백석벨라시타</a></li>
										<li><a href="#">별내</a></li>
										<li><a href="#">부천스타필드시티</a></li>
										<li><a href="#">분당</a></li>
										<li><a href="#">수원</a></li>
										<li><a href="#">수원남문</a></li>
										<li><a href="#">수원호매실</a></li>
										<li><a href="#">시흥배곧</a></li>
										<li><a href="#">안산중앙</a></li>
										<li><a href="#">안성스타필드</a></li>
										<li><a href="#">양주</a></li>
										<li><a href="#">영통</a></li>
										<li><a href="#">용인기흥</a></li>
										<li><a href="#">용인테크노밸리</a></li>
										<li><a href="#">의정부민락</a></li>
										<li><a href="#">일산</a></li>
										<li><a href="#">킨텍스</a></li>
										<li><a href="#">파주금촌</a></li>
										<li><a href="#">파주운정</a></li>
										<li><a href="#">파주출판도시</a></li>
										<li><a href="#">하남스타필드</a></li>
									</ul>
								</div>
							</li>
							<li class="each-city">
								<a href="#">인천</a>
								<div class="sub">
									<ul>
										<li><a href="#">검단</a></li>
										<li><a href="#">송도</a></li>
										<li><a href="#">영종</a></li>
										<li><a href="#">인천논현</a></li>
										<li><a href="#">청라지젤</a></li>
									</ul>
								</div>
							</li>
							<li class="each-city">
								<a href="#">대전/충청/세종</a>
								<div class="sub">
									<ul>
										<li><a href="#">공주</a></li>
										<li><a href="#">논산</a></li>
										<li><a href="#">대전</a></li>
										<li><a href="#">대전신세계 아트앤사이언스</a></li>
										<li><a href="#">대전유성</a></li>
										<li><a href="#">대전중앙로</a></li>
										<li><a href="#">대전현대아울렛</a></li>
										<li><a href="#">세종(조치원)</a></li>
										<li><a href="#">세종나성</a></li>
										<li><a href="#">세종청사</a></li>
										<li><a href="#">오창</a></li>
										<li><a href="#">진천</a></li>
										<li><a href="#">천안</a></li>
										<li><a href="#">청주사창</a></li>
										<li><a href="#">홍성내포</a></li>
									</ul>
								</div>
							</li>
							<li class="each-city">
								<a href="#">부산/대구/경상</a>
								<div class="sub">
									<ul>
										<li><a href="#">경북도청</a></li>
										<li><a href="#">경산하양</a></li>
										<li><a href="#">경주</a></li>
										<li><a href="#">구미강동</a></li>
										<li><a href="#">김천</a></li>
										<li><a href="#">남포항</a></li>
										<li><a href="#">대구신세계(동대구)</a></li>
										<li><a href="#">대구이시아</a></li>
										<li><a href="#">덕천</a></li>
										<li><a href="#">마산</a></li>
										<li><a href="#">문경</a></li>
										<li><a href="#">부산극장</a></li>
										<li><a href="#">부산대</a></li>
										<li><a href="#">북대구(칠곡)</a></li>
										<li><a href="#">사상</a></li>
										<li><a href="#">삼천포</a></li>
										<li><a href="#">양산</a></li>
										<li><a href="#">양산증산</a></li>
										<li><a href="#">울산</a></li>
										<li><a href="#">정관</a></li>
										<li><a href="#">진주(중안)</a></li>
										<li><a href="#">창원</a></li>
										<li><a href="#">창원내서</a></li>
										<li><a href="#">포항</a></li>
										<li><a href="#">해운대(장산)</a></li>
									</ul>
								</div>
							</li>
							<li class="each-city">
								<a href="#">광주/전라</a>
								<div class="sub">
									<ul>
										<li><a href="#">광주상무</a></li>
										<li><a href="#">광주하남</a></li>
										<li><a href="#">목포하당(포르모)</a></li>
										<li><a href="#">순천</a></li>
										<li><a href="#">여수웅천</a></li>
										<li><a href="#">전대(광주)</a></li>
										<li><a href="#">전주객사</a></li>
										<li><a href="#">전주송천</a></li>
										<li><a href="#">전주혁신</a></li>
										<li><a href="#">첨단</a></li>
									</ul>
								</div>
							</li>
							<li class="each-city">
								<a href="#">강원</a>
								<div class="sub">
									<ul>
										<li><a href="#">남춘천</a></li>
										<li><a href="#">속초</a></li>
										<li><a href="#">원주</a></li>
										<li><a href="#">원주센트럴</a></li>
										<li><a href="#">춘천석사</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--------------------------------------------------------------->
			<!--------------------------------------------------------------->
			<!--------------------------------------------------------------->
			<div class="inner-wrap">
				<div class="tab-list">
					<ul>
						<li class="on"><a href="#">극장정보</a></li>
						<li><a href="#">상영시간표</a></li>
					</ul>
				</div>
				<div class="tab-content-wrap"></div>
			</div>



		</div>




		<script>

			$(".each-city").on("mouseover", function () {
				$(".each-city").removeClass("on");
				$(this).addClass("on");
				const contents = $(".sub");
				contents.hide();
				const index = $(".each-city").index(this);
				contents.eq(index).show();
			}).on("mouseout", function () { // 마우스 아웃 이벤트 추가
				const contents = $(".sub");
				contents.hide();
			});
			$(".each-city").eq(0).click();

			
			$(".tab-list>ul>li").on("click", function() {
				$(".tab-list>ul>li").removeClass("on");
				$(this).addClass("on");
				const content = $(".tab-content-wrap");
				content.hide();
				
				const index = $(".tab-list>ul>li").index(this);
				content.eq(index).show();
			});
			$(".tab-list>ul>li").eq(0).click();
			
			
		</script>
	</body>

	</html>