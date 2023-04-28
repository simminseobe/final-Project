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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
.modal2 {
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

.modal_overlay2 {
	/*모달 전체 배경색 설정*/
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: absolute;
   z-index: 6;
    
}

.modal_content2 {
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

.hidden2 {
	display: none;
}

.modal3 {
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

.modal_overlay3 {
	/*모달 전체 배경색 설정*/
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: absolute;
    z-index: 6;
 
}

.modal_content3 {
    z-index: 7;
	background-color: white;
	padding: 10px 10px;
	text-align: center;
	position: relative;
	top: 0px;
	width: 850px;
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
    overflow: auto;
    height: 850px;

       
}




.hidden3 {
	display: none;
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
                    <button type="button" id="close1" style="margin-right: 5px;">닫기</button>
                    <button type="submit" name=reviewEnroll id="reviewEnroll" class="enrollBtn" style="margin-right: 5px;">등록</button>
                </div>
                </form>
            </div><!--모달 댓글 내부화면 끝-->
        </div><!--class="modal hidden 모달끝-->
        
        <!--======================-모달2 관람평 수정하기================================-->
        <div class="modal2 hidden2"><!--모달로 댓글 작성 들어가는 자리-->
            <div class="modal_overlay2"></div>
            <div class="modal_content2"><!--모달 댓글 내부화면-->
                 <c:forEach  items="${reviewList }" var="review">
                    <c:choose>
                    <c:when  test="${not empty sessionScope.m && sessionScope.m.memberId eq review.memberId}">
                <form name="watchPoint2" action="/watchPointUpdate.do" method="post">
                <input type="text" name="movieNo" id="movieNo2" value="${mov.movieNo }" style="display:none;">
                <input type="text" name="memberId" value="${sessionScope.m.memberId}" style="display:none;">
            	<input type="text" name="reviewCommentNo" value="${review.reviewCommentNo}" style="display:none;">
            	<input type="text" name="reviewDate" value="${review.reviewDate}" style="display:none;">
                <input type="text" name="watchPoint" value="${review.watchPointNo}" style="display:none;">
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
                    <div class="modalStar-result modalStar-result2">
                        <input type="text" name="movieScore" id="star-result3" value="${review.movieScore}" style="display: none;">
                        <span id ="star-result4" style="color:#6543b1">${review.movieScore}</span>
                        <span style="color:#6543b1">점</span>
                    </div>
                </div>
                <div class="modalTxtArea">
                    <textarea name="reviewContent">${review.reviewContent}</textarea>
                </div>
                <div class="modal_content_tit" style="margin-top: 50px;">
                    <p>관람포인트는 무엇인가요?</p>
                    <p style="font-size: 18px; margin-top: 5px;">(최대 5개 선택가능)</p>
                </div>
                <div class="modalWatchPointChk">
                    <div class="productionDiv">
        	                <p><label for = "production">연출</label></p>
            	            <input type = "checkbox" name="production" id ="production2" value="1">
                    </div>
                    <div class="storyDiv">
	                        <p><label for = "story">스토리</label></p>
    	                    <input type = "checkbox" name="story" id = "story2" value="1">
                    </div>
                    <div class="visualDiv">
                        <p><label for = "videoVisual">영상미</label></p>
                        <input type = "checkbox" name="videoVisual" id ="videoVisual2" value="1">
                    </div>
                    <div class="actorDiv">
                        <p><label for = "actor">배우</label></p>
                        <input type = "checkbox" name="actor" id="actor2" value="1">
                    </div>
                    <div class="OSTDiv">
                        <p><label for = "ost">OST</label></p>
                        <input type = "checkbox" name="ost" id ="ost2" value="${review.ost}">
                    </div>
                </div>
                <div class="modalContentBottom">
                    <button type="button" id="close2"  style="margin-right: 5px;">닫기</button>
                    <button type="submit" name="reviewUpdateBtn" id="reviewUpdateBtn" class="updateBtn" style="margin-right: 5px;">수정</button>
                </div>
                </form>
                </c:when>
                </c:choose>
                </c:forEach>
            </div><!--모달 댓글 내부화면 끝-->
        </div><!--class="modal hidden 모달끝-->
        <!--==============================모달2 관람평 수정끝================================================-->        

	<!-- =================================모달3 무비포스트 상세보기============================================= -->
	<div class="modal3 hidden3"><!--모달로  무비포스트 상세보기  들어가는 자리-->
            <div class="modal_overlay3"></div>
            <div class="modal_content3"><!--모달 댓글 내부화면-->
           
            	<!--  <input type="text" class="dataImgCheck">
                <input type="text" class="dataVideoCheck">  -->
                <input type="text" class="modalPostNo" name="moviePostNo" style="display:none;">  
                <div class="modalClose">
                    <div class="modalCloseTit">
                        <span>무비포스트 상세보기</span>                    
                    </div>
                </div>
                <div class="modal_content_tit modal_content_tit3">
                    <p>${mov.movieTitle }</p>
                    <input type="text" class="modalMovieTitle" name="movieTitle" value="${mov.movieTitle}" style="display:none;">
                    <button type="button">예매하기</button>
                </div>
                <div class="post-detail-top">
                	<div class="detail-top-r">
                		<div class="detail-top-r-img">
                			<img src="/resources/images/member/nonImg.png">
                		</div>
                		<div class="post-info">
                            <div class="post-info-first-input">
                			    <input type="text" class="detailmemberId" name="memberId" style="border:none;" readonly>
                			</div>
                            <div class="post-info-first-input">
                                <input type="text" class="postDate" style="border:none;" readonly>
                            </div>
                		</div>
                        <div class="subscribe">
		              		  <button type="button" class="subscribeBtn">구독하기</button>
		              		  <button type="button" class="postUpdateBtn" style="display:none;"><a class="postUpdateAtag">수정하기</a></button>
		              		  <button type="button" class="postDeleteBtn" style="display:none;"><a class="postDeleteAtag">삭제하기</a></button>
                        </div>
                	</div>
                </div>
                
                <!-- 이미지1개만 있을때 -->
                <div class="post-detail-center">
                    <div class="detail-center-img-area">
                        <img class="post-detail-center-img">
                        <div class="post-detail-content">
                            <textarea class="postDetailTextInput" name="moviePostContent" readonly></textarea>
                        </div>
                        <div class="post-detail-like">
                            <img src="img/like-24.png" class="whiteLike2">
                            <img src="img/likeBlack-24.png" class="blackLike2" style="display:none;">
                            <span>0</span>
                        </div>
                    </div>
                </div>
                
                <!-- 비디오1개만 나왔을때 -->
                <div class="post-detail-center">
                    <div class="detail-center-img-area center-video-area">
                        <video class="previewCutVideo" width="420px" height="320px" controls>
                            <source class="previewCutVideoSource">
                        </video>
                        <div class="post-detail-content">
                            <textarea class="postDetailTextInput" name="moviePostContent" readonly></textarea>
                        </div>
                        <div class="post-detail-like">
                            <img src="img/like-24.png" class="whiteLike2">
                            <img src="img/likeBlack-24.png" class="blackLike2" style="display:none;">
                            <span>0</span>
                        </div>
                    </div>
                </div>
                
                <!-- 이미지와 비디오 같이 있을때 -->
                <div class="post-detail-center">
                    <div class="detail-center-img-area center-video-area">
                        <video class="previewCutVideo" width="420px" height="320px" controls>
                            <source class="previewCutVideoSource">
                        </video>
                    </div>
                    <div class="detail-center-img-area">
                        <img class="post-detail-center-img" src="/resources/images/member/nonImg.png">
                        <div class="post-detail-content">
                            <textarea class="postDetailTextInput" name="moviePostContent" readonly></textarea>
                        </div>
                        <div class="post-detail-like">
                            <img src="img/like-24.png" class="whiteLike2">
                            <img src="img/likeBlack-24.png" class="blackLike2" style="display:none;">
                            <span>0</span>
                        </div>
                    </div>
                </div>
            
                <!-- 무비포스트 댓글작성 하는곳-->
               
                <div class="modalTxtArea post-detail-txt" style="background-color: #ecf0f4;">
                	<input value="${sessionScope.m.memberId}" class="loginId" name="memberId" style="display:none;">
                    <textarea class="postComment" name="moviePostComment"  style="width:810px;"></textarea>
                    <button type="button"class="postReviewBtn postCommentBtn">댓글등록</button>
                </div>
            	
                <div class="post-comment-list"></div>
                <!--무비포스트 댓글리스트 출력하는 곳-->
                <!--
                <div class="post-comment-list">
                    <div class="detail-top-r comment-list-img">
                		<div class="detail-top-r-img comment-list-r-img">
                			<img class="r-img-src comment-list-r-img-src" src="/resources/images/member/nonImg.png">
                		</div>
                		<div class="post-info">
                            <div class="post-info-first-input commentWriter">
                			  <p>댓글 작성자</p>
                			</div>
                            <div class="post-info-first-input commentDate">
                                <p>댓글 작성 날짜</p>
                            </div>
                		</div>
                        <div class="postCommentArea">
                            <textarea>재밌어요</textarea>
                        </div>
                        <div class="btnWrap">8
                            <div class="updateBtn">9
                                <button>수정</button>
                            </div>
                            <div class="deleteBtn">10
                                <button>삭제</button>
                            </div>
                        </div>
                	</div>
                </div>
                -->
                   
                <div class="modalContentBottom">
                    <button type="button" id="close3"  style="margin-right: 5px;">닫기</button>
                </div>
            </div><!--모달 댓글 내부화면 끝-->
        </div><!--class="modal hidden 무비포스트 상세보기 모달끝 -->



        
        <div class="bg-img" style="background-image:url('/resources/upload/movie/${mov.mainFile.movieFileName}'); background-repeat: no-repeat; background-size:75%; background-position: center; background-position-y: 10%;"></div>
        <div class="bg-pattern"></div>
        <div class="bg-mask">
            <div class="movie-detail-top-content" style="position: relative;">
                <p class="d-day" style="float: left;">${mov.movieDate}</p>
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
                        <div class="col"style="position: absolute; top: 0px; width: 366.33px; height:380px; display:inline-block; float:left;">
                            <div class="pointTxt" style="padding-top: 50px; font-size: 18px; line-height: 18px;">
                                <h2>관람포인트</h2>
                            </div>
                            <div class="chart" style="text-align: center;">
                                <canvas id="myChart" width="216" height="216" style="margin:0 auto;"></canvas>
                            </div>
                        </div>
                        <div class="col" style="position: absolute; top: 0px; left:366px; width: 366.33px; height:380px;">
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
                        <div class="col" style="position: absolute; top: 0px; right: 0;  width: 366px; height:380px;">
                            <div class="pointTxt" style="padding-top: 50px; font-size: 18px; line-height: 18px;">
                                <h2>누적관객수</h2>
                            </div>
                             <div class="chart" style="text-align: center;">
                                <canvas id="myChart2" width="216" height="216" style="margin:0 auto;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!--========주요정보 끝나는 자리==================================================-->
                <div class="reviewAllWrap tabcontent" style="display: none;"><!--실관람평 시작 자리-->
                    <div class="reaviewHeadSawBtnWrap">
                        <div class="reviewHead">
                            <h2>${mov.movieTitle }에 대한<span style="color:#01738b;"> ${reviewListCount}</span>개의 이야기가 있어요.</h2>
                        </div>
                        <div class="sawMovie">
                            <button type="button" class="sawMovieBtn">본 영화 등록</button>
                        </div>
                    </div>

                    <div class="reviewAllCountWrap">
                        <div class="reviewAllCount" style="font-weight: bold;">
                            <button>전체 <span color:#01738b;"> ${reviewListCount}</span>건</button>
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
                            <span>50P</span>
                           	 가 적립됩니다.
                            <br>
                           	 포인트는 관람평 최대 10편 지급가능합니다.
                        </div>
                        <div class="reviewContentWrite" style="font-size: 15px;">
							<c:if test="${not empty sessionScope.m}">
	                            <a href="#" id="open" style="color: #666666;">관람평 쓰기</a>
							</c:if>
							<c:if test="${empty sessionScope.m}">
								 <a href="login.do" class="open" style="color: #666666;">로그인</a>
							</c:if>
                        </div>
                    </div>
                    
                    <!--본인이 로그인한 후 본인이 작성한 영화에 댓글이 나옴 -->
                    <c:forEach  items="${reviewList }" var="review">
                    <c:choose>
                    <c:when  test="${not empty sessionScope.m && sessionScope.m.memberId eq review.memberId}">
                    <div class="infoWap2Top">
                        <div class=" infoWrap2">
                            <div class="userReviewInfo2">
                                <img src="/resources/images/member/nonImg.png">
                                <p class="user-id user-second">${review.memberId}</p>
                            </div>
                            <div class="Text2 textSecond">
                                <div class="Tit2">
                                    <p>관람평</p>
                                </div>
                                <div class=" Point2 pointSecond">
                                    <p>${review.movieScore}</p>
                                </div>
                                <div class="PointCom PointComSecond" style="font-size:16px;">
                                	<c:choose>
                                		<c:when test="${review.story eq 1}">
                                    	<p>스토리</p>
                                		</c:when>
                                		<c:when test="${review.actor eq 1}">
                                    	<p>배우</p>
                                		</c:when>
                                		<c:when test="${review.ost eq 1}">
                                    	<p>OST</p>
                                		</c:when>
                                		<c:when test="${review.videoVisual eq 1}">
                                    	<p>영상미</p>
                                		</c:when>
                                		<c:when test="${review.production eq 1}">
                                    	<p>연출</p>
                                		</c:when>
                                		<c:otherwise>
                                			<p>관람포인트</p>
                                		</c:otherwise>
                                	</c:choose>
 									<c:choose>
 										<c:when test="${review.story+review.actor+review.ost+review.videoVisual+review.production gt 0}">
                                    	<p>+ ${review.story+review.actor+review.ost+review.videoVisual+review.production-1}</p>
 										</c:when>
 										<c:otherwise>
 										<p>+ ${review.story+review.actor+review.ost+review.videoVisual+review.production}</p>
 										</c:otherwise>
 									</c:choose>                             
                                
                                </div>
                                <div class="reviewTextContent reviewTextSecond">
                                    <textarea style="width:595px; height: 84px; padding: 5px; resize: none; border-color: #f8fafa; box-sizing: border-box;" readonly>${review.reviewContent}</textarea>
                                </div>
                                <div class="reviewTextLike reviewTextLikeSelf">
                                    <img src="img/like-24.png" class="whiteLike2">
                                    <img src="img/likeBlack-24.png" class="blackLike2" style="display:none;">
                                    <div class="textLikeCount" style="font-size: 14px; position: absolute; right: 30px; bottom: 0px; top:20px;">
                                        <p>0</p>
                                    </div>
                                </div>
                                <div class="reviewContentWrite2" style="font-size: 15px;">
                                    <a href="#" id="open2" style="color: #666666;">수정</a>
                                    <a href="/deleteReview.do?reviewCommentNo=${review.reviewCommentNo }&movieNo=${review.movieNo}" style="color: #666666;">삭제</a>
                                </div>
                            </div>
                        </div>
                        <div class="reviewDate">
                            <span>${review.reviewDate}</span>
                        </div>
                    </div>
                    </c:when>
                    </c:choose>
			        </c:forEach><!--본인작성댓글 끝-->
			        
                    <!--타인이 작성한 댓글이 시작되는 자리 -->
                    <c:forEach items="${pageList }" var="review">
                     <c:choose>
                     <c:when test="${sessionScope.m.memberId ne review.memberId}">
                            <div class="infoWap2Top" id="ajaxRev">
                                <div class=" infoWrap2">
                                    <div class="userReviewInfo2">
                                    <img src="/resources/images/member/nonImg.png">
                                    <p class="user-id user-third"> ${review.memberId}</p>
                                </div>
                                <div class="Text2">
                                    <div class="Tit2 textThird">
                                        <p>관람평</p>
                                    </div>
                                    <div class=" Point2 pointThird">
                                        <p>${review.movieScore}</p>
                                    </div>
                                    <div class="PointCom PointComThird" style="font-size:16px;">
                                        <c:choose>
                                		<c:when test="${review.story eq 1}">
                                    	<p>스토리 </p>
                                		</c:when>
                                		<c:when test="${review.actor eq 1}">
                                    	<p>배우</p>
                                		</c:when>
                                		<c:when test="${review.ost eq 1}">
                                    	<p>OST </p>
                                		</c:when>
                                		<c:when test="${review.videoVisual eq 1}">
                                    	<p>영상미 </p>
                                		</c:when>
                                		<c:when test="${review.production eq 1}">
                                    	<p>연출</p>
                                		</c:when>
                                		<c:otherwise>
                                			<p>관람포인트</p>
                                		</c:otherwise>
                                	</c:choose>
 									<c:choose>
 										<c:when test="${review.story+review.actor+review.ost+review.videoVisual+review.production gt 0}">
                                    	<p>+ ${review.story+review.actor+review.ost+review.videoVisual+review.production-1}</p>
 										</c:when>
 										<c:otherwise>
 										<p>+ ${review.story+review.actor+review.ost+review.videoVisual+review.production}</p>
 										</c:otherwise>
 									</c:choose>                             
                                    </div>
                                    <div class="reviewTextContent reviewTextContentThird">
                                        <textarea style="width:595px; height: 84px; padding: 5px; resize: none; border-color: #f8fafa;" readonly>${review.reviewContent}</textarea>
                                    </div>
                                    <div class="reviewTextLike reviewTextLikeOther">
                                        <img src="img/like-24.png" class="whiteLike2">
                                        <img src="img/likeBlack-24.png" class="blackLike2" style="display:none;">
                                        <div class="textLikeCount" style="font-size: 14px; position: absolute; right: 30px;  bottom: 0px; top: 20px;">
                                            <span>0</span>
                                            
                                            <input type="text" name="reviewLikeMember" value="${review.memberId}" style="display: none;">
                                            <input type="text" name="reviewLikeReviewCommentNo" value="${review.reviewCommentNo }"style="display: none;">
                                        </div>
                                    </div>
                                    <div class="reviewContentWrite2" style="font-size: 15px;">
                                       <a href="#" style="color: #666666;">신고하기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="reviewDate reviewDateThird">
                                <span>${review.reviewDate}</span>
                            </div>
                        </div><!--타인이 작성한 댓글 끝나는 자리-->
                        </c:when>
                         </c:choose>
                    </c:forEach>
	                    <div class="pageDiv" style="margin:0 auto;">
	                    	${pageNavi}
	                    </div>
                </div><!--실관람평 내용 끝나는 자리-->

                <div class="moviePostWrap tabcontent" style="display: none;"><!--무비포스트 시작하는 자리-->
                    <div class="moviePostHead reaviewHeadSawBtnWrap">
                        <div class="reviewHead">
                            <h2><span style="color:#01738b;">${moviePostCount}</span>건의 무비포스트가 있어요.</h2>
                        </div>
                        <div class="morePostMovie sawMovie">
                            <button type="button" class="sawMovieBtn morePostMovie"><a href="/postAllList.do">더보기</a></button>
                        </div>
                    </div>
                    <div class="userReviewInfoWrap moviePostWriteWrap">
                        <div class="reviewText moviePostText">
                        	<c:choose>
                        		<c:when test="${not empty sessionScope.m && sessionScope.m.memberId}">
		                            <p>
				                    <span class="useNameMoviePost">${sessionScope.m.memberName }</span>
		                            <span class="reviewTextTit">"${mov.movieTitle}"</span>
		                            	재미있게 보셨나요? <span class="useNameMoviePost">${sessionScope.m.memberName }</span>님의 무비포스트를 남겨보세요.
		                            </p>
                        		</c:when>
                        		<c:otherwise>
                        			<p>
		                            <span class="reviewTextTit">"${mov.movieTitle}"</span>
		                            	재미있게 보셨나요? <span>무비포스트를 남겨보세요.</span>
		                            </p>
                        		
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        <div class="reviewContentWrite moviePosttWrite " style="font-size: 15px;">
                        	<c:choose>
	                            <c:when  test="${not empty sessionScope.m}">
		                            <a href="/moviePostFrm.do?movieNo=${mov.movieNo}" style="color: #666666;">무비포스트 쓰기</a>
	                            </c:when>
	                            
								<c:otherwise>
									<a href="/login.do" style="color: #666666;">로그인 하기</a>
								</c:otherwise>    
                        	</c:choose>
                        </div>
                    </div>
                    <div class="moviePostTotalCnt reviewAllCountWrap">
                        <div class="moviePostTotalCnt reviewAllCount" style="font-weight: bold;">
                            <button>전체 <span style="color:#01738b;">${moviePostCount}</span>건</button>
                        </div>
                    </div>
                    <div class="moviePostContentList">
                    <c:forEach items="${oneMoviepostAll}" var="oneMoivePost">
                        <div class="moviePostImg"><!--영화 한개 시작-->
                        	<c:choose>
                        	<c:when test="${oneMoivePost.movieFilePath ne null && oneMoivePost.videoLink eq null}">
	                            <img src="/resources/upload/movie/${oneMoivePost.movieFilePath}">
                        	</c:when>
                            <c:when test="${oneMoivePost.movieFilePath ne null && oneMoivePost.videoLink ne null}">
	                            <img src="/resources/upload/movie/${oneMoivePost.movieFilePath}">
                        	</c:when>
                        	<c:when test="${oneMoivePost.movieFilePath eq null && oneMoivePost.videoLink ne null}">
                        		<img src="/resources/upload/movie/${mov.mainFile.movieFileName}">
                            </c:when>
                            </c:choose>
                            
                            <div class="moviePostImgContent">
                                <a href="#"><p>${oneMoivePost.memberId }</p></a><!--클릭시 해당 유저의 무비포스트 리스트 목록 조회-->
                                <a href="#" class="open3"><!--클릭시 무비포스트 상세보기 -->
	                                <input type="text" name="movieNo" value="${oneMoivePost.movieNo }" style="display:none;">
	                                <input type="text" name="moviePostNo" value="${oneMoivePost.moviePostNo}" style="display:none;">
                                    <input type="text" name="movieFilePath" value="${oneMoivePost.movieFilePath }" style="display:none;">
	                                <input type="text" name="videoLink" value="${oneMoivePost.videoLink}" style="display:none;">
                                   
                                    <p class="moviePostImgMovieTit">${oneMoivePost.movieTitle }</p>
                                    <p class="moviePostImgMovieCont"><p>${oneMoivePost.moviePostContent}</p>
                                    <p class="moviePostImgTime" ><p>${oneMoivePost.moviePostDate}</p>
                                </a>
                            </div>
                        </div><!--영화 한개 끝-->                           
                    </c:forEach>
                        <div class="postMoreBtnWrap">
                            <button class="postMoreBtn" id="load">더보기</button>
                        </div>
                    </div>       
                </div><!--무비포스트 끝나는 자리-->
                <div class="previewWrap tabcontent" ><!--preview예고편 시작-->
                    <div class="previewTop">
                        <span>예고편(?)</span>
                        <span> 스틸컷(?)</span>
                    </div>
                    <div class="previewContentWrap">
                        <div class="previewContentTit">
                            <h2 style="font-size: 18px;">런칭 예고편</h2>
                        </div>  
                        <div style="display:flex; justify-content: center;">
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <c:forEach items="${mvList }" var="mv" varStatus="status">                                     
                                        <c:choose>
                                            <c:when test="${status.index eq 1}">
                                                <div class="carousel-item active">
                                                    <video width="840px" height="600px" class="d-block" src="${mv.videoLink }" controls>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="carousel-item">
                                                    <video width="840px" height="600px" class="d-block" src="${mv.videoLink }" controls>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>      
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true" ></span>
                                <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                            </div>

                            <div class="videoList">
                                <c:forEach items="${mvList }" var="mv" varStatus="status"> 
                                    <video width="240px" height="136px" src="${mv.videoLink }" controls>
                                        
                                    </video>
                                </c:forEach>
                            </div>
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
<div class="session"  style="display:none;">
	<input type="text" class="sessionId" value="${sessionScope.m.memberId}">
</div>
       

<script>
	//누적관객수 차트
	
	
	
	
	var ctx = document.getElementById('myChart2').getContext('2d');
	var chart = new Chart(ctx, {
    // 만들기 원하는 차트의 유형
    type: 'line',

    // 데이터 집합을 위한 데이터
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
            label: '월별 누적관객수 단위(만)',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [0, 10, 5, 2, 20, 30, 45]
        }]
    },

    // 설정은 여기서 하세요
    options: {}
});
	
	
	//관람포인트 차트
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

/*===============모달OPEN=================*/
   const openButton=document.getElementById("open");
   const modal = document.querySelector(".modal"); 
	
   /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
   const overlay = modal.querySelector(".modal_overlay");
   const closeBtn = modal.querySelector("#close1");
   const openModal  =() => {
       modal.classList.remove("hidden");
   }

   console.log(openButton);
   const closeModal = () => {
       modal.classList.add("hidden");
   }
   overlay.addEventListener("click",closeModal);
   closeBtn.addEventListener("click",closeModal);
   if(openButton){
	   
   openButton.addEventListener("click",openModal);
   }
   
 	
   /*===============모달OPEN2=================*/
   
   const openButton2=document.getElementById("open2");
   const modal2 = document.querySelector(".modal2"); 

   /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
   const overlay2 = modal2.querySelector(".modal_overlay2");
   const closeBtn2 = modal2.querySelector("#close2");
   const openModal2  =() => {
       modal2.classList.remove("hidden2");
   }

   const closeModal2 = () => {
       modal2.classList.add("hidden2");
   }
   overlay2.addEventListener("click",closeModal2);
   if(closeBtn2){
   closeBtn2.addEventListener("click",closeModal2);
	   
   }
   if(openButton2){
    openButton2.addEventListener("click",openModal2);
	   
   }
	
   /*========모달 open3 무비포스트 상세보기=================*/
   const modal3 = document.querySelector(".modal3");

   $(".open3").on("click",function(){
	   const movieNo = $(this).children().eq(0).val();
	   const moviePostNo=$(this).children().eq(1).val();
	   const postComment=$(".postComment").val("");

	   console.log(moviePostNo);
	   
	   //멤버 아이디와 무비포스트 날짜를 받기 위함
	   const detailmemberId=$(".detailmemberId");
	   const postDate=$(".postDate");
	   
	   //무비포스트 텍스트 내용을  input으로 받기 위함
	   const postDetailTextInput=$(".postDetailTextInput");
	   
	   //이미지를 받기 위함
	   const postDetailCenterImg=$(".post-detail-center-img");
	   
	   //비디오를 받기위함
	   const previewCutVideoSource=$(".previewCutVideoSource");
	   
	   //이미지가 있는지 비디오가 있는지 값 체크를 위해 선언
	   const dataImgCheck=$(".dataImgCheck");
	   const dataVideoCheck=$(".dataVideoCheck");
	   
	   const modalMoviePostNo=$(".modalPostNo");
	   
	   const sessionId=$(".sessionId").val();
	   
	
		$.ajax({
			  url :"/moviePostDetail.do",
			  type : "post",
			  data : {moviePostNo:moviePostNo},
			  success : function(data){
					  if(data != null && data.videoLink!=undefined && data.movieFilePath!=undefined){
						  $(".post-detail-center").eq(0).css("display","none");
						  $(".post-detail-center").eq(1).css("display","none");
						  $(".post-detail-center").eq(2).css("display","block");
						  
						  modalMoviePostNo.val(moviePostNo);
						  
						  dataVideoCheck.val(data.videoLink);
						  dataImgCheck.val(data.movieFilePath);
						  const detailMemberIdVal=detailmemberId.val(data.memberId);
						  const postDateVal=postDate.val(data.moviePostDate);
						  postDetailTextInput.val(data.moviePostContent);
						  
						  postDetailCenterImg.attr("src","/resources/upload/movie/"+data.movieFilePath);
						  
						  previewCutVideoSource.attr("src",data.videoLink);
						  const video = document.querySelectorAll(".previewCutVideo");
						  video[1].load();//비디오 재생이 안될때 video.load()를 한번 해줘야함 

						  
				  	}else if(data != null && data.videoLink != undefined && data.movieFilePath == undefined){
					  	  $(".post-detail-center").eq(0).css("display","none");
						  $(".post-detail-center").eq(1).css("display","block");
						  $(".post-detail-center").eq(2).css("display","none");
						  
						  modalMoviePostNo.val(moviePostNo);
						  
						  dataVideoCheck.val(data.videoLink);
						  const detailMemberIdVal=detailmemberId.val(data.memberId);
						  const postDateVal=postDate.val(data.moviePostDate);
						  postDetailTextInput.val(data.moviePostContent);
						  previewCutVideoSource.attr("src",data.videoLink);
						  const video = document.querySelectorAll(".previewCutVideo");
						  video[0].load();//비디오 재생이 안될때 video.load()를 한번 해줘야함 

						  
					}else if(data != null && data.videoLink == undefined && data.movieFilePath != undefined){
					  	  $(".post-detail-center").eq(0).css("display","block");
						  $(".post-detail-center").eq(1).css("display","none");
						  $(".post-detail-center").eq(2).css("display","none");
						  
						  modalMoviePostNo.val(moviePostNo);
						  
						  dataImgCheck.val(data.movieFilePath);
						  const detailMemberIdVal=detailmemberId.val(data.memberId);
						  const postDateVal=postDate.val(data.moviePostDate);
						  postDetailTextInput.val(data.moviePostContent);
						  postDetailCenterImg.attr("src","/resources/upload/movie/"+data.movieFilePath);
					}
					 
					  	$(".post-comment-list").empty();
						for(let i = 0; i<data.moviePostComment.length;i++){
						  
						  const div1 = $(".post-comment-list");
						  
					
						  const div2 = $("<div>").addClass("detail-top-r").addClass("comment-list-img");
						  const div3 = $("<div>").addClass("detail-top-r-img").addClass("comment-list-r-img");
						  
						  const img1=$("<img>").addClass("r-img-src").addClass("comment-list-r-img-src");
						  img1.attr("src","/resources/images/member/nonImg.png");
						  
						  const div4=$("<div>");
						  const div5=$("<div>");
						  
						  div4.addClass("post-info");
						  div5.addClass("post-info-first-input").addClass("commentWriter");
						  
						  const postCommentMemberId=data.moviePostComment[i].memberId;
						  const p1=$("<p>");
						  p1.text(postCommentMemberId);
						  
						  const div6=$("<div>");
						  const p2=$("<p>");
						  //작성날짜 값 받아오기
						  const moviePostCommentDate=data.moviePostComment[i].moviePostCommentDate;
						  p2.text(moviePostCommentDate);
						  
						  const div7=$("<div>");
						  div7.addClass("postCommentArea");
						  const textarea=$("<textarea>");
						  textarea.attr("name","postComment").attr("readonly",true);
						  const postComment=data.moviePostComment[i].postComment;	
						  textarea.val(postComment);
						  div7.append(textarea);
						  
						  const updateBtn=$("<button>");
						  updateBtn.addClass("updateBtn");
						  updateBtn.text("수정");
						  updateBtn.attr("onclick","updatePostComment(this,"+data.moviePostComment[i].moviePostCommentNo+");");
						  const div9=$("<div>");
						  div9.addClass("updateBtn");
						  div9.append(updateBtn);
						  const div8=$("<div>");
						  div8.addClass("btnWrap");
						  div8.append(div9);
						  
						  div8.css("display","none");//수정버튼 숨김
						 						  
						  const div10 =$("<div>");
						  div10.addClass("deleteBtn");
						  const deleteBtn=$("<button>");
						  deleteBtn.attr("onclick","deletePostComment(this,"+data.moviePostComment[i].moviePostCommentNo+");");
						  deleteBtn.text("삭제");
						  deleteBtn.append(div10);
						  div8.append(div10); 
						  div10.append(deleteBtn);
						  
						  div10.css("display","none");//삭제버튼 숨김
						  
						  
						  div1.append(div2);
						  div2.append(div3);
						  div3.append(img1);
						  div2.append(div4);
						  div4.append(div5);
						  div5.append(p1);
						  div4.append(div6);
						  div6.append(p2);
						  div2.append(div7);
						  div2.append(div8);
						  		  
						 
						   if(sessionId==postCommentMemberId){
							   	 /* const btnWrap=$(".btnWrap");
							     const deleteBtn=$(".deleteBtn"); */
							     div8.css("display","block");
							     div10.css("display","block");
							     textarea.attr("readonly",false);
							  }else{
								  div8.css("display","none");
								  div10.css("display","none");
						}
			  
							  }
						const subscribeBtn=$(".subscribeBtn");
						console.log(data.memberId);
						if(sessionId==data.memberId){
							subscribeBtn.css("display","none");
							$(".postUpdateBtn").css("display","block");
							$(".postDeleteBtn").css("display","block");
							$(".postUpdateAtag").attr("href","/moviePostUpdateFrm.do?moviePostNo="+moviePostNo+"&movieNo="+movieNo);
							$(".postDeleteAtag").attr("href","/moviePostDelete.do?moviePostNo="+moviePostNo+"&movieNo="+movieNo);
						
						}else{
							subscribeBtn.css("display","block");
							$(".postUpdateBtn").css("display","none");
							$(".postDeleteBtn").css("display","none");
						}
			  
			  }
			
			  });	

	   			$(".modal3").removeClass("hidden3");//아작스가 필요하다면 아작스 내부에서 마지막 코드가 됨
	   			//openModal();
	   
   });
   
	function updatePostComment(obj,moviePostCommentNo){
		
		const postComment=$(obj).parent().parent().prev().children().val();
	
		$.ajax({
			  url :"/updatePostComment.do",
			  type : "post",
			  data : {moviePostCommentNo:moviePostCommentNo,postComment:postComment},
			  success : function(data){
				  $(".modal3").addClass("hidden3");
					
			  }
			  
		});
		
	}
	
	function deletePostComment(obj,moviePostCommentNo){

		$.ajax({
			  url :"/deletePostComment.do",
			  type : "post",
			  data : {moviePostCommentNo:moviePostCommentNo},
			  success : function(data){
				  $(".modal3").addClass("hidden3");
			  }
		});
	}
	
	$("#close3").on("click",function(){
		$(".modal3").addClass("hidden3");
	});    
	   
   /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
   const overlay3 = modal3.querySelector(".modal_overlay3");
   const closeBtn3 = modal3.querySelector("#close3");
   
   const closeModal3 = () => {
       modal3.classList.add("hidden3");
   }
   overlay3.addEventListener("click",closeModal3);
   
   /*댓글 새로고침을 방지하기 위해 주소에stat을 넣음*/
   window.onload=function(){
	   
	const urlParams = new URL(location.href).searchParams;
	const stat = urlParams.get('stat');
	
		if(stat == 1){
		    const contents = $(".tabcontent");
		    contents.hide();
	    	contents.eq(1).show();
	    }
	}
	 //무비포스트 댓글 등록
	$(".postCommentBtn").on("click",function(){
		const moviePostNo =$(".modalPostNo").val();
		const movieTitle=$(".modalMovieTitle").val();
		const memberId=$(".loginId").val();
		const PostComment=$(".postComment").val();
	$.ajax({
			url:"/insertPostComment.do",
			type:"post",
			data:{moviePostNo:moviePostNo,movieTitle:movieTitle,memberId:memberId,PostComment:PostComment},
			success:function(data){
				$(".modal3").addClass("hidden3");
			}
			
		}); 
		
	});
	


</script>
<script src = "/resources/js/movieDetail.js"></script>
</body>
</html>
<%@include file="/WEB-INF/views/common/footer.jsp" %>