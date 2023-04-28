<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
            <!-- <script src="/resources/js/admin/adminChatting.js"></script> -->
            <title>상담 채팅 입장</title>
            <style>
                .chatting-area {
                    margin: auto;
                    height: 600px;
                    width: 800px;
                    margin-top: 50px;
                    margin-bottom: 500px;
                }

                #exit-area {
                    text-align: right;
                    margin-bottom: 10px;
                }

                .display-chatting {
                    width: 100%;
                    height: 450px;
                    border: 1px solid gold;
                    overflow: auto;
                    /*스크롤 처럼*/
                    list-style: none;
                    padding: 10px 10px;
                    background: lightblue;
                    z-index: 1;
                    positon: absoulte;
                }

                .chat {
                    display: inline-block;
                    border-radius: 5px;
                    padding: 5px;
                    background-color: #eee;
                }

                .input-area {
                    width: 100%;
                    display: flex;
                }

                #inputChatting {
                    width: 80%;
                    resize: none;
                }

                #send {
                    width: 20%;
                }

                .myChat {
                    text-align: right;
                }

                .myChat>p {
                    background-color: gold;
                }

                .chatDate {
                    font-size: 10px;
                }

                .img {
                    width: 100%;
                    height: 100%;
                    position: relative;
                    z-index: -100;
                }
            </style>
        </head>

        <body>
            <div class="chatting-area">
                <br><br>
                <div id="exit-area">
                    <button class="btn btn-outline-danger" id="exit-btn">나가기</button>
                </div>
                <ul class="display-chatting">
                    <!-- <img src="" /> -->
                    <li class="myChat">
                        <span class="chatDate">이름</span>
                        <p class="chat">메세지</p>
                    </li>
                    <li>
                        <b>이름</b>
                        <p class="chat">메세지</p>
                        <span class="chatDate">2022</span>
                </ul>
                <div class="input-area">
                    <textarea id="inputChatting" rows="3"></textarea>
                    <button type="button" onclick="send();">보내기</button>
                </div>

            </div>
        </body>

        </html>