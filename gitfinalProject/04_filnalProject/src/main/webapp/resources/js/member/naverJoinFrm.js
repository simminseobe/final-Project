/**
 * 
 */

const result = [false];

$("[name=memberName]").on("change", function() {
    const nameReg = /^[가-힣]{2,4}$/;;
    const inputName = $(this).val();
    const regTest = nameReg.test(inputName);
    if(regTest) {
        $("#nameCheck").text("");
        $("#nameCheck").css("color", "green");
        result[0] = true;
    } else {
        $("#nameCheck").text("이름을 올바르게 입력해주세요.");
        $("#nameCheck").css("color", "red");
        result[0] = false;
    }
});

// 이용약관 전체
$(document).ready(function() {
	$("#allAgreement").click(function() {
		if($("#allAgreement").is(":checked")) {
            $("input[type=checkbox]").prop("checked", true);
        }else {
            $("input[type=checkbox]").prop("checked", false);
        }
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) $("#allAgreement").prop("checked", false);
		else $("#allAgreement").prop("checked", true); 
	});
});

$("[type=submit]").on("click",function(e){
    if(!(result[0] && $("#privacyAgreement").prop("checked") && $("#optionalAgreement").prop("checked"))){
        e.preventDefault();
        $("#modal").show();
    }
});

function closeClick() {
   	$("#modal").hide();
}

function okClose() {
    $("#modal").hide();
}