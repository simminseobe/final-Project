package common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.admin.model.vo.Consultation;

public class WebSocketHandler extends TextWebSocketHandler {
	private Map<String, Consultation> consultationMap; // 채팅방 목록

	public WebSocketHandler() {
		super();

		consultationMap = new HashMap<String, Consultation>();
	}

	// 클라이언트가 웹소켓으로 최초에 접속했을떄 자동으로 수행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 최초 접속한 session정보를 sessionList에 추가
	}

	// 클라이언트가 메세지를 보내면 처리할 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// message는 js에 ws.send로 보내준 데이터, 자료형은 문자열로 주고받음
		// json형태로 받은 문자열을 json으로 변환해서 사용
		JsonParser jsonParser = new JsonParser();
		// 문자열을 json으로 Parser
		JsonElement element = jsonParser.parseString(message.getPayload());
		// json에서 키에 맞는 값 추출
		// 또 쓰기 위해서 마지막에 문자열로 꺼내옴
		String type = element.getAsJsonObject().get("type").getAsString();
		String msg = element.getAsJsonObject().get("msg").getAsString();
		String consultationNo = element.getAsJsonObject().get("consultationNo").getAsString(); // 채팅방 ID

		// 처리해야 할 type에 따른 다른 동작 수행
		if (type.equals("enter")) {
			Consultation consultation = consultationMap.get(consultationNo);
			//
			if (consultation == null) {
				consultation = new Consultation(Integer.parseInt(consultationNo));
				consultationMap.put(consultationNo, consultation);
			}

			consultation.addMember(session, msg);
			// 다른 맴버 입장 메세지
			String sendMsg = "<p>" + msg + "님이 입장하셨습니다. </p>";
			// 전송 형태인 웹소켓 택스트 객체 생성
			TextMessage textMessage = new TextMessage(sendMsg);
			// 다른 맴버(세션)에 입장 메세지 전송
			for (WebSocketSession memberSession : consultation.getMemberMap().keySet()) {
				// 나 빼고
				if (!memberSession.equals(session)) {
					// 보내면 js에 ws.onmessage가 받음, 자료형은 json
					memberSession.sendMessage(textMessage);
				}
			}
		} else if (type.equals("chat")) {
			Consultation consultation = consultationMap.get(consultationNo);

			if (consultation != null && consultation.hasMember(session)) {
				String sendMsg = "<div class='chat left'><span class='chatId'>"
						+ consultation.getMemberMap().get(session) + " : </span>" + msg + "</div>";
				TextMessage textMessage = new TextMessage(sendMsg);

				for (WebSocketSession memberSession : consultation.getMemberMap().keySet()) {
					if (!memberSession.equals(session)) {
						memberSession.sendMessage(textMessage);
					}
				}
			}
		}
	}

// 클라이언트와 연결이 끊어졌을때 자동으로 수행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Consultation consultationRoomToRemove = null;

		for (Consultation consultation : consultationMap.values()) {
			if (consultation.hasMember(session)) {
				consultationRoomToRemove = consultation;
				consultation.removeMember(session);
				break;
			}
		}

		String sendMsg = "<p>" + consultationRoomToRemove.getMemberMap().get(session) + "님이 나가셨습니다.</p>";
		TextMessage textMessage = new TextMessage(sendMsg);

		for (WebSocketSession memberSession : consultationRoomToRemove.getMemberMap().keySet()) {
			memberSession.sendMessage(textMessage);
		}
		if (consultationRoomToRemove.getMemberMap().isEmpty()) {
			consultationMap.remove(consultationRoomToRemove.getConsultationMember());
		}
	}
}
