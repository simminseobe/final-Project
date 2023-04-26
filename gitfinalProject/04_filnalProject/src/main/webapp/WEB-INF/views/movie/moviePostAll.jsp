<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href= "/resources/css/moviePostAll.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

</head>
<body>
    <div class="contentWrap" style="margin: 0 auto; margin-top:50px; margin-bottom:500px;">
       <div class="post-rank-box">
            <div class="post-inner-box">
                <div class="inner-box-top">
                    <div class="inner-box-top-head">
                        <h2>무비포스트</h2>
                    </div>
                    <div class="post-box-btn">
                        <a><button>무비포스트 작성하기</button></a>
                    </div>
                </div>
                <div class="post-rank">
                    <ol>
                        <li>
                            <a href="#" class="top5Btn">
                                <p class="rank">1</p>
                                <div class="post-count" style="opacity: 1;">
                                    <p class="tit">POST</p>
                                    <p class="count">2105</p>
                                </div>
                                <p class="img">
                                    <img src="https://img.megabox.co.kr/SharedImg/2023/02/14/1qQwcE8bJztZhQS0lvYmBz4LMivnbnfg_150.jpg">
                                </p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="top5Btn">
                                <p class="rank">2</p>
                                <div class="post-count" style="opacity: 1;">
                                    <p class="tit">POST</p>
                                    <p class="count">2105</p>
                                </div>
                                <p class="img">
                                    <img src="https://img.megabox.co.kr/SharedImg/2023/02/14/1qQwcE8bJztZhQS0lvYmBz4LMivnbnfg_150.jpg">
                                </p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="top5Btn">
                                <p class="rank">3</p>
                                <div class="post-count" style="opacity: 1;">
                                    <p class="tit">POST</p>
                                    <p class="count">2105</p>
                                </div>
                                <p class="img">
                                    <img src="https://img.megabox.co.kr/SharedImg/2023/02/14/1qQwcE8bJztZhQS0lvYmBz4LMivnbnfg_150.jpg">
                                </p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="top5Btn">
                                <p class="rank">4</p>
                                <div class="post-count" style="opacity: 1;">
                                    <p class="tit">POST</p>
                                    <p class="count">2105</p>
                                </div>
                                <p class="img">
                                    <img src="https://img.megabox.co.kr/SharedImg/2023/02/14/1qQwcE8bJztZhQS0lvYmBz4LMivnbnfg_150.jpg">
                                </p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="top5Btn">
                                <p class="rank">5</p>
                                <div class="post-count" style="opacity: 1;">
                                    <p class="tit">POST</p>
                                    <p class="count">2105</p>
                                </div>
                                <p class="img">
                                    <img src="https://img.megabox.co.kr/SharedImg/2023/02/14/1qQwcE8bJztZhQS0lvYmBz4LMivnbnfg_150.jpg">
                                </p>
                            </a>
                        </li>
                    </ol>
                    <div class="mypost-box">
                    <!--로그인 전-->
                        <div class="before">
                            <div class="post-count">
                                <p class="tit">MY POST</p>
                                <a href="#" class="txt-login">로그인하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src = "/resources/js/moviePostAll.js"></script>
</body>
</html>
<%@include file="/WEB-INF/views/common/footer.jsp" %>