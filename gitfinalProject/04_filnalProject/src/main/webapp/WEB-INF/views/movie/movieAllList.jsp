<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link rel="stylesheet" href="/resources/css/movieAllList.css">
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
                            <button type="button" title="개봉작만보기" class="btn-onair btnOnAir">개봉작만</button>
                            <span>총 몇개의 영화가 검색되었습니다.</span>
                            <div class="searchBox">
                                <input type="text" id="movieSearch" name="movieSearch" placeholder="영화명 검색">
                                <img src="img/search-30.png">
                            </div>
                        </div>
                        <div class="movie-list-content-mid active-movie-more clearfix">
                            <div class="movie-all-list-flex"
                                style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                                <c:forEach items="${list}" var="po">
                                <div class="movie-all-list" style="margin-top: 25px; ">
                                    <div class="movie-list-set" style="overflow: hidden;">
                                        <a href="/movieDetail.do?movieNo=${po.movieNo}">
                                  
                                            <div class="img-poster">
                                                <img src="/resources/upload/movie/${po.mainFile.movieFileName}" style="width: 230px; height:331px;">
                                            </div>
                                            <div class="cover" style=" color:white; padding: 10px;">
                                                <div class="coverMovieContent" style="font-size: 12px;">
                                                    <p>${po.movieContent}</p>
                                                </div>
                                                <div class="coverMovieRate" style="position: absolute; left: 0; bottom: 15px; padding-top: 10px; margin: 0 auto; text-align: center;">
                                                    <p style="font-size: 18px;">관람평</p>
                                                    <div class="innerCoverMovieRate" style="margin-top: 10px; padding-top: 10px; width: 230px; border-top:1px solid lightgray; font-size: 20px;">
                                                        <p>점수</p>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </a>
                                        <div class="movie-title-wrap" style="margin-top: 20px; font-size: 24px;">
                                            <p class="movie-title" >${po.movieTitle }</p>
                                            <input class="inputMovieTitle" style="display:none;" value="${po.movieTitle }">
                                        </div>
                                        <div class="reserve-rate" style="font-size: 18px;">
                                            <p>예매율%</p>
                                        </div>
                                        <div class="start-date" style="font-size: 18px;">
                                            <p>${po.movieDate}</p>
                                        </div>
                                        <div class="movieAllList-like" style="margin-top: 10px; float: left;">
                                            <button type="button"
                                                style="width: 76px; height: 40px; font-size: 18px; border: 1px solid lightgray; background-color: transparent; border-radius: 5px;"><img
                                                    src="img/pink_heart.png"
                                                    style="width:18px; height:18px;">1234</button>
                                        </div>
                                        <div class="movieAllList-reserve" style="margin-top: 10px;"">
                                        <button type=" button"
                                            style="width: 150px; height: 40px; font-size: 18px; border: 1px solid lightgray; background-color: transparent; border-radius: 5px; vertical-align: center;">
                                            예약하기
                                        </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="bottom-btn" style="margin-left: 55px; margin-top: 20px;">
                                <button type="button" id="load">더보기</button>
                            </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <script>
                  function test1() {
            $.ajax({
                url : 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=71cbebfb432511f450b163d5ba780945&targetDt=20230405&weekGb=1',
                type : 'get',
                dataType : 'json',
                success : function(data) {
                    console.log(data.boxOfficeResult);
            }
            }

        )}
		
        $(".movie-list-set").on("click",function(){
        	const inputMovieTitle=$(".inputMovieTitle").val();

        	$.ajax({
                url : 'http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=079dc5f01aab66e87cb9c6689349c5b6&movieNm=inputMovieTitle',
                type : 'get',
                dataType : 'json',
                success : function(data) {
                    console.log(data.movieListResult.dailyBoxOfficeList[0].audiAcc)
            		const audiCount =data.boxOfficeResult.dailyBoxOfficeList[0].audiAcc;
                    
                }
            });
        });
                  
                  
                  
       
            



            </script>



            <script src="/resources/js/movieAllList.js"></script>
        </body>

        </html>