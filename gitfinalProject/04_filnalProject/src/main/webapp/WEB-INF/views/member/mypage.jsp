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
	<input type="text" name="memberNo" value=${sessionScope.m.memberNo }>
	<div>잔여포인트:${point.memberPoint }</div>
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
	<div>관람권등록 <input type="text" name="addGiftTicketSerial"><button id="addGiftTicket">클릭</button></div>
	<div>관람권사용 <input type="text" name="useGiftTicketSerial"><button id="useGiftTicket">클릭</button></div>
	<div>문의내역</div>
	
</div>
	
	
</div>
</td>
</table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
   $("#addGiftTicket").on("click",function(){
    	const giftTicketSerial = $("[name=addGiftTicketSerial]").val();
    	const memberNo = $("[name=memberNo]").val();
    	console.log(memberNo);
		$.ajax({
			url : "/addGiftTicket.do",
			type: "get",
			data: {giftTicketSerial:giftTicketSerial , memberNo:memberNo},
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
   
   $("#useGiftTicket").on("click",function(){
   	const giftTicketSerial = $("[name=useGiftTicketSerial]").val();
   	const memberNo = $("[name=memberNo]").val();
   	console.log(memberNo);
		$.ajax({
			url : "/useGiftTicket.do",
			type: "get",
			data: {giftTicketSerial:giftTicketSerial , memberNo:memberNo},
			success : function(data){
				console.log(data)
				if(data=="ok"){
					alert("사용성공.");
				}else{
					alert("사용실패.");
				}
				
			}
			
		});	
	});
   
   $(document).ready(function(){
	   
	   
	});
   
</script>
</head>
<body>
   

