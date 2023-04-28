<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href= "/resources/css/moviePostUpdateFrm.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
</head>
<body> 
	<div class="moviePostFrmAllWrap" style="width:1100px; margin: 0 auto;">

        <div class="moviePostTit"  style="margin-top: 100px;">
            <h2>무비포스트 수정</h2>
        </div>
        <div class="moviePostSubwrap">
            <div class="postSubLeft">
                <h2>${moviePost.movieTitle}</h2>
            </div>
            <div class="postSubRight">
			<<input type="text" name="movieTitle" value="${moviePost.movieTitle }" style="display:none;">
			<input type="text"  name="movieNo" value="${moviePost.movieNo }" style="display:none;">
			<input type="text" name="memberId" value="${sessionScope.m.memberId }" style="display:none;">
			
                <button type="button" class="reselect">다시선택</button>
            </div>
        </div>
         <form action="/updatePost.do" method="post">
        <input type="text"  name="movieNo" value="${moviePost.movieNo }" style="display:none;">
         <input type="text"  name="moviePostNo" value="${moviePost.moviePostNo }" style="display:none;">
        <div class="moviePostSideAll">
            <div class="moviePostLeftSide">
                <div class="postLeftSideTit">
                    <p>원하시는 스틸컷/예고편을 선택해주세요.</p>
                </div>
                <div class="postLeftSideContent tab-wrap">
                    <div class="LeftSideContentBtn">
                        <a href="#"><button type="button" class="tab stillCutBarBtn">스틸컷</button></a>
                        <a href="#"><button type="button" class="tab proviewBarBtn">예고편</button></a>
                        <a href="#"><button type="button" class="tab myPhotoBtn" id="myPhotoBtn">내사진</button></a>
                    </div>
                    <div class="postLeftSideSel content-wrap">
                        <div class="tabcontent stillCut">
                        	<c:forEach items="${movieFileAll}" var="movFile">
                                <img class="stillCutImg" src="/resources/upload/movie/${movFile.movieFileName}" style="width: 135px; height:194px; margin: 10px 5px;">
                                <input id="movieFileNo1" value="${movFile.movieFileNo }" style="display:none;" disabled>
                            </c:forEach>
                        </div>
                        <div class="tabcontent previewCut"style="display: none">
                            <c:forEach items="${mvList }" var="mv">
                            	<video class="previewCutVideo" width="220px" height="136px" controls>
                            		<source class="previewCutVideoSource" src="${mv.videoLink }">
                            	</video>
                            	<input id="movieVideoNo1" value="${mv.videoNo }" style="display:none;" disabled>
			            	</c:forEach>
                        </div>
                        <div class="tabcontent myphotoCut" style="text-align: left; ">
                        	<p>※ 2M 이내의 jpg,gif,png 파일만 등록이 가능합니다.</p>
                        	<p style="margin-top: 10px;">※ 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</p>
                            <div class="innerBtnWrap" style="margin-top: 15px; display: flex; justify-content: center;">
                                <button type="button" id="addMyPhotoImgBtn" onclick="myPhotoUpload();">등록</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="moviePostRightSide">
                <div class="postRightSideTit">
                    <p>원하시는 스틸컷/예고편을 선택해주세요.</p>
                </div>
                <div class="postRightSideContent">
                    <div class="postRightSideSel">
                        <input type="image" class="current-img"  src="/resources/upload/movie/${moviePost.movieFilePath}">
                        <video id="previewCutVideo currentPreviewVideo" width="400px" height="252px" controls style="display: none;">
                            <source class="currentSource" src="${moviePost.videoLink }">
                        </video>
                        <input class="movieFileNo" style="display:none;" name="movieFileNo" value="${moviePost.movieFileNo}">
                        <input class="movieVideoNo" style="display:none;" value="${moviePost.movieVideoNo}">
                    </div>
                    <div class="postRightSideTxt">
                        <textarea name="moviePostContent" style="padding: 5px; width: 400px; height: 72px; box-sizing: border-box; resize: none;" placeholder="내용을 입력해주세요.">${moviePost.moviePostContent}</textarea>
                    </div>
                </div>
                <div class="postRightSideBtn">
                    <button type="button" style="display:none;" class="postAddBtn">포스트 추가</button>
                </div>
            </div>
        </div>
        <div class="moviePostBottomBtn">
            <div class="moviePostEnrollBtn">
                <button class="postEnrolltBtn" type="submit">수정</button>
            </div>
            <div class="moviePostCancelBtn">
                <button type="button">취소</button>
            </div>
        </div>
		</form>
    </div>
    <script>
	    window.onload=function(){
     	const movieFileNo=$(".movieFileNo").val();
    	const movieVideoNo=$(".movieVideoNo").val();
    	const stillCutBarBtn=$(".stillCutBarBtn");
    	const proviewBarBtn=$(".proviewBarBtn");
    	
    	console.log(movieFileNo);
    	console.log(movieVideoNo);
    	const currentImg=$(".current-img");
        if(movieFileNo ==0 && movieVideoNo !=""){
        	currentImg.attr("src","img/bg-img-select.png");
        	proviewBarBtn.click();
        }else if(movieFileNo !="" && movieVideoNo ==0){
        	stillCutBarBtn.click();
        }else if(movieFileNo !="" && movieVideoNo !=""){
        	stillCutBarBtn.click();
        } 
    }   
    
	
	$(".reselect").on("click",function(){
		const currentImg=$(".current-img");
		currentImg.attr("src","img/bg-img-select.png");
		  $(".postRightSideSel>video").remove();
	      $(".postRightSideSel").append(video);
		
	});
	
	$(".moviePostCancelBtn").on("click",function(){
		
		const movieNo=$("[name=movieNo]").val();
		
		location.href="/movieDetail.do?movieNo="+movieNo+"&reqPage=1";
		
	});
	
   
    
    </script>
    <script src = "/resources/js/moviePostUpdateFrm.js"></script>
</body>
</html>