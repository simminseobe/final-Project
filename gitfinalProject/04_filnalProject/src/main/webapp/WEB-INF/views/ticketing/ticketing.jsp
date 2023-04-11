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
.date-list {
	border-top: 1px solid black;
}
/*
			.date-btn {
				font-size: 20px;
			}
			*/
/*날짜부분*/
.reserve-date {
	padding-top: 5px;
	display: flex;
	flex-direction: row;
	align-items: center;
	overflow: scroll;
	overflow-y: hidden;
}

.movie-date-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 5px 2px;
	width: 100px; /* 버튼 가로 크기 조정 */
	/* 기타 버튼 스타일링 속성들 */
}

.movie-week-of-day {
	margin-left: 5px;
	font-size: 10px;
	width: 12px;
	height: 22px;
	line-height: 22px;
}

.movie-day {
	text-align: center;
	width: 34px;
	height: 22px;
	font-size: 17px;
	font-weight: bold;
}

.saturday {
	color: #31597E;
	font-weight: bold;
}

.sunday {
	color: #AF2D2D;
	font-weight: bold;
}

.movie-date-wrapper {
	background-color: transparent;
}

.movie-date-wrapper-active {
	background-color: #333333;
}

.movie-date-wrapper-active>* {
	color: white;
}
/**/
.choice-wrap {
	overflow: hidden;
}

.choice-movie {
	background-color: antiquewhite;
	height: 400px;
	width: 250px;
	float: left;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 20px;
}

.choice-theater {
	background-color: aqua;
	height: 400px;
	width: 300px;
	float: left;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 20px;
}

.choice-time {
	background-color: brown;
	height: 400px;
	width: 450px;
	float: left;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 20px;
}

.choice-header p {
	height: 40px;
	font-size: 20px;
	padding-top: 5px;
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
				<h1>
					<a href="/choiceSeat.do">좌석선택(test)</a>
				</h1>
				<h1>
					<a href="/paymentMethod.do">결제수단(test)</a>
				</h1>
				<h1>
					<a href="/testPage.do">테스트페이지(test)</a>
				</h1>
				<h1>
					<a href="/testPage2.do">테스트페이지2(test)</a>
				</h1>
			</div>
		</div>
		<div class="content-wrap" style="height: 500px;">
			<div class="date-list">


				<div class="day-part">
					<div class="reserve-title"></div>
					<div class="reserve-date"></div>
				</div>


			</div>




			<div class="choice-wrap">
				<div class="choice-movie">
					<div class="choice choice-header">
						<p>영화</p>
						<div class="list-area">
							<div class="movie-list"
								style="background-color: #fff; height: 340px;">
								<div class="scroll-container">
									<ul>
										<c:forEach items="${list }" var="movieList">
											<li>
												<div class="oneMovie">
													<span class="movie-grade age-12">${movieList.movieRating }</span>
													<span class="movie-title">${movieList.movieTitle }</span> <i
														class="heart">관심영화</i>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="choice-theater">
					<div class="choice choice-header">
						<p>극장</p>
						<div class="theater-list"
							style="background-color: #fff; height: 340px;"></div>
					</div>
				</div>
				<div class="choice-time">
					<div class="choice choice-header">
						<p>시간</p>
						<div class="time-list"
							style="background-color: #fff; height: 340px;"></div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script>
			const date = new Date();
            // console.log(date.getFullYear());
            const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
            const reserveDate = document.querySelector(".reserve-date");
    
            
                const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
                const year = date.getFullYear();
                const month = date.getMonth();
                for (i = date.getDate(); i <= lastDay.getDate(); i++) {
    
                    const button = document.createElement("button");
                    const spanWeekOfDay = document.createElement("span");
                    const spanDay = document.createElement("span");
    
                    //class넣기
                    button.classList = "movie-date-wrapper"
                    spanWeekOfDay.classList = "movie-week-of-day";
                    spanDay.classList = "movie-day";
    
                    //weekOfDay[new Date(2020-03-날짜)]
                    const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];
    
                    //요일 넣기
                    if (dayOfWeek === "토") {
                        spanWeekOfDay.classList.add("saturday");
                        spanDay.classList.add("saturday");
                    } else if (dayOfWeek === "일") {
                        spanWeekOfDay.classList.add("sunday");
                        spanDay.classList.add("sunday");
                    }
                    spanWeekOfDay.innerHTML = dayOfWeek;
                    button.append(spanWeekOfDay);
                    //날짜 넣기
                    spanDay.innerHTML = i;
                    button.append(spanDay);
                    //button.append(i);
                    reserveDate.append(button);
    
                    dayClickEvent(button);
                }
    
            
    
    
                function dayClickEvent(button) {
                    button.addEventListener("click", function() {
                        const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                        movieDateWrapperActive.forEach((list) => {
                            list.classList.remove("movie-date-wrapper-active");
                        })
                        button.classList.add("movie-date-wrapper-active");
                    })
                }

		</script>
		<script src="/resources/js/seat.js"></script>
</body>

</html>