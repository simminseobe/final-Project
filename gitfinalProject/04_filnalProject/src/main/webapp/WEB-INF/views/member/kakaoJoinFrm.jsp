<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
	<!-- 아이디(email 대체), 이름(nickname 대체), 전화번호,  생년월일, 성별, 이메일(?)-->
		<table>
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="memberId" value="${m.email }">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="memberId" value="${m.nickname }">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>