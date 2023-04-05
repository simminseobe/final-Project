/**
 * 
 */
    	const result = [false, false, false];
    	// 아이디 유효성 검사
    	// 아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자
    	$("#memberId").on("change", function() {
    	    const memberId = $(this).val();
    	    console.log(memberId);
    	    const idReg =  /^[a-z]+[a-z0-9]{5,19}$/g;
    	    const inputId = $(this).val();
    	    const check = idReg.test(inputId);
    	    if(check) {
    	        $.ajax({
    	            url : "/checkId.do",
    	            type : 'get',
    	            data : {memberId:memberId},
    	            success : function(data) {
    	                if(data == "1") {
    	                    $("#idCheck").text("이미 사용중인 아이디 입니다.");
    	                    $("#idCheck").css("color", "red");
    	                } else if(data == "0"){
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
    	        result[0] = false;
    	    }
    	});

    	$("#idChkBtn").on("click", function() {
    		const memberId = $("#memberId").val();
    		if(memberId == "") {
    			alert("아이디를 입력하세요.");
    			return;
    		}
    		$("[name=checkId]").val(memberId);
    		window.open("", "checkId","left=700px,top=300px,width=300px,height=200px,menubar=no,status=no,scrollbars=yes");
    		
    		$("[name=checkIdFrm]").attr("target", "checkId");
    		$("[name=checkIdFrm]").submit();
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

    	// 이메일 인증
    	let mailCode;
    	$("#emailCheck").on("click", function() {
    	    $("this").hide();
    	    $("#check").show();
    	    const email = $("#memberEmail").val();
    	    console.log("이메일 : " + email);
    	    $.ajax({
    	        url : "/emailCheck.do",
    	        type : "POST",
    	        data : {email:email},
    	        success : function(data) {
    	        	alert("인증번호가 발송되었습니다.");
    	        	mailCode = data;
    	        	$("#email-time").text();
    	        	authTime();
    	        },
    	        error : function(data) {
    	            alert("인증번호 이메일 발송 실패");
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
    				result[3] = true;
    			} else {
    				$("#email-time").text("이메일 인증 실패");
    				$("#email-time").css("color", "red");
    				result[3] = false;
    			}
    		}
    	});
    	
    	function agreeAll() {
    		if($(".all-agree").is(":checked")) {
    			$("input[type=checkbox]").prop("checked", true);
    		} else {
    			$("input[type=checkbox]").prop("checked", false);
    		}
    	}
    	
    	$(".modal1").on("click", function() {
    		$(".wrap1").css("display", "flex");
    	});
    	
    	$("#reset1").on("click", function() {
    		$(".wrap1").css("display", "none");
    	});
    	
    	$(".modal2").on("click", function() {
    		$(".wrap2").css("display", "flex");
    	});
    	
    	$("#reset2").on("click", function() {
    		$(".wrap2").css("display", "none");
    	});
    	
    	$(".modal3").on("click", function() {
    		$(".wrap3").css("display", "flex");
    	});
    	
    	$("#reset3").on("click", function() {
    		$(".wrap3").css("display", "none");
    	});

		$("[type=submit]").on("click",function(e){
			if(!(result[0] && result[1] && result[2] && result[3] &&$("#agree-1").prop("checked") && $("#agree-4").prop("checked"))){
		        e.preventDefault();
		        alert("입력하신 정보를 확인하세요");        
			}
		});