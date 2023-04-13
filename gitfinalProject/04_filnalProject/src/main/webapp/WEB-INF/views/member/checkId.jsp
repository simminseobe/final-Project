<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="/resources/css/checkId.css">
</head>
<body>

	<div id="idCheck">
		<c:choose>
			<c:when test="${empty data }">
				<div class="first-div">
					[<span class="join-text">${checkId }</span>] 는 사용 가능한 아이디입니다.
				</div>
				<br><br>
                <div class="btn-wrap">
                    <button type="button" class="close-button" id="closeBtn">닫기</button>
                </div>
			</c:when>
			<c:otherwise>
			<div class="second-div">
				[<span class="join-text">${checkId }</span>] 는 이미 사용중인 아이디입니다.
				<br><br>
				<form action="/checkId.do" method="post">
					<div class="id-wrap">
						<input type="text" name="checkId" class="input-box">
						<button type="submit" class="">조회</button>
					</div>
				</form>
			</div>
			</c:otherwise>
		</c:choose>
	</div>

	<script>
		$("#closeBtn").on("click", function() {
			const checkId = $(".join-text").text();
			const inputId = $("#inputId", opener.document);
			inputId.val(checkId);
			self.close();
		});
	</script>
</body>
</html>