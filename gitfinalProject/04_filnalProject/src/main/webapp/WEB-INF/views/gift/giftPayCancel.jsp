<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <h1>결제취소</h1>
    <script>
        const successPay = $('#successPay', opener.document)
        const successPayButton = $('#successPayButton', opener.document)
        successPay.val('${data}')
        successPayButton.click()
        self.close()
    </script>
</body>
</html>