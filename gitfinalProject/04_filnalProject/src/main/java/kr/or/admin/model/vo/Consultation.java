package kr.or.admin.model.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Consultation {
	private int consultationNo;
	private String consultationTitle;
	private String consultationStatus;
	private String consultationDate;
	private String consultationMember;

	private Map<WebSocketSession, String> memberMap;

	public Consultation(int consultationNo) {
		this.consultationNo = consultationNo;
		this.memberMap = new HashMap<WebSocketSession, String>();
	}

	public void addMember(WebSocketSession session, String memberId) {
		memberMap.put(session, memberId);
	}

	public void removeMember(WebSocketSession session) {
		memberMap.remove(session);
	}

	public ArrayList<String> getMemberList() {
		return (ArrayList<String>) memberMap.values();
	}

	public boolean hasMember(WebSocketSession session) {
		return memberMap.containsKey(session);
	}
}
