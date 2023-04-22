/**
 * 
 */

const result = [false, false];

$("#phone").on("change", function() {
    const phoneReg = /^\d{3}\d{3,4}\d{4}$/;
    const inputPhone = $(this).val();
    const regTest = phoneReg.test(inputPhone);
    if(regTest) {
        $("#phoneCheck").text("");
        $("#phoneCheck").css("color", "green");
        result[0] = true;
    } else {
        $("#phoneCheck").text("휴대폰 번호를 올바르게 입력해주세요.");
        $("#phoneCheck").css("color", "red");
        result[1] = false;
    }
});

let mailCode;
$("#emailCheck").on("click", function() {
    $(this).hide();
    $("#check").show();
    const email = $("[name=memberEmail]").val();
    $.ajax({
        url : "/emailCheck.do",
        type : "POST",
        data : {email:email},
        success : function(data){
            // 모달 창 띄우기
            $("#modal").show();
            mailCode = data;
            $("email-time").text();
            authTime();
        },
        error : function() {
            // 모달창 띄우기
            $("#modal-two").show();
        }
    });
});

// 이메일 인증 시간 설정 - 1 
let intervalId;
function authTime() {
    $("#email-time").html("<span id='min'>3</span> : <span id='sec'>00</span>");
    intervalId = window.setInterval(function() {
        timeCount();
    }, 1000);
}

// 이메일 인증 시간 설정 - 2
function timeCount() {
    const min = $("#min").text();
    const sec = $("#sec").text();
    if(sec == "00") {
        if(min != "0") {
            const newMin = Number(min) - 1;
            $("#min").text(newMin);
            $("#sec").text(59);
        } else {
            window.clearInterval(intervalId);
            mailCode = null;
            $("#email-time").text("인증 시간 만료");
            $("#email-time").css("color", "red");
        }
    } else {
        const newSec = Number(sec) - 1;
        if(newSec < 10) {
            $("#sec").text("0"+newSec);
        } else {
            $("#sec").text(newSec);
        }
    }
}

// 인증버튼 클릭
$("#check").on("click", function() {
    if(mailCode == null) {
        $("#email-time").text("test");
        $("#email-time").css("color", "red");
    } else {
        const checkEmail = $("#checkEmail").val();
        if(checkEmail == mailCode) {
            $("#email-time").prop("readonly", true);
            $("#email-time").text("이메일 인증 완료");
            $("#email-time").css("color", "green");
            clearInterval(intervalId);
            result[1] = true;
        } else {
            $("#email-time").text("이메일 인증 실패");
            $("#email-time").css("color", "red");
            result[1] = false;
        }
    }
});

// 이용약관 전체
$(document).ready(function() {
	$("#allAgreement").click(function() {
		if($("#allAgreement").is(":checked")) 
        $("input[type=checkbox]").prop("checked", true);
		else $("input[type=checkbox]").prop("checked", false);
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) $("#allAgreement").prop("checked", false);
		else $("#allAgreement").prop("checked", true); 
	});
});

$("[type=submit]").on("click",function(e){
    if(!(result[0] && result[1] && $("#privacyAgreement").prop("checked") && $("#optionalAgreement").prop("checked"))){
        e.preventDefault();
        alert("필수입력사항을 작성해주세요.");
    }
});

function closeClick() {
   	$("#modal").hide();
}

function okClose() {
    $("#modal").hide();
    $("#modal-two").hide();
}