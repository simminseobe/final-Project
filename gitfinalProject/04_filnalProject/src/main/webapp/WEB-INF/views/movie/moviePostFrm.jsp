<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href= "/resources/css/moviePostFrm.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
</head>
<body>
	<div class="moviePostFrmAllWrap" style="width:1100px; margin: 0 auto;">
	<form action="/moviePostInsert.do" method="post" enctype="multipart/form-data">
        <div class="moviePostTit"  style="margin-top: 100px;">
            <h2>무비포스트 작성</h2>
        </div>
        <div class="moviePostSubwrap">
            <div class="postSubLeft">
                <h2>영화제목</h2>
            </div>
            <div class="postSubRight">
                <button type="button">다시선택</button>
            </div>
        </div>
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
                            
                            </c:forEach>
                        </div>
                        <div class="tabcontent previewCut"style="display: none">
                            <c:forEach items="${mvList }" var="mv">
                            	<video class="previewCutVideo" width="220px" height="136px" controls>
                            		<source class="previewCutVideoSource" src="${mv.videoLink }">
                            	</video>
			            	</c:forEach>
                        </div>
                        <div class="tabcontent myphotoCut" style="text-align: left; display: none;">
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
                        <img class="current-img"  src="img/bg-img-select.png">
                        <video id="previewCutVideo" width="400px" height="252px" controls style="display: none;">
                            <source >
                        </video>
                    </div>
                    <div class="postRightSideTxt">
                        <textarea style="padding: 5px; width: 400px; height: 72px; box-sizing: border-box; resize: none;" placeholder="내용을 입력해주세요."></textarea>
                    </div>
                </div>
                <div class="postRightSideBtn">
                    <button class="postAddBtn">포스트 추가</button>
                </div>
            </div>
        </div>
        <div class="moviePostBottomBtn">
            <div class="moviePostEnrollBtn">
                <button type="button">등록</button>
            </div>
            <div class="moviePostCancelBtn">
                <button type="button">취소</button>
            </div>
        </div>
        </form><!-- form끝 -->
    </div>
    <script src = "/resources/js/moviePostFrm.js"></script>
</body>
</html>