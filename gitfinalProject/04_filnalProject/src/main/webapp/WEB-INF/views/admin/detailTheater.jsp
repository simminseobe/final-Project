<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					background:
						url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-detail-pattern.png) repeat-x 0 0;
				}

				.bg-mask {
					position: absolute;
					left: 0;
					top: 0;
					z-index: 3;
					width: 100%;
					height: 100%;
					background:
						url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-detail-mask.png) no-repeat center 0;
				}

				.ahead-than-bg {
					position: relative;
					z-index: 4;
					width: 1100px;
					height: 100%;
					margin: 0 auto;
					padding: 0;
				}

				.city-area-wrap {
					display: block;
					position: relative;
					width: 100%;
				}

				.city-area {
					border-bottom: 1px solid rgba(255, 255, 255, .15);
				}

				.each-city {
					float: left;
					margin-left: 72px;
				}

				.each-city>a {
					position: relative;
					display: block;
					color: #fff;
					line-height: 60px;
					padding: 0 5px;
				}

				.sub {
					display: none;
					position: absolute;
					top: 60px;
					left: 0;
					width: 100%;
					padding: 10px 20px;
					background-color: #fff;
					border-radius: 8px;
					z-index: 10;
					box-shadow: 10px 10px 10px rgba(0, 0, 0, .2);
				}

				.sub>ul>li {
					float: left;
					margin: 5px 0;
				}

				.sub>ul>li>a {
					position: relative;
					display: block;
					vertical-align: middle;
					color: #444;
					padding: 0 11px;
					font-size: 15px;
				}

				.sub>ul>li>a:hover {
					color: #01738b;
				}

				.sub>ul>li>a::after {
					content: '';
					position: absolute;
					top: 50%;
					right: 0;
					width: 1px;
					height: 12px;
					margin-top: -6px;
					background-color: #d8d9db;
				}

				.now-theater {
					position: absolute;
					top: 50px;
					width: 100%;
					overflow: hidden;
					padding: 40px 0 0 0;
					text-align: center;
					color: #fff;
					font-size: 3.0666em;
					font-weight: 400;
					line-height: 1.1;
					text-shadow: 2px 2px 10px rgba(0, 0, 0, .7);
				}

				/*--------------------------------------------------*/
				/*--------------------------------------------------*/
				/*--------------------------------------------------*/
				.inner-wrap {
					width: 1100px;
					margin: 0 auto;
					padding-top: 40px;
				}

				.inner-wrap::after {
					clear: both;
				}

				.inner-wrap::before {
					content: '';
					display: table;
				}

				.tab-list {
					position: static;
					width: 100%;
					background-color: rgba(255, 255, 255);
					margin-bottom: 40px;
				}

				.tab-list::after {
					clear: both;
				}

				.tab-list::before {
					content: '';
					display: table;
				}

				.tab-list>ul {
					position: relative;
					width: 100%;
					height: 42px;
				}

				.tab-list>ul::after {
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

				.tab-list>ul>li.on {
					border: 1px solid #503396;
					border-bottom: 0;
					z-index: 3;
					color: #503396;
					background-color: #fff;
				}

				.tab-list>ul>li {
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

				.tab-list>ul>li:first-child {
					width: 50%;
				}

				.tab-list>ul>li:last-child {
					width: 50%;
				}

				.tab-list>ul>li>a {
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

				.tab-list>ul>li.on>a {
					z-index: 3;
					color: #503396;
					background-color: #fff;
				}

				.tab-list>ul>li.on>a:focus {
					color: #503396;
					text-decoration: none;
				}

				.btn {
					margin-top: 10px;
				}

				.mapBtn {
					font-size: 13px;
					color: #fff;
					line-height: 36px;
					border: 0;
					background: #503396;
					width: 110px;
					border-radius: 5px;
					cursor: pointer;
				}

				.mapBtn>img {
					vertical-align: -3px;
					margin-right: 5px;
					line-height: 50%;
				}
			</style>
		</head>

		<body
			style="overflow: auto; overflow-y: scroll; letter-spacing: 0; line-height: 1.5; font-size: 15px; color: #444; font-weight: 400;">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			<div class="all-wrap">
				<div class="bg-wrap">
					<div class="bg-img"
						style="background-image: url(https://www.megabox.co.kr/static/pc/images/theater/img-theater-detail.jpg);">
					</div>
					<div class="bg-pattern"></div>
					<div class="bg-mask"></div>
					<div class="ahead-than-bg">
						<!--.theater-all-->
						<div class="city-area-wrap">
							<!--.theater-area-list-->
							<ul class="city-area">
								<!--.area-depth1-->
								<li class="each-city on"><a href="javascript:void(0)">서울</a>
									<div class="sub">
										<ul class="brchNo">
											<li><a href="/selectOneTheater.do?theaterNo=1">강남</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=2">강남대로(씨티)</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=3">강동</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=4">군자</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=5">더 부티크
													목동현대백화점</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=6">동대문</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=7">마곡</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=8">목동</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=9">상봉</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=10">상암월드컵경기장</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=11">성수</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=12">센트럴</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=13">송파파크하비오</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=14">신촌</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=15">이수</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=16">창동</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=17">코엑스</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=18">홍대</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=19">화곡</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=20">ARTNINE</a></li>
										</ul>
									</div>
								</li>
								<li class="each-city"><a href="javascript:void(0)">경기</a>
									<div class="sub">
										<ul class="brchNo">
											<li><a href="/selectOneTheater.do?theaterNo=21">고양스타필드</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=22">광명AK플라자</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=23">광명소하</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=24">금정AK플라자</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=25">김포한강신도시</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=26">남양주</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=27">남양주현대아울렛
													스페이스원</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=28">동탄</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=29">미사강변</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=30">백석벨라시타</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=31">별내</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=32">부천스타필드시티</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=33">분당</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=34">수원</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=35">수원남문</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=36">수원호매실</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=37">시흥배곧</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=38">안산중앙</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=39">안성스타필드</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=40">양주</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=41">영통</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=42">용인기흥</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=43">용인테크노밸리</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=44">의정부민락</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=45">일산</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=46">킨텍스</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=47">파주금촌</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=48">파주운정</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=49">파주출판도시</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=50">하남스타필드</a></li>
										</ul>
									</div>
								</li>
								<li class="each-city"><a href="javascript:void(0)">인천</a>
									<div class="sub">
										<ul class="brchNo">
											<li><a href="/selectOneTheater.do?theaterNo=51">검단</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=52">송도</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=53">영종</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=54">인천논현</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=55">청라지젤</a></li>
										</ul>
									</div>
								</li>
								<li class="each-city"><a href="javascript:void(0)">대전/충청/세종</a>
									<div class="sub">
										<ul class="brchNo">
											<li><a href="/selectOneTheater.do?theaterNo=56">공주</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=57">논산</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=58">대전</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=59">대전신세계
													아트앤사이언스</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=60">대전유성</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=61">대전중앙로</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=62">대전현대아울렛</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=63">세종(조치원)</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=64">세종나성</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=65">세종청사</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=66">오창</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=67">진천</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=68">천안</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=69">청주사창</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=70">홍성내포</a></li>
										</ul>
									</div>
								</li>
								<li class="each-city"><a href="javascript:void(0)">부산/대구/경상</a>
									<div class="sub">
										<ul class="brchNo">
											<li><a href="/selectOneTheater.do?theaterNo=71">경북도청</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=72">경산하양</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=73">경주</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=74">구미강동</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=75">김천</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=76">남포항</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=77">대구신세계(동대구)</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=78">대구이시아</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=79">덕천</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=80">마산</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=81">문경</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=82">부산극장</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=83">부산대</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=84">북대구(칠곡)</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=85">사상</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=86">삼천포</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=87">양산</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=88">양산증산</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=89">울산</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=90">정관</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=91">진주(중안)</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=92">창원</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=93">창원내서</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=94">포항</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=95">해운대(장산)</a></li>
										</ul>
									</div>
								</li>
								<li class="each-city"><a href="javascript:void(0)">광주/전라</a>
									<div class="sub">
										<ul class="brchNo">
											<li><a href="/selectOneTheater.do?theaterNo=96">광주상무</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=97">광주하남</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=98">목포하당(포르모)</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=99">순천</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=100">여수웅천</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=101">전대(광주)</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=102">전주객사</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=103">전주송천</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=104">전주혁신</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=105">첨단</a></li>
										</ul>
									</div>
								</li>
								<li class="each-city"><a href="javascript:void(0)">강원</a>
									<div class="sub">
										<ul class="brchNo">
											<li><a href="/selectOneTheater.do?theaterNo=106">남춘천</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=107">속초</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=108">원주</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=109">원주센트럴</a></li>
											<li><a href="/selectOneTheater.do?theaterNo=110">춘천석사</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
						<p class="now-theater">${theater.theaterBranch }</p>
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
					<div class="branch-content-wrap">
						<div class="branch-info">
							<div class="content"></div>
							${theater.theaterContent }
							<div class="facility"></div>
							${theater.theaterFacility }

							<div class="address">
								<span>도로명주소 : </span> <span class="addr" style="font-weight: 300;">${theater.theaterAddr
									}</span>
							</div>
						</div>
						<div class="btn">
							<button type="button" id="mapGogo" class="mapBtn"><img src="/img/ping.png"></img>실시간
								길찾기</button>
						</div>
					</div>
				</div>



			</div>



			<script>
				var theaterAddr = "${theater.theaterAddr}"; //실제 영화관 주소를 할당
				var link = document.createElement("a");
				link.href = "https://m.map.naver.com/search2/search.naver?query=" + theaterAddr + "#/map";
				// 버튼 클릭 이벤트 핸들러
				document.getElementById("mapGogo").addEventListener("click", function () {
					// 링크를 열기 위해 window.open() 함수를 사용합니다.
					window.open(link.href);
				});

				$(".each-city").on("mouseover", function () {
					$(".each-city").removeClass("on");
					$(this).addClass("on");
					const contents = $(".sub");
					contents.hide();
					const index = $(".each-city").index(this);
					contents.eq(index).show();
				});
				//$(".each-city").eq(0).click();
				/*
				.on("mouseout", function () { // 마우스 아웃 이벤트 추가
					const contents = $(".sub");
					contents.hide();
				});
				$(".each-city").eq(0).click();
				 */
				$(".sub").on("mouseout", function () {
					const index = $(".sub").index(this);
					$(".each-city").eq(index).removeClass("on");
					$(this).hide();
				}).hide(); // .sub 요소 숨김 처리

				$(".each-city").eq(0).click();

				$(".tab-list>ul>li").on("click", function () {
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