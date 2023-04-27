let ws;
let consultationNo = "${consultation.consultationNo}";
let consultationMember = "${consultation.consultationMember}";

$(document).ready(function () {
    // 웹 소켓 연결 시도
    ws = new WebSocket("ws://192.168.10.11/adminChatSocket.do");
    // 웹 소켓 연결 성공시 실행할 함수 지정
    ws.onopen = startChat;
    // 서버에서 데이터를 받으면 처리할 함수 지정
    ws.onmessage = receiveMsg;
    // 웹소켓 연결이 종료되면 실행될 함수 지정
    ws.onclose = endChat;
});

function startChat() {
    // 그냥 문자열로 주면 처리하기 귀찮으니까 json으로 보내줌
    // type은 웹소켓에 처리 종류, msg는 session.Message로 받는거
    // 정해진게 아니라 그냥 키 값임
    const data = {
        type: "enter",
        msg: consultationMember
    };
    // send()는 인수가 문자열
    // 그래서 json형태를 잠깐 문자열로 바꿔서 전송
    ws.send(JSON.stringify(data));
}

// function receiveMsg(param) {
//     appendChat(param.data);
// }

// function endChat() {

// }

// function appendChat(chatMsg) {
//     $(".messageArea").append(chatMsg);
//     $(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
// }