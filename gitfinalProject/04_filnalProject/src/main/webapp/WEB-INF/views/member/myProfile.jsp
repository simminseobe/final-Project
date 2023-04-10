<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/mypage.css">
<link rel="stylesheet" href="/resources/css/member/myProfile.css">
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

 <div class="menu">
        <ul class="main-menu">
            <li id="myBox"><a href="#">나의 메가박스</a></li>
            <li><a href="#">예매/구매내역</a></li>
            <li>
                <a href="#">영화/스토어 관람권</a>
                <ul class="sub-menu">
                    <li><a href="#">• 영화관람권</a></li>
                    <li><a href="#">• 스토어 교환권</a></li>
                </ul>
            </li>
            <li><a href="#">메가박스 쿠폰</a></li>
           <li><a href="#">멤버십 포인트</a></li>
           <li><a href="#">나의 무비스토리</a></li>
           <li><a href="#">나의 이벤트 응모내역</a></li>
           <li><a href="#">나의 문의내역</a></li>
             <li>
                <a href="#">회원정보</a>
                <ul class="sub-menu">
                    <li><a href="/myProfile.do">• 개인정보 수정</a></li>
                    <li><a href="#">• 선택정보 수정</a></li>
                </ul>
            </li>
        </ul>
    </div>

	<div class="wrapper">
	    <form action="/updateMember.do" method="post" enctype="multipart/form-data">
        <div class="mypage-wrap">
            <div class="mypage-header">
                <h2>개인정보 수정</h2>
                <ul class="info">
                    <li>※ 회원님의 정보를 정확히 입력해주세요.</li>
                </ul>
            </div>
            <div class="table-wrap">
                <table class="profile-content">
                    <tbody>
                        <tr>
                            <th>프로필 사진</th>
                            <td>
                                <div class="profile-title">
                                    <input type="file" id="profile-file" name="profile">
                                    <img src="/resources/images/member/my-profile.png" class="img" width="68px" height="68px">
                                    <button type="button" id="addImgBtn" onclick="fileUpload();">이미지 등록</button>
                                    <div>
	                                    <a href="/deleteFrm.do" id="deleteMember">회원탈퇴</a>
                                    </div>
                                    <p class="comment">※ 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" class="input-text" name="memberId" value="${sessionScope.m.memberId}" readonly>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="left">
	                <h2>기본정보</h2>
	            </div>
                <div class="right">
                    <p class="profile-essential"><sup>*</sup>필수</p>
                </div>
                
                <table class="profile-content">
                    <tbody>
                        <tr>
                            <th>이름<sup> *</sup></th>
                            <td>
                                <input type="text" class="input-text" name="memberName" value="${sessionScope.m.memberName}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>생년월일<sup> *</sup></th>
                            <td>
								<%-- <select>
									<option readonly>${sessionScope.m.memberBirthYear } 년</option>
								</select>
								<select>
									<option readonly>${sessionScope.m.memberBirthMonth } 월</option>
								</select>
								<select>
									<option readonly>${sessionScope.m.memberBirthDay } 일</option>
								</select> --%>
								
								<input type="text" class="input-birth" value="${sessionScope.m.memberBirthYear }"><input type="text" class="input-birthDetail" value="년">
								<input type="text" class="input-birth" value="${sessionScope.m.memberBirthMonth }"><input type="text" class="input-birthDetail" value="월">
								<input type="text" class="input-birth" value="${sessionScope.m.memberBirthDay }"><input type="text" class="input-birthDetail" value="일">
								
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰<sup> *</sup></th>
                            <td>
                                <input type="text" class="change-input-text" name="memberPhone" value="${sessionScope.m.memberPhone}" minlength="11" maxlength="13">
                            </td>
                        </tr>
                        <tr>
                            <th>이메일<sup> *</sup></th>
                            <td>
                                <input type="text" class="change-input-text" name="memberEmail" value="${sessionScope.m.memberEmail}">
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호<sup> *</sup></th>
                            <td>
                                <button id="changePw">비밀번호 변경</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn-wrap">
                <button type="button" id="cancelBtn">취소</button>
                <input type="submit" value="등록" id="enrollBtn"></input>
            </div>
        </div>
    </form>
   </div>
   
   <script src="/resources/js/member/myProfile.js"></script>
   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>