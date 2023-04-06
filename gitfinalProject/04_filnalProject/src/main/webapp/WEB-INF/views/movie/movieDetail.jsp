<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href= "/resources/css/movieDetail.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="movie-detail-top"  style="margin: 0 auto; margin-top: 100px;">
        <div class="bg-img" style="background-image:url('https://img.megabox.co.kr/SharedImg/2023/03/17/u3QIqDdXhaAoIZTQoyz1blmF8n9aPeLw_570.jpg'); background-repeat: no-repeat; background-size:100%;"></div>
        <div class="bg-pattern"></div>
        <div class="bg-mask">
            <div class="movie-detail-top-content" style="position: relative;">
                <p class="d-day" style="float: left;">예매D-1</p>
                <p class="contents-type" style="font-size: 22px; width: 300px; margin-left: 10px; display: inline-block;">#무비아일랜드토크 #무대인사</p>
                <p class="title" style="font-size: 54px; position: absolute; left: 0; top: 100px;">리바운드</p>
                <div class="btn-like" style="position: absolute; top: 35%;">
                    <button type="button" class="likeBtn" style="width: 150px; height: 40px;">
                        <i class="heart-icon">
                            <img src="img/pink_heart.png" style="vertical-align: middle; width: 17px; height: 15px;">
                            <span style="vertical-align: middle;">좋아요 갯수</span>
                        </i>
                    </button>
                </div>
                <div class="movie-Score-wrap" style="position: absolute; bottom: 10%;">
                    <p class="movieScoreTitle" style="padding-bottom: 10px; font-size: 15px;">실관람평점</p>
                    <p class="movieScoreContent" style="text-align: center; font-size: 36px;">9.1</p>
                </div>
                <div class="reservationRate-wrap" style="position: absolute; left: 10%; bottom: 10%;">
                    <p class="reservationTitle" style="padding-bottom: 10px; font-size: 15px;">예매율</p>
                    <p class="reservaionCount"style="text-align: center; font-size: 36px;">1<span class="reservavionPer" style="font-size: 12px;"> 위 (20%)</span></p>
                </div>
                <div class="audienceCount-wrap" style="position: absolute; left: 20%; bottom: 10%;">
                    <p class="audienceTitle" style="padding-bottom: 10px; font-size: 15px;">누적관객수</p>
                    <p class="audienceCount" style="text-align: center; font-size: 36px;">10000<span class="audienceSpan" style="font-size: 12px;"> 명</span></pre>
                </div>
                <div class="poster-img" style="position: absolute; top: 10%; right: 0;">
                    <img src="/img/리바운드.jpg" style="border-radius: 10px; width: 260px; height: 375px;">
                </div>
                <div class="detailReservBtnWap" style="position: absolute; bottom: 7%; right: 0;">
                    <button type="button" style="width: 260px; height: 46px; border-radius: 5px; background-color: #329eb1; color: white; font-size: 18px;">예약하기</button>
                </div>
            </div>
        </div>
    </div>
    <div class="movie-detail-content-wrap"style="width:1100px; margin: 0 auto; margin-top:50px;">
        <div class="movie-detail-menu">
            <ul>
                <li><a href="#">주요정보</a></li>
                <li><a href="#">실관람평</a></li>
                <li><a href="#">무비포스트</a></li>
                <li><a href="#">예고편/스틸컷</a></li>
            </ul>
            <div class = "detail-content-wrap">
                <div class="importantInfo-content-wrap">
                    <div class = "importantInfo-content detail" style="font-size:18px;">
                   농구선수 출신 공익근무요원 ‘양현’은
                        <br>
                        해체 위기에 놓인 부산중앙고 농구부의 신임 코치로 발탁된다.
                        <br>
                        하지만 전국대회에서의 첫 경기 상대는 고교농구 최강자 용산고.
                        <br>
                        팀워크가 무너진 중앙고는 몰수패라는 치욕의 결과를 낳고
                        <br>
                        학교는 농구부 해체까지 논의하지만,
                        <br>
                        ‘양현’은 MVP까지 올랐던 고교 시절을 떠올리며 다시 선수들을 모은다.
                        <br>
                        주목받던 천재 선수였지만 슬럼프에 빠진 가드 ‘기범’
                        <br>
                        부상으로 꿈을 접은 올라운더 스몰 포워드 ‘규혁’
                        <br>
                        점프력만 좋은 축구선수 출신의 괴력 센터 ‘순규’
                        <br>
                        길거리 농구만 해온 파워 포워드 ‘강호’
                        <br>
                        농구 경력 7년 차지만 만년 벤치 식스맨 ‘재윤’
                        <br>
                        농구 열정만 만렙인 자칭 마이클 조던 ‘진욱’까지
                        <br>
                        <br>
                        아무도 주목하지 않은 최약체 팀이었지만 신임 코치와 6명의 선수가
                        <br>
                        2012년 전국 고교농구대회에서 써 내려간 8일간의 기적
                        <br>
                        모두가 불가능이라 말할 때, 우리는 ‘리바운드’라는 또 다른 기회를 잡는다.
                        <br>
                        <div class="bottom-btn toggle">
                            <button type="button" id="more-btn" class="more">더보기</button>
                        </div>
                    </div>
                    <div class="movie-detail-info-wrap" style="margin-top: 20px;">
                        <div class="movie-detail-info">
                            <p>상영타입 : 2D</p>
                            <div class="pLine">
                            <p>감독 : 장항준</p>
                            <p>장르 : 드라마/122분</p>
                            <p>등급 : 12세이상관람가</p>
                            <p>개봉일 : 2023.04.05</p>
                            </div>
                            <p>출연진 : 안재홍, 이신영, 정진운, 김택, 정건주, 기민, 안지호</p>
                        </div>
                    </div>
                    <div class="detail-chart" style="margin-top: 20px; position: relative; width: 100%;">
                        <div class="col"style="border: 1px solid black; position: absolute; top: 0px; width: 366.33px; height:380px; display:inline-block; float:left;">
                            <div class="pointTxt" style="padding-top: 50px; font-size: 18px; line-height: 18px;">
                                <h2>관람포인트</h2>
                                <h2>스토리,연출</h2>
                            </div>
                            <div class="chart" style="text-align: center;">
                                <canvas id="myChart" width="216" height="216" style="margin:0 auto;"></canvas>
                            </div>
                        </div>
                        <div class="col" style="position: absolute; top: 0px; left:366px; border: 1px solid black; width: 366.33px; height:380px;">
                            <div class="pointTxt" style=" margin: 0 auto; padding-top: 50px; text-align: center; font-size: 18px; line-height: 18px;">
                                <h2>실관람평점</h2>
                                <div class="circle" style="margin: 0 auto; margin-top: 30px; vertical-align: center; z-index: 12; width: 120px; height: 120px; line-height: 120px; background-color: #6543b1;  border-radius: 120px;">
                                    <em>평점</em>
                                </div>
                                <div class="reserve-rate-circle" style="margin-top: 30px;">
                                    <h3>예매율</h3>
                                    <span id="rankTag" style="display:inline-block; margin-top: 20px; font-size: 24px;">예매율나옴%</span>
                                </div>    
                            </div>
                        </div>
                        <div class="col" style="position: absolute; top: 0px; right: 0; border: 1px solid black; width: 366px; height:380px;">
                            <div class="pointTxt" style="padding-top: 50px; font-size: 18px; line-height: 18px;">
                                <h2>누적관객수</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </div>
    
    <script>
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'radar',
            data: {
                labels: ['영상미', '스토리', '배우', 'OST', '연출'],
                datasets: [{
                    label: '# of Votes',
                    data: [19, 3, 5, 10, 3],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: false, 
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
        </script>
    <script src = "/resources/js/movieDetail.js"></script>
</body>
</html>