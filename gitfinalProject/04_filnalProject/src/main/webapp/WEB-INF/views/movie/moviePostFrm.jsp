<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="postLeftSideContent">
                    <span><button type="button">스틸컷</button></span>
                    <span><button type="button">예고편</button></span>
                    <span><button type="button">내사진</button></span>
                </div>
                <div class="postLeftSideSel">
                    <ul>
                        <li></li>
                    </ul>    
                </div>
            </div>
            <div class="moviePostRightSide">
                <div class="postRightSideTit">
                    <p>원하시는 스틸컷/예고편을 선택해주세요.</p>
                </div>
                <div class="postRightSideContent">
                    <div class="postRightSideSel">
                        <img src="img/bg-img-select.png">
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
    </div>
    <script src = "/resources/js/moviePostFrm.js"></script>
</body>
</html>