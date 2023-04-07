/**
 * 
 */

$(".tabs>li").on("click", function() {
    $(".tabs>li").removeClass("active-tab");
    $(this).addClass("active-tab");
    const content = $(".tabcontent");
    content.hide();
    
    const index = $(".tabs>li").index(this);
    content.eq(index).show();
});

$(".tabs>li").eq(0).click();

// 아이디 찾기 버튼 누를 시 모달창(id정보) 띄우기
$("#idChkBtn").on("click", function() {
    const memberName = $("#inputName").val();
    const memberPhone = $("[name=memberPhone]").val();

    $.ajax({
        url : "/findId.do",
        type : "post",
        data : {memberName:memberName, memberPhone:memberPhone},
        success : function(data) {
            // console.log(data);
            // data가 넘어올때 해당 데이터 모달창에 출력
            if(data != null){
                $("#findId").text(data.memberId);
                $("#instDate").text(data.enrollDate);
                $("#modal").show();
            }else{
                // data가 넘어오지 않을 때 모달 창 처리
                // 모달하나 더 만들어서 처리하기
            }
        },
        error: function() {
            console.log("에러발생");
        }
    }); 
});

// 비밀번호 찾기 버튼 클릭 시 모달창(pw정보) 띄우기
$("#pwChkBtn").on("click", function() {
    const memberId = $("#inputId").val();
    const memberName = $("#inputName2").val();
    const memberEmail = $("#inputEmail").val();

    $.ajax({
        url : "/findPw.do",
        type : "post",
        data : {memberId:memberId, memberName:memberName, memberEmail:memberEmail},
        success : function(data) {
            console.log(data)
            if(data != null) {
                $("#findPw").text(data.memberPw);
                $("#modal_two").show();
            }
        }, 
        error : function() {
            console.log("에러발생");
        }
    });
});

function closeClick() {
    location.href="/findIdFrm.do";
}