<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
			<style>
				*{
					box-sizing: border-box;
				}
				.theater-box {
					position: relative;
					display: block;
					width: 100%;
					min-height: 300px;
					border: 3px solid #686571;
					border-radius: 10px;
				}

				.theater-place {
					width: 100%;
				}

				.theater-tabs {
					margin: 0;
					padding: 0;
				}

				.theater-city {
					float: left;
					width: calc(100%/7);
					line-height: 45px;
					border: 1px solid #e0e0e0;
					text-align: center;
					box-sizing: border-box;
				}

				.theater-tabs>li.active-tab {
					background-color: #555;
					color: #fff;
				}

				.theater-tabs>li.active-tab>button {
					color: #fff;
				}

				.sel-city {
					display: block;
					width: 100%;
					background: 0 0;
					font-size: 15px;
					border: none;
				}

				.sel-city:hover {
					cursor: pointer;
				}

				.tab-content {
					position: absolute;
					left: 0;
					top: 50px;
					width: 100%;
					min-height: 85px;
					padding: 30px 0px;
				}

				.tab-content>ul {
					overflow: hidden;
					width: 100%;
				}

				.tab-content>ul>li {
					position: relative;
					float: left;
					width: 25%;
					line-height: 25px;
					text-align: left;
					padding-left: 40px;
				}

				.tab-content>ul>li:nth-child(2):after {
					content: '';
					position: absolute;
					left: 0;
					right: 0;
					width: 1px;
					height: 1000%;
					background: #e0e0e0;
				}

				.tab-content>ul>li:nth-child(3):after {
					content: '';
					position: absolute;
					left: 0;
					right: 0;
					width: 1px;
					height: 1000%;
					background: #e0e0e0;
				}

				.tab-content>ul>li:nth-child(4):after {
					content: '';
					position: absolute;
					left: 0;
					right: 0;
					width: 1px;
					height: 1000%;
					background: #e0e0e0;
				}

				.theater-detail {
					color: #444;
					font-size: 15px;
				}

				.theater-detail:hover {
					text-decoration: underline;
				}
			</style>
		</head>

		<body>
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			<div class="all-wrap" style="width: 1000px; margin: 0 auto;">
				<div class="header-line" style="height: 100px;"></div>
				<div class="header-wrap">
					<div class="header-title" style="margin-top: 30px; margin-bottom: 30px;">
						<h1 style="font-size: 30px;">전체극장</h1>
					</div>
				</div>
				<div class="theater-box" id="theater-box">
						<div class=" theater-place">
					<ul class="theater-tabs">
						<li class="theater-city active-tab"
							style="border-top-left-radius: 5px; border-left: #555; border-top: #555;">
							<button type="button" class="sel-city">서울</button>
							<div class="tab-content" id="tab-content">
								<ul>
									<li><a href="/detailTheater.do" class="theater-detail">강남</a></li>
									<li><a href="#" class="theater-detail">강남대로(씨티)</a></li>
									<li><a href="#" class="theater-detail">강동</a></li>
									<li><a href="#" class="theater-detail">군자</a></li>
									<li><a href="#" class="theater-detail">더 부티크 목동현대백화점</a></li>
									<li><a href="#" class="theater-detail">동대문</a></li>
									<li><a href="#" class="theater-detail">마곡</a></li>
									<li><a href="#" class="theater-detail">목동</a></li>
									<li><a href="#" class="theater-detail">상봉</a></li>
									<li><a href="#" class="theater-detail">상암월드컵경기장</a></li>
									<li><a href="#" class="theater-detail">성수</a></li>
									<li><a href="#" class="theater-detail">센트럴</a></li>
									<li><a href="#" class="theater-detail">송파파크하비오</a></li>
									<li><a href="#" class="theater-detail">신촌</a></li>
									<li><a href="#" class="theater-detail">이수</a></li>
									<li><a href="#" class="theater-detail">창동</a></li>
									<li><a href="#" class="theater-detail">코엑스</a></li>
									<li><a href="#" class="theater-detail">홍대</a></li>
									<li><a href="#" class="theater-detail">화곡</a></li>
									<li><a href="#" class="theater-detail">ARTNINE</a></li>
								</ul>
							</div>
						</li>
						<li class="theater-city" style=" border-top: #555;">
							<button type="button" class="sel-city">경기</button>
							<div class="tab-content">
								<ul>
									<li><a href="#" class="theater-detail">고양스타필드</a></li>
									<li><a href="#" class="theater-detail">광명AK플라자</a></li>
									<li><a href="#" class="theater-detail">광명소하</a></li>
									<li><a href="#" class="theater-detail">금정AK플라자</a></li>
									<li><a href="#" class="theater-detail">김포한강신도시</a></li>
									<li><a href="#" class="theater-detail">남양주</a></li>
									<li><a href="#" class="theater-detail">남양주현대아울렛 스페이스원</a></li>
									<li><a href="#" class="theater-detail">동탄</a></li>
									<li><a href="#" class="theater-detail">미사강변</a></li>
									<li><a href="#" class="theater-detail">백석벨라시타</a></li>
									<li><a href="#" class="theater-detail">별내</a></li>
									<li><a href="#" class="theater-detail">부천스타필드시티</a></li>
									<li><a href="#" class="theater-detail">분당</a></li>
									<li><a href="#" class="theater-detail">수원</a></li>
									<li><a href="#" class="theater-detail">수원남문</a></li>
									<li><a href="#" class="theater-detail">수원호매실</a></li>
									<li><a href="#" class="theater-detail">시흥배곧</a></li>
									<li><a href="#" class="theater-detail">안산중앙</a></li>
									<li><a href="#" class="theater-detail">안성스타필드</a></li>
									<li><a href="#" class="theater-detail">양주</a></li>
									<li><a href="#" class="theater-detail">영통</a></li>
									<li><a href="#" class="theater-detail">용인기흥</a></li>
									<li><a href="#" class="theater-detail">용인테크노밸리</a></li>
									<li><a href="#" class="theater-detail">의정부민락</a></li>
									<li><a href="#" class="theater-detail">일산</a></li>
									<li><a href="#" class="theater-detail">킨텍스</a></li>
									<li><a href="#" class="theater-detail">파주금촌</a></li>
									<li><a href="#" class="theater-detail">파주운정</a></li>
									<li><a href="#" class="theater-detail">파주출판도시</a></li>
									<li><a href="#" class="theater-detail">하남스타필드</a></li>
								</ul>
							</div>
						</li>
						<li class="theater-city" style=" border-top: #555;">
							<button type="button" class="sel-city">인천</button>
							<div class="tab-content">
								<ul>
									<li><a href="#" class="theater-detail">검단</a></li>
									<li><a href="#" class="theater-detail">송도</a></li>
									<li><a href="#" class="theater-detail">영종</a></li>
									<li><a href="#" class="theater-detail">인천논현</a></li>
									<li><a href="#" class="theater-detail">청라지젤</a></li>
								</ul>
							</div>
						</li>
						<li class="theater-city" style=" border-top: #555;">
							<button type="button" class="sel-city">대전/충청/세종</button>
							<div class="tab-content">
								<ul>
									<li><a href="#" class="theater-detail">공주</a></li>
									<li><a href="#" class="theater-detail">논산</a></li>
									<li><a href="#" class="theater-detail">대전</a></li>
									<li><a href="#" class="theater-detail">대전신세계 아트앤사이언스</a></li>
									<li><a href="#" class="theater-detail">대전유성</a></li>
									<li><a href="#" class="theater-detail">대전중앙로</a></li>
									<li><a href="#" class="theater-detail">대전현대아울렛</a></li>
									<li><a href="#" class="theater-detail">세종(조치원)</a></li>
									<li><a href="#" class="theater-detail">세종나성</a></li>
									<li><a href="#" class="theater-detail">세종청사</a></li>
									<li><a href="#" class="theater-detail">오창</a></li>
									<li><a href="#" class="theater-detail">진천</a></li>
									<li><a href="#" class="theater-detail">천안</a></li>
									<li><a href="#" class="theater-detail">청주사창</a></li>
									<li><a href="#" class="theater-detail">홍성내포</a></li>
								</ul>
							</div>
						</li>
						<li class="theater-city" style=" border-top: #555;">
							<button type="button" class="sel-city">부산/대구/경상</button>
							<div class="tab-content">
								<ul>
									<li><a href="#" class="theater-detail">경북도청</a></li>
									<li><a href="#" class="theater-detail">경산하양</a></li>
									<li><a href="#" class="theater-detail">경주</a></li>
									<li><a href="#" class="theater-detail">구미강동</a></li>
									<li><a href="#" class="theater-detail">김천</a></li>
									<li><a href="#" class="theater-detail">남포항</a></li>
									<li><a href="#" class="theater-detail">대구신세계(동대구)</a></li>
									<li><a href="#" class="theater-detail">대구이시아</a></li>
									<li><a href="#" class="theater-detail">덕천</a></li>
									<li><a href="#" class="theater-detail">마산</a></li>
									<li><a href="#" class="theater-detail">문경</a></li>
									<li><a href="#" class="theater-detail">부산극장</a></li>
									<li><a href="#" class="theater-detail">부산대</a></li>
									<li><a href="#" class="theater-detail">북대구(칠곡)</a></li>
									<li><a href="#" class="theater-detail">사상</a></li>
									<li><a href="#" class="theater-detail">삼천포</a></li>
									<li><a href="#" class="theater-detail">양산</a></li>
									<li><a href="#" class="theater-detail">양산증산</a></li>
									<li><a href="#" class="theater-detail">울산</a></li>
									<li><a href="#" class="theater-detail">정관</a></li>
									<li><a href="#" class="theater-detail">진주(중안)</a></li>
									<li><a href="#" class="theater-detail">창원</a></li>
									<li><a href="#" class="theater-detail">창원내서</a></li>
									<li><a href="#" class="theater-detail">포항</a></li>
									<li><a href="#" class="theater-detail">해운대(장산)</a></li>
								</ul>
							</div>
						</li>
						<li class="theater-city" style=" border-top: #555;">
							<button type="button" class="sel-city">광주/전라</button>
							<div class="tab-content">
								<ul>
									<li><a href="#" class="theater-detail">광주상무</a></li>
									<li><a href="#" class="theater-detail">광주하남</a></li>
									<li><a href="#" class="theater-detail">목포하당(포르모)</a></li>
									<li><a href="#" class="theater-detail">순천</a></li>
									<li><a href="#" class="theater-detail">여수웅천</a></li>
									<li><a href="#" class="theater-detail">전대(광주)</a></li>
									<li><a href="#" class="theater-detail">전주객사</a></li>
									<li><a href="#" class="theater-detail">전주송천</a></li>
									<li><a href="#" class="theater-detail">전주혁신</a></li>
									<li><a href="#" class="theater-detail">첨단</a></li>
								</ul>
							</div>
						</li>
						<li class="theater-city"
							style="border-top-right-radius: 5px; border-right: #555; border-top: #555 ;">
							<button type="button" class="sel-city">강원</button>
							<div class="tab-content">
								<ul>
									<li><a href="#" class="theater-detail">남춘천</a></li>
									<li><a href="#" class="theater-detail">속초</a></li>
									<li><a href="#" class="theater-detail">원주</a></li>
									<li><a href="#" class="theater-detail">원주센트럴</a></li>
									<li><a href="#" class="theater-detail">춘천석사</a></li>
								</ul>
							</div>
						</li>
					</ul>









				</div>
			</div>







			</div>
			</div>
			<script>
				$(".theater-city").on("click", function () {
					$(".theater-city").removeClass("active-tab");
					$(this).addClass("active-tab");
					const contents = $(".tab-content");
					contents.hide();
					const index = $(".theater-city").index(this);
					contents.eq(index).show();
				});
				$(".theater-city").eq(0).click();


				
			</script>
		</body>

		</html>