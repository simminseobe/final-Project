<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="/resources/css/joinFrm.css">
</head>
<body>
	<div class="join-all-wrap">
		<div class="join-wrap">
			<div class="join-title">
				<h2>회원가입</h2>
			</div>
			<form action="/checkId.do" name="checkIdFrm">
			<input type="text" name="checkId">
			</form>
			
			<form action="/join.do" method="post">
				<div class="join-box">
					<table>
						<tr>
							<td>아이디 <sup>*</sup></td>
							<td><input type="text" name="memberId" id="memberId" class="inputBox" required autocomplete=off>
								<div class="comment" id="idCheck"></div>
								<button type="button" id="idChkBtn" class="btn bc2">중복체크</button></td>
						</tr>
						<tr>
							<td>비밀번호 <sup>*</sup></td>
							<td><input type="password" name="memberPw" class="inputBox" required autocomplete=off placeholder="8~16글자 영문/숫자/특수문자 최소 한가지씩 조합">
								<div class="comment" id="pwCheck"></div></td>
						</tr>
						<tr>
							<td>비밀번호확인 <sup>*</sup></td>
							<td><input type="password" name="memberPwCheck" class="inputBox" required autocomplete=off>
								<div class="comment" id="pwReCheck"></div></td>
						</tr>
						<tr>
							<td>이름 <sup>*</sup></td>
							<td><input type="text" name="memberName" class="inputBox" required autocomplete=off></td>
						</tr>
						<tr>
							<td>전화번호 <sup>*</sup></td>
							<td><input type="text" name="memberPhone" class="inputBox" required placeholder="예시 : 010-0000-0000" autocomplete=off></td>
						</tr>
                        <tr>
                            <td>생년월일 <sup>*</sup></td>
                            <td>
                                <select name="memberBirthYear" class="birthDay">
                                    <option>년도</option>
                                    <option value="1980">1980년</option>
                                    <option value="1981">1981년</option>
                                    <option value="1982">1982년</option>
                                    <option value="1983">1983년</option>
                                    <option value="1984">1984년</option>
                                    <option value="1985">1985년</option>
                                    <option value="1986">1986년</option>
                                    <option value="1987">1987년</option>
                                    <option value="1988">1988년</option>
                                    <option value="1989">1989년</option>
                                    <option value="1990">1990년</option>
                                    <option value="1991">1991년</option>
                                    <option value="1992">1992년</option>
                                    <option value="1993">1993년</option>
                                    <option value="1994">1994년</option>
                                    <option value="1995">1995년</option>
                                    <option value="1996">1996년</option>
                                    <option value="1997">1997년</option>
                                    <option value="1998">1998년</option>
                                    <option value="1999">1999년</option>
                                    <option value="2000">2000년</option>
                                </select>
                                <select name="memberBirthMonth" class="birthDay">
                                    <option>월</option>
                                    <option value="01">1월</option>
                                    <option value="02">2월</option>
                                    <option value="03">3월</option>
                                    <option value="04">4월</option>
                                    <option value="05">5월</option>
                                    <option value="06">6월</option>
                                    <option value="07">7월</option>
                                    <option value="08">8월</option>
                                    <option value="09">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                                <select name="memberBirthDay" class="birthDay">
                                    <option>일</option>
                                    <option value="01">1일</option>
                                    <option value="02">2일</option>
                                    <option value="04">4일</option>
                                    <option value="03">3일</option>
                                    <option value="05">5일</option>
                                    <option value="06">6일</option>
                                    <option value="07">7일</option>
                                    <option value="08">8일</option>
                                    <option value="09">9일</option>
                                    <option value="10">10일</option>
                                    <option value="11">11일</option>
                                    <option value="12">12일</option>
                                    <option value="13">13일</option>
                                    <option value="14">14일</option>
                                    <option value="15">15일</option>
                                    <option value="16">16일</option>
                                    <option value="17">17일</option>
                                    <option value="18">18일</option>
                                    <option value="19">19일</option>
                                    <option value="20">20일</option>
                                    <option value="21">21일</option>
                                    <option value="22">22일</option>
                                    <option value="23">23일</option>
                                    <option value="24">24일</option>
                                    <option value="25">25일</option>
                                    <option value="26">26일</option>
                                    <option value="27">27일</option>
                                    <option value="28">28일</option>
                                    <option value="29">29일</option>
                                    <option value="30">30일</option>
                                    <option value="31">31일</option>
                            </td>
                        </tr>
                        <tr>
                            <td>성별 <sup>*</sup></td>
                            <label for="memberGender"></label>
                            <td><input type="radio" id="male" name="memberGender" value="남자">남자
                            <input type="radio" id="female" name="memberGender" value="여자">여자</td>
                        </tr>
						<tr>
							<td>이메일인증 <sup>*</sup></td>
							<td>
                                <input type="text" name="memberEmail" id="memberEmail" class="inputBox" required placeholder="이메일 형식 : abc@naver.com" autocomplete=off>
                                <input type="text" name="checkEmail" id="checkEmail" class="inputBox" required placeholder="인증번호" autocomplete=off>						
                                <button type="button" class="email-check" id="emailCheck">이메일인증</button>
                                <button type="button" class="email-check" id="check" style="display:none;">확인</button>
							<div class="comment" id="email-time"></div>
							</td>
						</tr>
						<tr>
							<td>이용약관 <sup>*</sup></td>
							<td>
								<div class="agree-wrap">
									<div class="agree-box">
										<input type="checkbox" onclick="agreeAll();" id="all-agree"
											class="all-agree"> <label for="all-agree">선택포함 전체약관 동의</label>
									</div>
									<div class="agree-box" id="agreeBox">
										<input type="checkbox" id="agree-1" class="agreeCheck">
										<label for="agree-1">이용약관 동의(필수)</label> <span class="modal1">약관보기></span>

										<!-- 약관모달 -->
                                        <div class="agreeModal-wrap wrap1">
                                            <div class="agreeModal-1" >
                                                <div class="agreeModal-top">
                                                    <h3>이용약관 동의(필수)</h3>               
                                                </div>
                                                <div class="agreeModal-content">
                                                    <br>
                                                    <strong class="agreeModal-title">제1조 [목적]</strong>
                                                    <div class="content">
                                                        "본 약관은 MovieIsland(주)(이하 “회사”라 합니다)가 제공하는 온라인, 오프라인 서비스(이하 "서비스"라 합니다) 이용과 관련하여 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다."                                                   
                                                    </div>
                                                    <br>
                                                    <strong class="agreeModal-title">제2조 [약관의 효력 및 변경]</strong>
                                                    <div class="content">
                                                    <br>
														1. 본 약관은 서비스를 이용하고자 본 약관에 동의한 모든 회원에 대하여 그 효력을 발생합니다.
														2. 본 약관의 내용은 회원(서비스)가입 시 게재되거나 공지된 내용에 회원이 동의함으로써 그 효력이 발생합니다.
														3. 회사는 합리적인 사유가 발생될 경우 본 약관을 변경(수정 또는 개정)할 수 있으며, 약관을 개정할 경우 회사는 시행일 및 개정 사유를 명시하여 현행 약관과 함께 시행일로부터 최소 7일 전, 고객에게 불리하게 변경되거나 중요한 내용인 경우에는 최소 30일 전에 회사의 웹사이트 또는 전자메일 등을 통해 공지합니다.
														4. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후 탈퇴 요청을 하지 않을 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.
                                                    </div>
                                                    <br>
                                                    <strong class="agreeModal-title">제3조 [약관 외 준칙]</strong>
                                                    <div class="content">
                                                        <br>
														1. 본 약관에 명시되지 아니한 사항에 대해서는 전자상거래 등에서의 소비자보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 따릅니다.
														<br>
														2. 본 약관에 명시되지 않은 서비스에 대한 사항은 당사 홈페이지, 모바일 또는 영화관 현장을 통한 해당 서비스 공지사항에 따릅니다.
                                                    </div>
                                                    <strong class="agreeModal-title">제4조 [용어의 정의]</strong>
                                                    <div class="content">
														<br>
														본 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다.
														1. “사이트”: 회사가 재화•용역•정보를 회사에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화•용역을 거래할 수 있도록 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트(홈페이지, 모바일 웹/어플리케이션, SNS 등)를 말하며, 아울러 사이트를 운영하는 사업자의 의미로도 사용합니다.
														<br>
														2. "회원" : 본 약관을 인지하고, 본인인증절차를 거쳐 회사에 개인정보를 제공하여 회원으로서 등록하여 회사 아이디(ID)와 멤버십 카드를 부여 받은 자로서, 정상적으로 메가박스 서비스를 이용할 수 있는 권한을 부여 받은 고객을 말합니다.
														<br>
														3. "아이디" : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자나 숫자 혹은 그 조합을 말합니다(이하"ID"라 합니다).
														<br>
														4. "비밀번호" : 회원이 부여 받은 ID와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
														<br>
														5. "서비스" : 회사가 회원을 위하여 유료 또는 무료로 제공하는 행위 또는 그 행위 대상인 유, 무형의 물건 자체를 의미하며 온/오프라인에서 이루어지는 영화 관람, 포인트 적립, 사용, 할인, 이벤트 참여 등의 전반적인 고객 서비스 프로그램을 말합니다.
														<br>
														6. "멤버십 포인트" : 회사에서 재화/서비스 구매 시 적립/사용이 가능하도록 제공하는 포인트를 말합니다.
														<br>
														7. "이용중지" : 회사가 약관에 의거하여 회원의 서비스 이용을 제한하는 것을 말합니다.
														<br>
														8. "해지" : 회사 또는 회원이 서비스 사용 후 이용계약을 해약하는 것을 말합니다.
														<br>
														9. "휴면 회원" : 메가박스 서비스를 이용한 마지막 날로부터 연속하여 12개월간 이용 내역이 없는 회원을 말합니다.                                                    	
                                                    </div>
                                                </div>
                                                <div class="resetBtn">
                                                <button type="button" class="reset" id="reset1">확인</button>
                                                <!--<input type="reset" class="reset" id="reset" value="확인">-->
                                            </div>
                                            </div>
                                        </div>


									</div>
									<div class="agree-box" id="agreeBox">
										<input type="checkbox" id="agree-2" class="agreeCheck">
										<label for="agree-2">이벤트,혜택 알림 수신 동의(선택)</label>
									</div>
									<div class="agree-box" id="agreeBox">
										<input type="checkbox" id="agree-3" class="agreeCheck">
										<label for="agree-3">성별,생년 정보 제공 동의(선택)</label> <span class="modal2">약관보기></span>
									</div>
									
										<!-- 약관모달 -->
                                        <div class="agreeModal-wrap wrap2">
                                            <div class="agreeModal-1" >
                                                <div class="agreeModal-top">
                                                    <h3>성별,생년 정보 제공 동의(선택)</h3>               
                                                </div>
                                                <div class="agreeModal-content">
                                                    <br>
                                                    <strong class="agreeModal-title">개인정보 수집 이용 목적</strong>
                                                    <div class="content">
														신규 서비스 개발 및 마케팅에의 활용. 신규 서비스 개발, 통계학적 특성, 이용 형태 등에 따른 맞춤형 서비스 제공, 광고 게재, 이벤트 참여기회 제공, 접속빈도 파악, 회원의 서비스 이용에 대한 통계                                                        
                                                    </div>
                                                    <br>
                                                    <strong class="agreeModal-title">선택 수집 항목 </strong>
                                                    <div class="content">
                                                      	  생년, 성별
                                                    </div>
                                                    <br>
                                                    <strong class="agreeModal-title">이용 보유 기간</strong>
                                                    <div class="content">
                                                    	탈퇴시 즉시 파기
                                                    </div>
                                                    <br>
                                                  		자세한 내용은 개인정보 처리방침을 참고하시기 바랍니다.
                                                </div>
                                                <div class="resetBtn">
                                                <button type="button" class="reset" id="reset2">확인</button>
                                                <!--<input type="reset" class="reset" id="reset" value="확인">-->
                                            </div>
                                            </div>
                                        </div>

									<div class="agree-box" id="agreeBox">
										<input type="checkbox" id="agree-4" class="agreeCheck">
										<label for="agree-4">개인 정보 수집 및 이용 동의(필수)</label> <span class="modal3">약관보기></span>
									</div>
									
										<!-- 약관모달 -->
                                        <div class="agreeModal-wrap wrap3">
                                            <div class="agreeModal-1" >
                                                <div class="agreeModal-top">
                                                    <h3>개인정보 수집 및 이용 동의 (필수)</h3>               
                                                </div>
                                                <div class="agreeModal-content">
                                                    <br>
                                                    <strong class="agreeModal-title">수집 목적</strong>
                                                    <div class="content">
														회원 가입의사 확인, 이용자 식별 및 본인여부, 회원자격 유지·관리, 계약 이행 및 약관변경 등의 고지를 위한 연락, 본인의사 확인 및 민원 등의 고객 고충 처리, 부정이용 방지, 비인가 사용방지 및 서비스 제공 및 계약의 이행, 서비스 이용 및 상담, 문의, 후기 등 원활한 의사소통 경로 확보, 맞춤형 회원 서비스 제공, 거점 기반 서비스 제공                                                        
                                                    <br>
                                                        	서비스방문 및 이용기록 분석, 부정이용 방지 등을 위한 기록 관리
                                                    </div>
                                                    <br>
                                                    <strong class="agreeModal-title">수집 항목</strong>
                                                    <div class="content">
                                                        - 이름, 아이디, 비밀번호, 휴대폰번호, 이메일, 주소
                                                        - 서비스 이용기록, IP주소, 쿠키, MAC주소, 모바일 기기정보(앱 버전, OS 버전), ADID/IDFA(광고식별자)
                                                    </div>
                                                    <br>
                                                    <strong class="agreeModal-title">보유 기간</strong>
                                                    <div class="content">
                                                        - 회원탈퇴 시 즉시 파기
                                                        - 부정이용 방지를 위하여 30일 동안 보관 (아이디, 휴대폰 번호) 후 파기 
                                                        - 회원 탈퇴 즉시 또는 이용 목적 달성 즉시 파기
                                                    </div>
                                                    <br>
														※ 단, 회원 탈퇴와 별개로 분쟁 조정, 고객문의 대응 및 법령 준수 이력 증빙을 위하여 이메일, 문자, 알림톡 발송이력은 발송일로부터 6개월 보관(이름, 아이디, 휴대폰 번호, 이메일) 후 파기합니다.
                                                    <br>
                                                    	※ 서비스 제공을 위해서 필요한 최소한의 개인정보입니다. 동의를 해 주셔야 서비스를 이용하실 수 있으며, 동의하지 않으실 경우 서비스에 제한이 있을 수 있습니다.
                                                </div>
                                                <div class="resetBtn">
                                                <button type="button" class="reset" id="reset3">확인</button>
                                                <!--<input type="reset" class="reset" id="reset" value="확인">-->
                                            </div>
                                            </div>
                                        </div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="btn-box">
					<button type="submit" id="join-btn">가입하기</button>
				</div>
			</form>
		</div>
	</div>

    <script>
    	const result = [false, false, false, false, false, false];
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
    	$("[name=memberPw]").on("change", function() {
    	    const pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    	    const inputPw = $(this).val();
    	    const check = pwReg.test(inputPw);
    	    if(check) {
    	        $("#pwCheck").text("비밀번호가 일치합니다.");
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
    	    const pwInput = $("[name=memberPwCheck]").val();
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
    	        type : "get",
    	        data : {email:email},
    	        success : function(data) {
    	            if(data == "null") {
    	                alert("이메일 주소를 확인하세요.");
    	            } else {
    	                mailCode = data;
    	                $("#email-time").text();
    	                authTime();
    	                alert("인증번호가 전송되었습니다.");
    	            }
    	        },
    	        error : function() {
    	            console.log("에러발생");
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
    			$("#email-time").text("");
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
    	
    	
    	
    </script>
</body>
</html>