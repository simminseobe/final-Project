<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crawl Result</title>
</head>
<body>
	<h1>${title}</h1>
    <ul>
        <c:forEach var="link" items="${links}">
            <li>${link}</li>
        </c:forEach>
    </ul>
    <p>${elementText}</p>
</body>
</html>