<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href= "/resources/css/movieAllList.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
</head>
<body>
    <div class="movie-list-wrap" style="width:1100px; margin: 0 auto;">
		<div class="movieList-title-wrap" style="margin-top: 100px;">
            <h1 style="font-size:30px;">전체영화</h1>
		</div>
        <div class="movie-list-wrap">
            <div class="movie-list-menu">
                <ul>
                    <li><a href="#">박스오피스</a></li>
                    <li><a href="#">상영예정작</a></li>
                    <li><a href="#">특별상영</a></li>
                    <li><a href="#">필름소사이어티</a></li>
                    <li><a href="#">클래식소사이어티</a></li>
                    <li><a href="#">사용자 선호장르영화</a></li>
                </ul>
            </div>
            <div class="movie-list-content-wrap" style="margin-top: 25px;">
                <div class="movie-list-content-top">
                    <button type="button"  title="개봉작만보기" class="btn-onair btnOnAir">개봉작만</button>
                    <span>총 몇개의 영화가 검색되었습니다.</span>
                    <div class="searchBox">
                        <input type="text" id="movieSearch" name="movieSearch" placeholder="영화명 검색">
                        <img src="img/search-30.png">
                    </div>
                </div>
                <div class="movie-list-content-mid active-movie-more clearfix">
                    <div class="movie-all-list" style="margin-top: 25px; margin-left: 0px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/리바운드.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">리바운드</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/스즈메.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">스즈메</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/에어.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">에어</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/슬램.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">슬램덩크</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; margin-left: 0px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/리바운드.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">리바운드</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/스즈메.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">스즈메</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/에어.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">에어</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/슬램.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">슬램덩크</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; margin-left: 0px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/리바운드.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">리바운드</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/스즈메.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">스즈메</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/에어.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">에어</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/슬램.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">슬램덩크</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; margin-left: 0px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/리바운드.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">리바운드</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/스즈메.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">스즈메</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/에어.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">에어</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/슬램.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">슬램덩크</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; margin-left: 0px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/리바운드.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">리바운드</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/스즈메.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">스즈메</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/에어.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">에어</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/슬램.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">슬램덩크</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="movie-all-list" style="margin-top: 25px; width: 230px;">
                        <div class="movie-list-set"> 
                        <a href="#">
                            <div class="img-poster">
                                <img src="img/슬램.jpg" style="width: 230px; height:331px;">
                            </div>
                            <div class="cover"></div>
                        </a>
                            
                                <div class="movie-title-wrap" style="margin-top: 20px;">
                                    <p class="movie-title">슬램덩크</p>
                                </div>
                                <div class="reserve-rate">
                                    <p>예매율%</p>
                                </div>
                                <div class="start-date">
                                    <p>개봉일</p>
                                </div>
                            
                        </div>
                    </div>
                    <div class="bottom-btn">
                        <button type="button" id="more-btn">더보기</button>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <script src = "/resources/js/movieAllList.js"></script>
    <script>


    </script>
</body>
</html>