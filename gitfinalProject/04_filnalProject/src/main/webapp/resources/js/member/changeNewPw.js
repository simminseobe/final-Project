/**
 * 
 */

const result = [false, false];

// 8~16 글자 영문,숫자,특수문자 최소 한가지씩 조합
$("[name=memberPw]").on("change", function() {
    const pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    const inputPw = $(this).val();
    const check = pwReg.test(inputPw);
    if(check) {
        $("#password-comment").text("");
        $("#password-comment").css("color", "green");
        result[0] = true;
    } else {
        $("#password-comment").text("비밀번호는 8~16글자 영문/숫자/특수문자를 최소 한가지씩 조합");
        $("#password-comment").css("color", "red");
        result[0] = false;
    }
});

// 비밀번호 중복체크
$("[name=newPassword]").on("change", function() {
    const pwInput = $("[name=memberPw]").val();
    if($(this).val() == pwInput) {
        $("#rePassword-comment").text("비밀번호가 일치합니다.");
        $("#rePassword-comment").css("color", "green");
        result[1] = true;
    } else {
        $("#rePassword-comment").text("비밀번호가 일치하지 않습니다.");
        $("#rePassword-comment").css("color", "red");
        result[1] = false;
    }
});

$("[type=submit]").on("click",function(e){
    if(!(result[0] && result[1])){
        e.preventDefault();
        alert("비밀번호를 확인해주세요.");
    }
});

$("#cancelBtn").on("click", function() {
    location.href="/";
});