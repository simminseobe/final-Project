<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet" href="/resources/css/member/purchaseDetail.css">
<link rel="stylesheet" href= "/resources/css/movieDetail.css">
<link rel="stylesheet" href="/resources/css/myMovie.css">

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
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
	<table>
	<td>
		<div class="menubar">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
	</td>
	<td>
    	<div class="movie-list-wrap" style="width:1100px; margin: 0 auto;">
    		<div class="movieList-title-wrap" style=" margin-top: 100px;">
    			<h1 style="font-size:30px;">나의 무비스토리</h1>
    		</div>
    		<div class="movie-list-wrap">
    			<div class="movie-list-menu tabs-wrap">
                        <ul class="tabs">
                            <li><a href="javascript:void(0);">본영화</a></li>
                            <li><a href="javascript:void(0);">무비포스트</a></li>
                            <li><a href="javascript:void(0);">관람평</a></li>
	                        <li><a href="javascript:void(0);">찜영화</a></li>
                        </ul>
                </div>
                <div class="movie-list-content-wrap" style="margin-top: 25px;">
                	<div class="movie-list-content-top">
                			<span class="tabcontent1">본영화 총 <span style="color: #329eb1;">${myMovieListCount}</span>개</span>
                            <span class="tabcontent1" style="display:none;">작성 무비포스트 총 <span style="color: #329eb1;">${moviePostCount}</span>개</span>
                            <span class="tabcontent1" style="display:none;">작성 관람평 총 <span style="color: #329eb1;">${reviewListCount}</span>개</span>
                            <span class="tabcontent1" style="display:none;">찜영화 총 <span style="color: #329eb1;">${favoriteMovieCount}</span>개</span>
                            <div class="searchBox">
                                <input type="text" id="movieSearch" name="movieSearch" placeholder="영화명 검색">
                                <img src="img/search-30.png">
                            </div>
                    </div>
                    
                    <!-- 본 영화  -->
                    <div class="movie-list-content-mid active-movie-more clearfix">
                    	<div class="tabcontent movie-all-list-flex" style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                    		<c:forEach items="${list}" var="po">
                    			<div class="movie-all-list" style="margin-top: 25px; ">
                    				<div class="movie-list-set" style="overflow: hidden;">
                    					 <a href="/movieDetail.do?movieNo=${po.movieNo}&reqPage=1">
                    					 	<div class="img-poster">
                                                <img src="/resources/upload/movie/${po.movieFileName}" style="width: 230px; height:331px;">
                                            </div>
                                         </a>
                                         <div class="movie-title-wrap" style="margin-top: 20px; font-size: 18px;">
                                         	<p class="movie-title" >${po.movieTitle }</p>
                                            <input class="inputMovieTitle" style="display:none;" value="${po.movieTitle }">
                                         </div>
                                         <div class="start-date" style="font-size: 18px;">
                                            <p>${po.scheduleStart}</p>
                                         </div>
                                         <div class="reserve-rate" style="font-size: 18px;">
                                            <p>${po.theaterBranch }</p>
                                         </div>
                    				</div>
                    			</div>
                    		</c:forEach>
                    	</div>
                    </div>
                    
                    
                    
                    <!-- 작성한 무비포스트  -->
                      
                    	<div class="tabcontent movie-all-list-flex" style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                    		<div class="moviePostContentList">
                    <c:forEach items="${oneMoviepostAll}" var="oneMoivePost">
                    <div class="movie-all-list" style="margin-top: 25px; ">
                        <div class="moviePostImg"><!--영화 한개 시작-->
                        ${oneMoviepost.movieNo}
                        <!-- 
                        	<c:choose>
                        	<c:when test="${oneMoivePost.movieFilePath ne null && oneMoivePost.videoLink eq null}">
	                            <img src="/resources/upload/movie/${oneMoivePost.movieFilePath}">
                        	</c:when>
                            <c:when test="${oneMoivePost.movieFilePath ne null && oneMoivePost.videoLink ne null}">
	                            <img src="/resources/upload/movie/${oneMoivePost.movieFilePath}">
                        	</c:when>
                        	<c:when test="${oneMoivePost.movieFilePath eq null && oneMoivePost.videoLink ne null}">
                        		<img src="/resources/upload/movie/${mov.mainFile.movieFileName}">
                        	 -->	
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
                    
                    </div>       
                    	</div>
                    
                    
                    <!-- 작성한 관람평  -->
                    <div class="tabcontent movie-all-list-flex" style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                    
                    </div>
                    
                    <!-- 찜영화  --> 
                    <div class="tabcontent movie-all-list-flex" style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                    	보여라 제발 좀]
                    </div>
                    	<div class="tabcontent movie-all-list-flex" style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                    		<div class="movie-all-list" style="margin-top: 25px; ">
                    			<div class="movie-list-set" style="overflow: hidden;">
                    				<a href="/movieDetail.do?movieNo=${favorite.movieNo}&reqPage=1">
                    					<div class="img-poster">
                             				<img src="/resources/upload/movie/${favorite.mainFile.movieFileName}" style="width: 230px; height:331px;">
                         				</div>
                         				<div class="cover" style=" color:white; padding: 10px;">
                         					<div class="coverMovieContent" style="height: 230px; font-size: 10px; margin: 5px 0;">
                                 				<p>${favorite.movieContent}</p>
                            			 	</div>
                            			 	<div class="coverMovieRate" style="position: absolute; left: 0; bottom: 15px; text-align: center;">
                            			 		<div class="innerCoverMovieRate" style="margin-top: 10px; padding-top: 10px; width: 230px; border-top:1px solid lightgray; font-size: 20px;" >
                            			 			<p>관람평<span style="color:#ffcb05"> ${favorite.movieScoreAvg.movieScoreAvg}</span></p>
                            			 		</div>
                            			 	</div>
                         				</div>
                    				</a>
                    				<div class="movie-title-wrap" style="margin-top: 20px; font-size: 18px;">
                         				<p class="movie-title" >${favorite.movieTitle }</p>
                         				<input class="inputMovieTitle" style="display:none;" value="${favorite.movieTitle }">
                     				</div>
                     				<div class="reserve-rate" style="font-size: 18px;">
                         				<p>예매율%</p>
                     				</div>
                     				<div class="start-date" style="font-size: 18px;">
                         				<p>${favorite.movieDate}</p>
                     				</div>
                     				<div class="movieAllList-like" style="margin-top: 10px; float: left;">
                      					<button type="button" class="likeCount"style="width: 76px; height: 40px; font-size: 18px;">
                          					<c:choose>
                        						<c:when test="${favorite.likeCheck eq 1}">
                            						<img src="img/black-heart.png" style="width:18px; height:18px; font-size:10px;">
                        						</c:when>
                        						<c:otherwise>
                            						<img src="img/bin-heart.png" style="width:18px; height:18px; font-size:10px;">
                        						</c:otherwise>
                        					</c:choose>
                          					<span>${favorite.likeCount}</span>
                      					</button>
                          				<input type=text class="likeMovieNo" value="${favorite.movieNo}" style="display:none">
                     				</div>
                     				<div class="movieAllList-reserve" style="margin-top: 10px;">
                     					<button type=" button" style="width: 120px; height: 40px; font-size: 18px;  vertical-align: center;">
                             				예약하기
                     					</button>
                     				</div>
                    			</div>
                    		</div>
                    	</div>
                    
                     
                    
                </div>
    		</div>
    	</div>
    	 <div class="sessionInfo" style="display:none;">
            <input class="sessionMemberNo" type="text" value="${sessionScope.m.memberNo}">
         </div>
	</td>
</table>


   <script>

            $(".movieAllList-like>button>img").on("click",function(){
            	if($(".sessionMemberNo").val() !=""){
            	
            	const movieNo=$(this).parent().next().val();
                const memberNo=$(".sessionMemberNo").val();
				console.log(memberNo + "스크립트에서 memberNo");
                console.log(movieNo + "스크립트에서 movieNo");
                
            	const binHeart="img/bin-heart.png";
                const blackHeart="img/black-heart.png";
                const current  = $(this).attr("src");
				const icon = $(this);
				
				const likeCount=$(this).next();
				
                if(current == binHeart){
		        	
                  $.ajax({
                	url :"/movieLikeInsert.do",
                	type:"post",
                	data:{movieNo:movieNo,memberNo:memberNo},
                	success:function(data){
                		if(data != null){
                			console.log(data);
							
							const likeCountNumPlus=Number(likeCount.text())+1;
                			const likeCountString=likeCountNumPlus.toString();
                			likeCount.text(likeCountString);
                			console.log(likeCount.text(likeCountString));
                			
                			icon.attr("src",blackHeart); 
                		
                		
                		}else{
                			console.log("fail"); 
                			
                		}
                	}
                	
                });//ajax끝나는 지점
                
		        	
		        }else{
		                $.ajax({
		                	url :"/movieLikeDelete.do",
		                	type:"post",
		                	data:{movieNo:movieNo,memberNo:memberNo},
		                	success:function(data){
		                		if(data != null){
		                			console.log(data);
		                			const likeCountNumMinus=Number(likeCount.text())-1;
		                			const likeCountString=likeCountNumMinus.toString();
		                			likeCount.text(likeCountString);
		                			console.log(likeCount.text(likeCountString));
		                			
		                			icon.attr("src",binHeart); 
		            		    
		                		}else{
		                			console.log("fail"); 
		                			
		                		}
		                	}
		                	
		                });//ajax끝나는 지점
		        		

		            } 
		            	
            	}else{
            		alert("로그인 해주세요");
            	}

            });//on click function끝나는 곳
            
            
            
            
            
            
            
            
            <!-- 무비포스트 관련 -->
            
            
            
            
            
            
            
            
       </script>     
	<script src="/resources/js/myMovie.js" ></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />