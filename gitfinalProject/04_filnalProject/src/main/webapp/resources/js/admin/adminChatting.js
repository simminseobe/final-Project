// 웹소켓 객체를 저장하는 변수
let ws;
// 회원 아이디를 저장하는 변수
let consultationNo;
let chatMember;
let memberLevel

$(document).ready(function () {
    consultationNo = $("#consultationNo").val();
    chatMember = $("#chatMember").val();
    memberLevel = $("#memberLevel").val();

    // 웹 소켓 연결 시도
    ws = new WebSocket("ws://14.37.168.225/adminChatSocket.do");
    // 웹 소켓 연결 성공시 실행할 함수 지정
    ws.onopen = startChat;
    // 서버에서 데이터를 받으면 처리할 함수 지정
    ws.onmessage = receiveMsg;
    // 웹소켓 연결이 종료되면 실행될 함수 지정
    ws.onclose = endChat;

    $(".chatting").slideDown();

    $.ajax({
        url: "/selectChat.do",
        method: "POST",
        dataType: "json",
        data: {consultationNo: consultationNo},
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                if (chatMember == data[i].chatMember) {
                    if (data[i].chatMember != data[i].chatContent) {
                        appendChat("<div class='chat right'>" + data[i].chatContent + "</div>");
                    }
                } else {
                         appendChat("<div class='chat left'><span class='chatId'>"
							+ data[i].chatMember + " : </span>" + data[i].chatContent + "</div>");                 
                }						
			}
        },
    });
});

function startChat() {
    console.log("ddd");
    // 그냥 문자열로 주면 처리하기 귀찮으니까 json으로 보내줌
    // type은 웹소켓에 처리 종류, msg는 session.Message로 받는거
    // 정해진게 아니라 그냥 키 값임
    const data = {
        type: "enter",
        msg: chatMember,
        chatMember: chatMember,
        memberLevel: memberLevel,
        consultationNo: consultationNo
    };
    // send()는 인수가 문자열
    // 그래서 json형태를 잠깐 문자열로 바꿔서 전송
    ws.send(JSON.stringify(data));
}

function receiveMsg(param) {
    // 데이터는 json형태로 왔다 갔다.
    appendChat(param.data);
}

function endChat() {
    console.log("웹소켓 연결 종료");
}

function sendMsg() {
    const msg = $("#sendMsg").val();

    if (msg != '') {
        const data = {
            type: "chat",
            msg: msg,
            chatMember: chatMember,
            memberLevel: memberLevel,
            consultationNo: consultationNo
        };

        ws.send(JSON.stringify(data));

        appendChat("<div class='chat right'>" + msg + "</div>");

        $("#sendMsg").val('');
    }
}

$("#sendMsg").on("keyup", function (e) {
    if (e.keyCode == 13) {
        sendMsg();
    }
});

function appendChat(chatMsg) {
    $(".messageArea").append(chatMsg);
    $(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
}