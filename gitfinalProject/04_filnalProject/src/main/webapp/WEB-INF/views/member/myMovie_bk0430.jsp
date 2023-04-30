<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/purchaseDetail.css">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<table>
	<td>
	<div class="menubar">
		<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
	<td>
    	  <div class="tabcontent movie-all-list-flex"
             style="display: flex; flex-wrap: wrap; margin: -60px; margin-top: 5px; margin-bottom: 10px;">
             <c:forEach items="${favoriteMovieList}" var="favorite">
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
                     <button type=" button"
                         style="width: 150px; height: 40px; font-size: 18px;  vertical-align: center;">
                             예약하기
                     </button>
                     </div>
                 </div>
             </div>
         </c:forEach>
         <div class="bottom-btn" style="margin: 0 auto; margin-left: 55px; margin-top: 20px;">
             <button type="button" id="load">더보기</button>
         </div>
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
            
        
            
      
            
            


            </script>
	<script src="/resources/js/movieDetail.js" ></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />