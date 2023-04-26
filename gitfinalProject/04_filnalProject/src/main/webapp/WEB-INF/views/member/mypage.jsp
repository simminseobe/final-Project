<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>

	
	
</style>
<div class="table-wrap">
<table class="table">
<td>
<div class="menubar">
<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
</div>
</td>
<td width="700px">
<div class="content-wrap">
<div class="content">

	<div>이름: ${sessionScope.m.memberName }</div>
	<div>잔여포인트: </div>
	<div>등급: ${sessionScope.m.memberLevel }</div>
	<div>다음 Gold 등급까지 6000P</div>
	<div>적립예정: </div>
	<div>당월소멸예정: </div>
	<div>이용내역: </div>
	<div>관람권 및 쿠폰: </div>
	<div>나의 무비스토리</div>
	<div>본영화: </div>
	<div>관람평: </div>
	<div>보고싶어: </div>
	<div>무비포스트: </div>
	<div>관람권등록 <input type="text" name="ticketSerial"><button id="addGiftTicket"><a href="/addGiftTicket.do">클릭</a></button></div>
	<div>문의내역</div>
	
</div>
	
	
</div>
</td>
</table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</script>
</head>
<body>
    <script>
    $("#addGiftTicket").on("click",function(){
    	const ticketSerial = $("[name=ticketSerial]").val();
		$.ajax({
			url : "/addGiftTicket.do",
			type: "get",
			data: {ticketSerial:ticketSerial},
			success : function(data){
				console.log(data)
				if(data=="ok"){
					alert("등록에 성공하였습니다.");
				}else{
					alert("이미 등록된 관람권입니다.");
				}
				
			}
			
		});	
	});

