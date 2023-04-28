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
                <div class="movieList-title-wrap" style=" margin-top: 100px;">
                    <h1 style="font-size:30px;">전체영화</h1>
                </div>
                <div class="movie-list-wrap">
                    <div class="movie-list-menu tabs-wrap">
                        <ul class="tabs">
                            <li><a href="#">박스오피스</a></li>
                            <li><a href="#">상영예정작</a></li>
                            <li><a href="#">특별상영</a></li>
                            <li><a href="#">필름소사이어티</a></li>
                            <li><a href="#">클래식소사이어티</a></li>
                            <c:if test="${not empty sessionScope.m && sessionScope.m.memberId }">
	                            <li><a href="#">사용자 선호장르영화</a></li>
                            </c:if>
                        </ul>
                    </div>
                    <div class="movie-list-content-wrap" style="margin-top: 25px;">
                        <div class="movie-list-content-top">
                            <button type="button" title="개봉작만보기" class="btn-onair btnOnAir">개봉작만</button>
                            <span>총 ${movieListCount}의 영화가 검색되었습니다.</span>
                            <div class="searchBox">
                                <input type="text" id="movieSearch" name="movieSearch" placeholder="영화명 검색">
                                <img src="img/search-30.png">
                            </div>
                        </div>
                        <div class="movie-list-content-mid active-movie-more clearfix">
                            <div class="tabcontent movie-all-list-flex"
                                style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                                <c:forEach items="${list}" var="po">
                                <div class="movie-all-list" style="margin-top: 25px; ">
                                    <div class="movie-list-set" style="overflow: hidden;">
                                        <a href="/movieDetail.do?movieNo=${po.movieNo}&reqPage=1">
                                            <div class="img-poster">
                                                <img src="/resources/upload/movie/${po.mainFile.movieFileName}" style="width: 230px; height:331px;">
                                            </div>
                                            <div class="cover" style=" color:white; padding: 10px;">
                                                <div class="coverMovieContent" style="height: 230px; font-size: 10px; margin: 5px 0;">
                                                    <p>${po.movieContent}</p>
                                                </div>
                                                <div class="coverMovieRate" style="position: absolute; left: 0; bottom: 15px; text-align: center;">
                                                    <div class="innerCoverMovieRate" style="margin-top: 10px; padding-top: 10px; width: 230px; border-top:1px solid lightgray; font-size: 20px;">
                                                        <p>관람평<span style="color:#ffcb05">${po.movieScoreAvg.movieScoreAvg}</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </a>
                                        <div class="movie-title-wrap" style="margin-top: 20px; font-size: 18px;">
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
                                            <button type="button" class="likeCount"style="width: 76px; height: 40px; font-size: 18px; border: 1px solid lightgray; background-color: transparent; border-radius: 5px;">
                                            	
                                            	<c:choose>
                                            	<c:when test="${po.likeCheck eq 1}">
	                                            	<img src="img/black-heart.png" style="width:18px; height:18px; font-size:10px;">
                                            	</c:when>
                                            	<c:otherwise>
                                            		<img src="img/bin-heart.png" style="width:18px; height:18px; font-size:10px;">
                                            	</c:otherwise>
                                            	</c:choose>
                                            	
                                            	<span>${po.likeCount}</span>
                                            </button>
                                            <input type=text class="likeMovieNo" value="${po.movieNo}" style="display:none">
                                        </div>
                                        <div class="movieAllList-reserve" style="margin-top: 10px;">
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
                             <!--============================================================-->
                             <!-- 상영예정작 들어갈자리 -->
                             <div class="tabcontent movie-all-list-flex"
                             style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                             <c:forEach items="${expectedList}" var="expected">
                             <div class="movie-all-list" style="margin-top: 25px; ">
                                 <div class="movie-list-set" style="overflow: hidden;">
                                     <a href="/movieDetail.do?movieNo=${expected.movieNo}&reqPage=1">
                                         <div class="img-poster">
                                             <img src="/resources/upload/movie/${expected.mainFile.movieFileName}" style="width: 230px; height:331px;">
                                         </div>
                                         <div class="cover" style=" color:white; padding: 10px;">
                                             <div class="coverMovieContent" style="height: 230px; font-size: 10px; margin: 5px 0;">
                                                 <p>${expected.movieContent}</p>
                                             </div>
                                             <div class="coverMovieRate" style="position: absolute; left: 0; bottom: 15px; text-align: center;">
                                                 <div class="innerCoverMovieRate" style="margin-top: 10px; padding-top: 10px; width: 230px; border-top:1px solid lightgray; font-size: 20px;" >
                                                     <p>관람평<span style="color:#ffcb05"> ${expected.movieScoreAvg.movieScoreAvg}</span></p>
                                                 </div>
                                             </div>
                                         </div>
                                         
                                     </a>
                                     <div class="movie-title-wrap" style="margin-top: 20px; font-size: 18px;">
                                         <p class="movie-title" >${expected.movieTitle }</p>
                                         <input class="inputMovieTitle" style="display:none;" value="${expected.movieTitle }">
                                     </div>
                                     <div class="reserve-rate" style="font-size: 18px;">
                                         <p>예매율%</p>
                                     </div>
                                     <div class="start-date" style="font-size: 18px;">
                                         <p>${expected.movieDate}</p>
                                     </div>
                                     <div class="movieAllList-like" style="margin-top: 10px; float: left;">
                                          <button type="button"
                                                style="width: 76px; height: 40px; font-size: 18px; border: 1px solid lightgray; background-color: transparent; border-radius: 5px;"><img
                                                    src="img/bin-heart.png"
                                                    style="width:18px; height:18px;"></button>
                                          <input type=text class="likeMovieNo" value="${po.movieNo}" style="display:none">
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
                         <!--==============특별상영 들어갈 자리================-->
                         <div class="tabcontent movie-all-list-flex"
                         style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                         <c:forEach items="${specialList}" var="special">
                         <div class="movie-all-list" style="margin-top: 25px; ">
                             <div class="movie-list-set" style="overflow: hidden;">
                                 <a href="/movieDetail.do?movieNo=${special.movieNo}&reqPage=1">
                                     <div class="img-poster">
                                         <img src="/resources/upload/movie/${special.mainFile.movieFileName}" style="width: 230px; height:331px;">
                                     </div>
                                     <div class="cover" style=" color:white; padding: 10px;">
                                         <div class="coverMovieContent" style="height: 230px; font-size: 10px; margin: 5px 0;">
                                             <p>${special.movieContent}</p>
                                         </div>
                                         <div class="coverMovieRate" style="position: absolute; left: 0; bottom: 15px; text-align: center;">
                                             <div class="innerCoverMovieRate" style="margin-top: 10px; padding-top: 10px; width: 230px; border-top:1px solid lightgray; font-size: 20px;">
												 <p>관람평<span style="color:#ffcb05"> ${special.movieScoreAvg.movieScoreAvg}</span></p>
                                             </div>
                                         </div>
                                     </div>
                                 </a>
                                 <div class="movie-title-wrap" style="margin-top: 20px; font-size: 18px;">
                                     <p class="movie-title" >${special.movieTitle }</p>
                                     <input class="inputMovieTitle" style="display:none;" value="${special.movieTitle }">
                                 </div>
                                 <div class="reserve-rate" style="font-size: 18px;">
                                     <p>예매율%</p>
                                 </div>
                                 <div class="start-date" style="font-size: 18px;">
                                     <p>${special.movieDate}</p>
                                 </div>
                                 <div class="movieAllList-like" style="margin-top: 10px; float: left;">
                                     <button type="button"
                                                style="width: 76px; height: 40px; font-size: 18px; border: 1px solid lightgray; background-color: transparent; border-radius: 5px;"><img
                                                    src="img/bin-heart.png"
                                                    style="width:18px; height:18px;"></button>
                                       <input type=text class="likeMovieNo" value="${po.movieNo}" style="display:none">
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
                     <!--===============필름소사이어티===================-->
                     <div class="tabcontent movie-all-list-flex"
                     style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                     <c:forEach items="${filmSocietyList}" var="filmSociety">
                     <div class="movie-all-list" style="margin-top: 25px; ">
                         <div class="movie-list-set" style="overflow: hidden;">
                             <a href="/movieDetail.do?movieNo=${filmSociety.movieNo}&reqPage=1">
                                 <div class="img-poster">
                                     <img src="/resources/upload/movie/${filmSociety.mainFile.movieFileName}" style="width: 230px; height:331px;">
                                 </div>
                                 <div class="cover" style=" color:white; padding: 10px;">
                                     <div class="coverMovieContent" style="height: 230px; font-size: 10px; margin: 5px 0;">
                                         <p>${filmSociety.movieContent}</p>
                                     </div>
                                     <div class="coverMovieRate" style="position: absolute; left: 0; bottom: 15px; text-align: center;">
                                         <div class="innerCoverMovieRate" style="margin-top: 10px; padding-top: 10px; width: 230px; border-top:1px solid lightgray; font-size: 20px;">
                                             <p>관람평<span style="color:#ffcb05"> ${filmSociety.movieScoreAvg.movieScoreAvg}</span></p>
                                         </div>
                                     </div>
                                 </div>
                             </a>
                             <div class="movie-title-wrap" style="margin-top: 20px; font-size: 18px;">
                                 <p class="movie-title">${filmSociety.movieTitle }</p>
                                 <input class="inputMovieTitle" style="display:none;" value="${filmSociety.movieTitle }">
                             </div>
                             <div class="reserve-rate" style="font-size: 18px;">
                                 <p>예매율%</p>
                             </div>
                             <div class="start-date" style="font-size: 18px;">
                                 <p>${filmSociety.movieDate}</p>
                             </div>
                             <div class="movieAllList-like" style="margin-top: 10px; float: left;">
                                  <button type="button"
                                                style="width: 76px; height: 40px; font-size: 18px; border: 1px solid lightgray; background-color: transparent; border-radius: 5px;"><img
                                                    src="img/bin-heart.png"
                                                    style="width:18px; height:18px;"></button>
                                   <input type=text class="likeMovieNo" value="${po.movieNo}" style="display:none">
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
                 <!--=====================클래식소사이어티======================-->
                 <div class="tabcontent movie-all-list-flex"
                 style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
                 <c:forEach items="${classicSocietyList}" var="classicSociety">
                 <div class="movie-all-list" style="margin-top: 25px; ">
                     <div class="movie-list-set" style="overflow: hidden;">
                         <a href="/movieDetail.do?movieNo=${classicSociety.movieNo}&reqPage=1">
                             <div class="img-poster">
                                 <img src="/resources/upload/movie/${classicSociety.mainFile.movieFileName}" style="width: 230px; height:331px;">
                             </div>
                             <div class="cover" style=" color:white; padding: 10px;">
                                 <div class="coverMovieContent" style="height: 230px; font-size: 10px; margin: 5px 0;">
                                     <p>${classicSociety.movieContent}</p>
                                 </div>
                                 <div class="coverMovieRate" style="position: absolute; left: 0; bottom: 15px; text-align: center;">
                                     <div class="innerCoverMovieRate" style="margin-top: 10px; padding-top: 10px; width: 230px; border-top:1px solid lightgray; font-size: 20px;">
                                        <p>관람평<span style="color:#ffcb05"> ${classicSociety.movieScoreAvg.movieScoreAvg}</span></p>
                                     </div>
                                 </div>
                             </div>
                             
                         </a>
                         <div class="movie-title-wrap" style="margin-top: 20px; font-size: 18px;">
                             <p class="movie-title" >${classicSociety.movieTitle }</p>
                             <input class="inputMovieTitle" style="display:none;" value="${classicSociety.movieTitle }">
                         </div>
                         <div class="reserve-rate" style="font-size: 18px;">
                             <p>예매율%</p>
                         </div>
                         <div class="start-date" style="font-size: 18px;">
                             <p>${classicSociety.movieDate}</p>
                         </div>
                         <div class="movieAllList-like" style="margin-top: 10px; float: left;">
                              <button type="button"
                                                style="width: 76px; height: 40px; font-size: 18px; border: 1px solid lightgray; background-color: transparent; border-radius: 5px;"><img
                                                    src="img/bin-heart.png"
                                                    style="width:18px; height:18px;"></button>
                               <input type=text class="likeMovieNo" value="${po.movieNo}" style="display:none">
                         </div>
                         <div class="movieAllList-reserve" style="margin-top: 10px;">
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
            <div class="sessionInfo">
            	<input class="sessionMemberNo" type="text" value="${sessionScope.m.memberNo}">
            </div>
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
            
        
            
      
            
            


            </script>



            <script src="/resources/js/movieAllList.js"></script>
        </body>

        </html>