<%@page import="kr.or.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    
-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href= "/resources/css/movieDetail.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.modal {
	/*position을 absolute에서 fixed로 변경
            왜냐? fixed를 하면 스크롤을 내려도 그 자리에 고정되어 있기때문에*/
	/*box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
            여기에 있던 이것을 modal_content로 이동*/
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center; /*justfy-content는 가로축을 중심축으로 함*/
	align-items: center; /*align-items는 세로축을 중심축으로 함
                                즉, center를 넣으면 세로축의 중앙으로 정렬하게 됨*/
    z-index: 5;
                            }

.modal_overlay {
	/*모달 전체 배경색 설정*/
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: absolute;
   z-index: 6;
    
}

.modal_content {
    z-index: 7;
	background-color: white;
	padding: 10px 10px;
	text-align: center;
	position: relative;
	top: 0px;
	width: 500px;
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
       
}

.hidden {
	display: none;
}

.material-symbols-outlined {
        font-variation-settings:
        'FILL' 1,
        'wght' 400,
        'GRAD' 0,
        'opsz' 48
        }
.star>span{
    color: gray;
    }
.s-yellow{
    color: yellow;
    }
</style>
</head>
<body>
    <div class="movie-detail-top"  style="margin: 0 auto; margin-top: 100px;">
        <div class="modal hidden"><!--모달로 댓글 작성 들어가는 자리-->
            <div class="modal_overlay"></div>
            <div class="modal_content"><!--모달 댓글 내부화면-->
                <form name="watchPoint" action="/watchPointInsert.do" method="post">
                <input type="text" name="movieNo" id="movieNo" value="${mov.movieNo }" style="display:none;">
                <input type="text" name="memberId" value="${sessionScope.m.memberId}" style="display:none;">
                <div class="modalClose">
                    <div class="modalCloseTit">
                        <span>관람평 작성하기</span>                    
                    </div>
                </div>
                <div class="modal_content_tit">
                    <p>${mov.movieTitle }</p>
                    <p>어떠셨나요?</p>
                </div>
                <div class = "star-wrap star-wrap1">
                    <span class="material-symbols-outlined">
                        star
                    </span>
                    <span class="material-symbols-outlined">
                        star
                    </span>
                    <span class="material-symbols-outlined">
                        star
                    </span>
                    <span class="material-symbols-outlined">
                        star
                    </span>
                    <span class="material-symbols-outlined">
                        star
                    </span>
                    <div class="modalStar-result">
                        <input type="text" name="movieScore" id="star-result2" value="0" style="display: none;">
                        <span id ="star-result" style="color:#6543b1">0</span>
                        <span style="color:#6543b1">점</span>
                    </div>
                </div>
                <div class="modalTxtArea">
                    <textarea name="reviewContent"></textarea>
                </div>
                <div class="modal_content_tit" style="margin-top: 50px;">
                    <p>관람포인트는 무엇인가요?</p>
                    <p style="font-size: 18px; margin-top: 5px;">(최대 5개 선택가능)</p>
                </div>
                <div class="modalWatchPointChk">
                    <div class="productionDiv">
                        <p><label for = "production">연출</label></p>
                        <input type = "checkbox" name ="production" id ="production" value="1">
                    </div>
                    <div class="storyDiv">
                        <p><label for = "story">스토리</label></p>
                        <input type = "checkbox" name ="story" id = "story" value="1">
                    </div>
                    <div class="visualDiv">
                        <p><label for = "videoVisual">영상미</label></p>
                        <input type = "checkbox" name ="videoVisual" id ="videoVisual" value="1">
                    </div>
                    <div class="actorDiv">
                        <p><label for = "actor">배우</label></p>
                        <input type = "checkbox" name="actor" id="actor" value="1">
                    </div>
                    <div class="OSTDiv">
                        <p><label for = "ost">OST</label></p>
                        <input type = "checkbox" name="ost" id ="ost" value="1">
                    </div>
                </div>
                <div class="modalContentBottom">
                    <button type="button" class="bc1" id="close1" style="margin-right: 5px;">닫기</button>
                    <button type="submit" name=reviewEnroll id="reviewEnroll" class="enrollBtn" style="margin-right: 5px;">등록</button>
                </div>
                </form>
            </div><!--모달 댓글 내부화면 끝-->
        </div><!--class="modal hidden 모달끝-->
        <div class="bg-img" style="background-image:url('/resources/upload/movie/${mov.mainFile.movieFileName}'); background-repeat: no-repeat; background-size:75%; background-position: center; background-position-y: 10%;"></div>
        <div class="bg-pattern"></div>
        <div class="bg-mask">
            <div class="movie-detail-top-content" style="position: relative;">
                <p class="d-day" style="float: left;">예매D-1</p>
                <p class="contents-type" style="font-size: 22px; width: 300px; margin-left: 10px; display: inline-block;">#무비아일랜드토크 #무대인사</p>
                <p class="title" style="font-size: 54px; position: absolute; left: 0; top: 100px;">${mov.movieTitle }</p>
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
                    <p class="movieScoreContent" style="text-align: center; font-size: 36px;">${watchPointAvg.movieScoreAvg}</p>
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
                    <img src="/resources/upload/movie/${mov.mainFile.movieFileName}" style="border-radius: 10px; width: 260px; height: 375px;">
                </div>
               
                <div class="detailReservBtnWap" style="position: absolute; bottom: 7%; right: 0;">
                    <button type="button" style="width: 260px; height: 46px; border-radius: 5px; background-color: #329eb1; color: white; font-size: 18px;">예약하기</button>
                </div>
            </div>
        </div>
    </div>
    <div class="movie-detail-content-wrap"style="width:1100px; margin: 0 auto; margin-top:50px; margin-bottom:500px;">
        <div class="movie-detail-menu">
            <ul class="tabs">
                <li><a href="#">주요정보</a></li>
                <li><a href="#">실관람평</a></li>
                <li><a href="#">무비포스트</a></li>
                <li><a href="#">예고편/스틸컷</a></li>
            </ul>
            <div class = "detail-content-wrap content-wrap">
                <div class="importantInfo-content-wrap tabcontent"><!--===================================-->
                    <div class = "importantInfo-content detail" style="font-size:18px;">
                   		${mov.movieContent}
                        <div class="bottom-btn toggle">
                            <button type="button" id="more-btn" class="more">더보기</button>
                        </div>
                    </div>
                    <div class="movie-detail-info-wrap" style="margin-top: 20px;">
                        <div class="movie-detail-info">
                            <p>상영타입 : ${mov.movieType}</p>
                            <div class="pLine">
                            <p>감독 : ${mov.movieDirector}</p>
                            <p>장르 : ${mov.movieGenre}/${mov.movieTime}</p>
                            <p>등급 : ${mov.movieRating}세이상관람가</p>
                            <p>개봉일 : ${mov.movieDate}</p>
                            </div>
                            <p>출연진 : ${mov.movieActor}</p>
                        </div>
                    </div>
                    <div class="detail-chart" style="margin-top: 20px; position: relative; width: 100%;">
                        <div class="col"style="border: 1px solid black; position: absolute; top: 0px; width: 366.33px; height:380px; display:inline-block; float:left;">
                            <div class="pointTxt" style="padding-top: 50px; font-size: 18px; line-height: 18px;">
                                <h2>관람포인트</h2>
                            </div>
                            <div class="chart" style="text-align: center;">
                                <canvas id="myChart" width="216" height="216" style="margin:0 auto;"></canvas>
                            </div>
                        </div>
                        <div class="col" style="position: absolute; top: 0px; left:366px; border: 1px solid black; width: 366.33px; height:380px;">
                            <div class="pointTxt" style=" margin: 0 auto; padding-top: 50px; text-align: center; font-size: 18px; line-height: 18px;">
                                <h2>실관람평점</h2>
                                <div class="circle" style="margin: 0 auto; margin-top: 30px; vertical-align: center; z-index: 12; width: 120px; height: 120px; line-height: 120px; background-color: #6543b1;  border-radius: 120px; color:#fff;">
                                    <em>${watchPointAvg.movieScoreAvg}</em>
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
                </div><!--========주요정보 끝나는 자리==================================================-->
                <div class="reviewAllWrap tabcontent" style="display: none;"><!--실관람평 시작 자리-->
                    <div class="reaviewHeadSawBtnWrap">
                        <div class="reviewHead">
                            <h2>${mov.movieTitle }에 대한<span style="color:#01738b;">123456</span>개의 이야기가 있어요.</h2>
                        </div>
                        <div class="sawMovie">
                            <button type="button" class="sawMovieBtn">본 영화 등록</button>
                        </div>
                    </div>

                    <div class="reviewAllCountWrap">
                        <div class="reviewAllCount" style="font-weight: bold;">
                            <button>전체 <span style="color:#01738b;">123456</span>건</button>
                        </div>
                        <div class="reviewSearchBtn">
                            <span><button>최신순</button></span>
                            <span><button>공감순</button></span>
                            <span><button>평점순</button></span>
                        </div>
                    </div>
                    <div class="userReviewInfoWrap">
                        <div class="userReviewInfo">
                            <img src="img/관리자-50.png">
                            <p class="user-id user-first">MOVIEISLAND</p>
                        </div>
                        <div class="reviewText reviewTextFirst">
                            <span class="reviewTextTit" style="color: #329eb1;">${mov.movieTitle }</span>
                            "재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요."
                            <br>
                            관람일 기준 7일 이내 등록 시 
                            <br>
                            <span>50P</span>
                            가 적립됩니다.
                            <br>
                            포인트는 관람평 최대 10편 지급가능합니다.
                            <br>
                        </div>
                        <div class="reviewContentWrite" style="font-size: 15px;">
                        <c:choose>
							<c:when test="${not empty sessionScope.m }">
	                            <a href="#" id="open" style="color: #666666;">관람평 쓰기</a>
							</c:when>
							<c:otherwise>
								<a href="/login.do" style="color: #666666;">관람평 쓰기</a>
							</c:otherwise>                        
                        </c:choose>
                        </div>
                    </div>
                    <!--본인이 로그인한 후 본인이 작성한 영화에 댓글이 나옴 -->
                    <div class="infoWap2Top">
                        <div class=" infoWrap2">
                            <div class="userReviewInfo2">
                                <img src="img/사용자-50.png">
                                <p class="user-id user-second">${sessionScope.m.memberId}</p>
                            </div>
                            <div class="Text2 textSecond">
                                <div class="Tit2">
                                    <p>관람평</p>
                                </div>
                                <div class=" Point2 pointSecond">
                                    <p>10</p>
                                </div>
                                <div class="PointCom PointComSecond">
                                    <p>연출 외</p>
                                    <p>+4</p>
                                </div>
                                <div class="reviewTextContent reviewTextSecond">
                                    <textarea style="width:595px; height: 84px; resize: none; border-style: none;">정말 재밌어요!!!!</textarea>
                                </div>
                                <div class="reviewTextLike">
                                    <img src="img/like-24.png">
                                    <div class="textLikeCount" style="font-size: 14px; position: absolute; right: 30px; bottom: 0px;">
                                        <p>0</p>
                                    </div>
                                </div>
                                <div class="reviewContentWrite2" style="font-size: 15px;">
                                    <a href="#" style="color: #666666;">수정</a>
                                    <a href="#" style="color: #666666;">삭제</a>
                                </div>
                            </div>
                        </div>
                        <div class="reviewDate">
                            <span>몇분전으로 나옴</span>
                        </div>
                    </div><!--본인작성댓글 끝-->
                        <!--타인이 작성한 댓글이 시작되는 자리 -->
                        <c:forEach items="${reviewList }" var="reviewList">
                              <div class="infoWap2Top" id="ajaxRev">
                                  <div class=" infoWrap2">
                                      <div class="userReviewInfo2">
                                        <img src="img/사용자-50.png">
                                        <p class="user-id user-third">${reviewList.memberId}</p>
                                    </div>
                                    <div class="Text2">
                                        <div class="Tit2 textThird">
                                            <p>관람평</p>
                                        </div>
                                        <div class=" Point2 pointThird">
                                            <p>${reviewList.movieScore}</p>
                                        </div>
                                        <div class="PointCom PointComThird">
                                            <p>연출 외</p>
                                            <p>+4</p>
                                        </div>
                                        <div class="reviewTextContent reviewTextContentThird">
                                            <textarea style="width:595px; height: 84px; resize: none; border-style: none;">${reviewList.reviewContent}</textarea>
                                        </div>
                                        <div class="reviewTextLike">
                                            <img src="img/like-24.png">
                                            <div class="textLikeCount" style="font-size: 14px; position: absolute; right: 30px; bottom: 0px;">
                                                <p>0</p>
                                            </div>
                                        </div>
                                        <div class="reviewContentWrite2" style="font-size: 15px;">
                                            <a href="#" style="color: #666666;">수정</a>
                                            <a href="#" style="color: #666666;">삭제</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="reviewDate reviewDateThird">
                                    <span>몇분전으로 나옴</span>
                                </div>
                            </div><!--타인이 작성한 댓글 끝나는 자리-->
                            </c:forEach>
                        </div><!--실관람평 내용 끝나는 자리-->
                        <div class="moviePostWrap tabcontent" style="display: none;"><!--무비포스트 시작하는 자리-->
                            <div class="moviePostHead reaviewHeadSawBtnWrap">
                                <div class="reviewHead">
                                    <h2><span style="color:#01738b;">123456</span>건의 무비포스트가 있어요.</h2>
                                </div>
                                <div class="morePostMovie sawMovie">
                                    <button type="button" class="sawMovieBtn morePostMovie">더보기</button>
                                </div>
                            </div>
                            <div class="userReviewInfoWrap moviePostWriteWrap">
                                <div class="reviewText moviePostText">
                                    <p>
                                    <span class="useNameMoviePost">홍길동님</span>
                                    <span class="reviewTextTit">"영화이름"</span>
                                    재미있게 보셨나요? <span class="useNameMoviePost">홍길동</span>님만의 무비포스트를 남겨보세요.
                                    </p>
                                </div>
                                <div class="reviewContentWrite moviePosttWrite " style="font-size: 15px;">
                                    <a href="/moviePostFrm.do?movieNo=${mov.movieNo}" id="open" style="color: #666666;">무비포스트 쓰기</a>
                                </div>
                            </div>
                            <div class="moviePostTotalCnt reviewAllCountWrap">
                                <div class="moviePostTotalCnt reviewAllCount" style="font-weight: bold;">
                                    <button>전체 <span style="color:#01738b;">123456</span>건</button>
                                </div>
                            </div>
                            <div class="moviePostContentList">
                                <div class="moviePostImg"><!--영화 한개 시작-->
                                    <img src="img/리바운드.jpg">
                                    <div class="moviePostImgContent">
                                        <a href="#"><p>userId조회</p></a><!--클릭시 해당 유저의 무비포스트 리스트 목록 조회-->
                                        <a href="#"><!--클릭시 무비포스트 상세보기-->
                                            <p class="moviePostImgMovieTit">제목</p>
                                            <p class="moviePostImgMovieCont">내용출내용출력내용출력내용출력내용출력내용출력내용출력력내용출력내용출력내용출력내용출력내용출력내용출력</p>
                                            <p class="moviePostImgTime">몇분전</p>
                                        </a>
                                    </div>
                                </div><!--영화 한개 끝-->
                                <div class="postMoreBtnWrap">
                                    <button class="postMoreBtn" id="load">더보기</button>
                                </div>
                            </div>     
                        </div><!--무비포스트 끝나는 자리-->
                        <div class="previewWrap tabcontent" style="display: none;"><!--preview예고편 시작-->
                            <div class="previewTop">
                                <span>예고편(?)</span>
                                <span> 스틸컷(?)</span>
                            </div>
                            <div class="previewContentWrap">
                                <div class="previewContentTit">
                                    <h2 style="font-size: 18px;">런칭 예고편</h2>
                                </div>
                                <div class="previewPlayer">
                                    <!--<c:forEach items="${mvList }" var="mv">
                                        <video width="300px" height="136px" src="${mv.videoLink }" controls>
                            
                                        </video>
			                        </c:forEach>-->
                               </div>
                               <!--
                               <div class="previewPlayerLine">
                                    <c:forEach items="${mvList }" var="mv">
                                        <video width="240px" height="136px" src="${mv.videoLink }" controls>
                            
                                        </video>
			                        </c:forEach>
                                </div>
                                -->
                                <!--
                                    <div id="carouselExampleControls" class="previewPlayerLine carousel slide" data-bs-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                              <img src="cat.png" class="d-block w-100" alt="...">
                                            </div>
                                            <div class="carousel-item">
                                              <img src="dog.png" class="d-block w-100" alt="...">
                                            </div>
                                            <div class="carousel-item">
                                              <img src="bird.png" class="d-block w-100" alt="...">
                                            </div>
                                          </div>
                                          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                          </button>
                                          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                          </button>
                                      </div>
                                -->
                            </div>
                        </div><!--preview예고편 끝-->    
                    </div>
                </div>
            </div>
            <div class="wpSum" style="display:none;">
            	<input type="text" class="wpSumStory" value="${watchPointSum.story}">
            	<input type="text" class="wpSumOST" value="${watchPointSum.ost}"> 
            	<input type="text" class="wpSumActor" value="${watchPointSum.actor}">
            	<input type="text" class="wpSumVideoVisual" value="${watchPointSum.videoVisual}">
            	<input type="text" class="wpSumProduction" value="${watchPointSum.production}">               
            </div>
           

    <script>
        var ctx = document.getElementById('myChart').getContext('2d');
        var story = $(".wpSumStory").val();
        var ost = $(".wpSumOST").val();
        var actor = $(".wpSumActor").val();
        var videoVisual = $(".wpSumVideoVisual").val();
        var production = $(".wpSumProduction").val();
        var myChart = new Chart(ctx, {
            type: 'radar',
            data: {
                labels: ['영상미', '스토리', '배우', 'OST', '연출'],
                datasets: [{
                    label: '영상미,스토리,배우,OST,연출',
                    data: [videoVisual, story, actor, ost, production],
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
/*===========================================================================================================================================*/
/*===============모달OPEN=================*/
const openButton=document.getElementById("open");
   const modal = document.querySelector(".modal");

   /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
   const overlay = modal.querySelector(".modal_overlay");
   const closeBtn = modal.querySelector("#close1");
   const openModal  =() => {
       modal.classList.remove("hidden");
   }

   const closeModal = () => {
       modal.classList.add("hidden");
   }
   overlay.addEventListener("click",closeModal);
   closeBtn.addEventListener("click",closeModal);
   openButton.addEventListener("click",openModal);
   

	
	
	
	</script>
    <script src = "/resources/js/movieDetail.js"></script>
</body>
</html>
<%@include file="/WEB-INF/views/common/footer.jsp" %>