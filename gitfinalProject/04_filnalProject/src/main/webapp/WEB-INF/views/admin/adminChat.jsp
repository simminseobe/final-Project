<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>맴버끼리 채팅</title>
            <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
            <script src="/resources/js/admin/adminChatting.js"></script>
            <style>
                .chatting {
                    width: 500px;
                    display: none;
                }

                .messageArea {
                    overflow-y: auto;
                    border: 1px solid black;
                    height: 500px;
                    display: flex;
                    flex-direction: column;
                    background-color: #b2c7d9;
                }

                .messageArea>p {
                    text-align: center;
                    width: 100%;
                }

                #sendMsg {
                    width: 75%;
                }

                #sendBtn {
                    width: 20%;
                }

                .chat {
                    margin-bottom: 10px;
                    padding: 8px;
                    border-radius: 3px;
                }

                .left {
                    position: relative;
                    max-width: 300px;
                    align-self: flex-start;
                    background-color: #fff;
                    border-radius: 10px;
                    margin-left: 16px;
                    padding: 15px;
                }

                .left:after {
                    content: '';
                    position: absolute;
                    border-style: solid;
                    border-width: 15px 15px 15px 0;
                    border-color: transparent #fff;
                    display: block;
                    width: 0;
                    z-index: 1;
                    left: -15px;
                    top: 12px;
                }

                .right {
                    position: relative;
                    max-width: 300px;
                    align-self: flex-end;
                    background-color: #ffeb33;
                    border-radius: 10px;
                    margin-right: 16px;
                    padding: 15px;
                }

                .right:after {
                    content: '';
                    position: absolute;
                    border-style: solid;
                    border-width: 15px 0 15px 15px;
                    border-color: transparent #ffeb33;
                    display: block;
                    width: 0;
                    z-index: 1;
                    right: -15px;
                    top: 12px;
                }
            </style>
        </head>

        <body>
            <input type="hidden" id="consultationNo" value="${chat.consultationNo}">
            <input type="hidden" id="chatMember" value="${chat.chatMember}">
            <input type="hidden" id="memberLevel" value="${chat.memberLevel}">
            <h1>전체채팅</h1>
            <hr>
            <br>
            <div class="chatting">
                <div class="messageArea">
                    <p>채팅방에 입장했습니다.</p>
                </div>
                <div class="sendBox">
                    <input type="text" id="sendMsg">
                    <button id="sendBtn" onclick="sendMsg();">전송</button>
                </div>
            </div>
            <hr>
            <a href="/">메인으로 돌아가기</a>
        </body>

        </html>