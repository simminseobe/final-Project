<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/findId.css">
</head>
<body>
    <div class="wrapper">
        <div class="logo-wrap">
            <a href="/">
                <img src="/resources/images/common/logo.png" class="logo">
            </a>
        </div>
        <p class="findId-pw">
            아이디/비밀번호 찾기
        </p>
        <div class="nav-header">
            <ul class="tabs">
                <li class="active-tab last-tab" id="first-line">
                    아이디 찾기
                </li>
                <li id="second-line">
                    비밀번호 찾기
                </li>
            </ul>
        </div>
        <!-- 아이디 찾기 양식 -->
        <div class="tabcontent">
            <h2>간편찾기</h2>
            <div class="table-wrap">
                <table class="table">
                    <tbody>
                        <tr>
                            <th><label for="inputName">이름</label></th>
                            <td><input type="text" id="inputName" class="input-text" name="memberName" placeholder="이름" autocomplete="off"></td>
                        </tr>
                        <tr>
                            <th><label for="inputBirth">생년월일</label></th>
                            <td><input type="text" id="inputBirth" class="input-text" name="memberBirthYear" placeholder="생년월일 앞8자리"></td>
                        </tr>
                        <tr>
                            <th><label for="inputPhone">휴대폰번호</label></th>
                            <td><input type="text" id="inputPhone" class="input-text" name="memberPhone" placeholder="'-' 포함 입력" autocomplete="off"></td>
                        </tr>
                    </tbody>
                </table>
                <br>
            </div>
            <div>※ 아이디를 잊어버리신 경우 아이디 찾기를 진행해주시기 바랍니다.</div>
            <br>
            <div class="btn-member-button">
                <button type="button" id="idChkBtn" class="button">
                    <a href="#">아이디 찾기</a>
                </button>
            </div>
        </div>

        <!-- 비밀번호 찾기 양식 -->
        <div class="tabcontent">
            <h2>간편찾기</h2>
            <div class="table-wrap">
                <table class="table">
                    <tbody>
                        <tr>
                            <th><label for="inputId">아이디</label></th>
                            <td><input type="text" id="inputId" class="input-text" name="memberId" placeholder="아이디" autocomplete="off"></td>
                        </tr>
                        <tr>
                            <th><label for="inputName2">이름</label></th>
                            <td><input type="text" id="inputName2" class="input-text" name="memberName" placeholder="이름"></td>
                        </tr>
                        <tr>
                            <th><label for="inputEmail">이메일</label></th>
                            <td><input type="text" id="inputEmail" class="input-text" name="memberEmail" placeholder="이메일" autocomplete="off"></td>
                        </tr>
                    </tbody>
                </table>
                <br>
            </div>
            <div>※ 비밀번호를 잊어버리신 경우 비밀번호 찾기를 진행해주시기 바랍니다.</div>
            <br>
            <div class="btn-member-button">
                <button type="button" id="idChkBtn" class="button">
                    <a href="#">비밀번호 찾기</a>
                </button>
            </div>
        </div>
    </div>
	<script src="/resources/js/member/findId.js"></script>
</body>
</html>