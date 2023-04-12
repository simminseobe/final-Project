<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/changeNewPw.css">
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<form action="/updatePw.do" method="post">
	<div class="content">
		<div class="content-header">
			<h2>비밀번호 변경</h2>
		</div>
		<ul class="support">
			<li>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요</li>
		</ul>
		<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
		<table class="table-wrap">
			<tr>
				<th>
					<label for="currentPw">현재 비밀번호</label>
				</th>
				<td>
					<input type="password" name="memberPw" id="currentPw" class="input-text">
					<span id="comment"></span>
				</td>
			</tr>
			<tr>
				<th>
					<label for="newPw">새 비밀번호</label>
				</th>
				<td>
					<input type="password" name="newPassword" id="newPw" class="input-text"> &nbsp<span>※ 영문, 숫자, 특수문자 중 2가지 이상 조합하여 10자리 이상으로 입력해 주세요. </span>
					<span id="comment"></span>
				</td>
			</tr>
 			<tr>
				<th>
					<label for="reNewPw">새 비밀번호 재입력</label>
				</th>
				<td>
					<input type="password" name="newPassword" id="newPw" class="input-text"> &nbsp<span>※ 비밀번호 확인을 위해 한 번 더 입력해 주시기 바랍니다. </span>
					<span id="comment"></span>
				</td> 
			</tr>
		</table>
		<ul class="support">
			<li>생년월일, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</li>
			<li>비밀번호는 3-6개월마다 꼭 바꿔 주세요.</li>
			<li>비밀번호 변경 시 모바일 기기와 홈페이지에서 모두 로그아웃 됩니다. 변경한 비밀번호로 다시 로그인해주세요.</li>
			<li>비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ & * + = - ? _ 입니다.</li>
		</ul>
		<div class="btn-wrap">
			<button type="button" id="cancelBtn">취소</button>
			<input type="submit" id="updateBtn" value="수정">
		</div>
	</div>
	</form>
	
	<script>
		$("#cancelBtn").on("click", function() {
			location.replace: "/";
		});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>