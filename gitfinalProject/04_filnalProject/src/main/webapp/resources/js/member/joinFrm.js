/**
 * 
 */

 const result = [false, false, false, false, false, false];

// 아이디 중복체크 버튼
// 아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자
$("#idChkBtn").on("click", function() {
    const memberId = $("[name=memberId]").val();
    if(memberId == "") {
        alert("아이디를 입력하세요.");
        return;
    } else {
        const idReg =  /^[a-z]+[a-z0-9]{5,19}$/g
        const checkResult = idReg.test(memberId);
        if(checkResult) {
            $.ajax({
                url:"/dupIdChk.do",
                type:"post",
                data:{memberId:memberId},
                success: function(data) {
                    if(data != null) {
                        $("#findId>span").text(data.memberId);
                        $("#findId").show();
                        $("#instDate").hide();
                        $("#modal").show()
                        $("#idCheck").text("이미 사용중인 아이디 입니다.");
                        $("#idCheck").css("color", "red");                        
                        result[0] = false; 
                    } else {
                        $("#instDate>span").text(memberId);
                        $("#findId").hide();
                        $("#instDate").show();
                        $("#modal").show();
                        $("#idCheck").text("사용 가능한 아이디입니다.");
                        $("#idCheck").css("color", "green");
                        result[0] = true;
                    }
                },
                error : function() {
                    console.log("에러발생");
                }
            });
        } else {
            $("#idCheck").text("아이디는 영문자/숫자로 6~20글자");
            $("#idCheck").css("color", "red");
        }
    }
});

function closeClick() {
    $("#modal").hide();
    $("#modal-two").hide();
}

function okClose() {
    $("#modal").hide();
    $("#modal-two").hide();
}

$("#buttonOk").on("click", function() {
    $("#modal").hide();
});

// 비밀번호 유효성 검사
// 8~16 글자 영문,숫자,특수문자 최소 한가지씩 조합
$("[name=memberPw]").on("keyup", function() {
    const pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    const inputPw = $(this).val();
    const check = pwReg.test(inputPw);
    if(check) {
        $("#pwCheck").text("");
        $("#pwCheck").css("color", "green");
        result[1] = true;
    } else {
        $("#pwCheck").text("비밀번호는 8~16글자 영문/숫자/특수문자를 최소 한가지씩 조합");
        $("#pwCheck").css("color", "red");
        result[1] = false;
    }
});

// 비밀번호 중복체크
$("[name=memberPwCheck]").on("change", function() {
    const pwInput = $("[name=memberPw]").val();
    if($(this).val() == pwInput) {
        $("#pwReCheck").text("비밀번호가 일치합니다.");
        $("#pwReCheck").css("color", "green");
        result[2] = true;
    } else {
        $("#pwReCheck").text("비밀번호가 일치하지 않습니다.");
        $("#pwReCheck").css("color", "red");
        result[2] = false;
    }
});

// 이름 정규표현식
// 한글 이름 2~5 자 이내
$("[name=memberName]").on("keyup", function() {
    const nameReg = /^[가-힣]{2,4}$/;
    const inputName = $(this).val();
    const check = nameReg.test(inputName);
    if(check) {
        $("#nameCheck").text("");
        $("#nameCheck").css("color", "green");
        result[3] = true;
    } else {
        $("#nameCheck").text("한글만 입력해주세요.");
        $("#nameCheck").css("color", "red");
        result[3] = false;
    }
});

// 휴대폰번호 정규표현식
$("[name=memberPhone]").on("change", function() {
    const phoneReg = /^\d{3}\d{3,4}\d{4}$/;
    const inputPhone = $(this).val();
    const check = phoneReg.test(inputPhone);
    if(check) {
        $("#phoneCheck").text("");
        $("#phoneCheck").css("color", "green");
        result[4] = true;
    } else {
        $("#phoneCheck").text("휴대폰 번호를 입력해주세요.");
        $("#phoneCheck").css("color", "red");
        result[4] = true;
    }
});

// 이메일 인증
let mailCode;
$("#emailCheck").on("click", function() {
    $("this").hide();
    $("#check").show();
    const email = $("#inputEmail").val();
    $.ajax({
        url : "/emailCheck.do",
        type : "POST",
        data : {email:email},
        success : function(data) {
            mailCode = data;
            $("#modal-two").show();
            $("#email-time").text();
            $("#emailCheck").hide();
            authTime();
        },
        error : function() {          
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
            result[5] = true;
        } else {
            $("#email-time").text("이메일 인증 실패");
            $("#email-time").css("color", "red");
            result[5] = false;
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
    if(!(result[0] && result[1] && result[2] && result[3] && result[4] && result[5] && $("#privacyAgreement").prop("checked") && $("#optionalAgreement").prop("checked"))){
        e.preventDefault();
        alert("필수입력사항을 작성해주세요.");
    }
});