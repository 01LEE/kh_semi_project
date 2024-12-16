<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정</title>
<link rel="stylesheet" type="text/css" href="css/updateUser.css?v=2"">
</head>
<body>
	<jsp:include page="./views/header.jsp"></jsp:include>
	<div class="mypage-container">
		<h1>정보 수정</h1>
		<form action="./updateUser.do" method="post">
			<!-- 아이디와 이름 -->
			<div class="form-group inline-group">
				<label>아이디 <input type="text" name="loginId"
					value="${user.loginId}" readonly>
				</label> <label>이름 <input type="text" name="userName"
					value="${user.userName}" readonly>
				</label>
			</div>

			<!-- 닉네임 -->
			<div class="form-group">

				<label>닉네임</label>
				<div class="inline-input">
					<input type="hidden" id="originalNickname" value="${user.nickName}">
					<input type="text" id="nickname" name="nickName"
						value="${user.nickName}">
					<button type="button" id="checkNicknameBtn" class="blue-button">중복
						확인</button>
				</div>
				<p id="nicknameMessage" class="message"></p>
			</div>


			<!-- 비밀번호 -->
			<div class="form-group">
			    <label>비밀번호</label>
			    <input type="password" name="currentPassword" placeholder="현재 비밀번호" style="margin-bottom: 2px;">
			    <c:if test="${not empty passwordError}">
			        <span class="message error" style="display: block; margin-top: 0;">${passwordError}</span>
			    </c:if>
			    <input type="password" id="newPassword" name="newPassword" placeholder="새 비밀번호">
			    <input type="password" id="confirmPassword" name="confirmNewPassword" placeholder="새 비밀번호 확인">
			    <p id="passwordMatchMessage" class="message"></p>
			</div>


			<!-- 이메일 -->
			<div class="form-group">
				<label>이메일</label>
				<div class="inline-input email-container">
					<!-- 이메일 입력 -->
					<input type="hidden" id="originalEmail" value="${user.userEmail}">
					<input type="text" id="emailLocal" name="emailLocal"
						value="${fn:substringBefore(user.userEmail, '@')}"> <span>@</span>
					<select name="emailDomain" id="emailDomain">
						<option value="${fn:substringAfter(user.userEmail, '@')}" selected>
							${fn:substringAfter(user.userEmail, '@')}</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="icloud.com">icloud.com</option>
						<option value="custom">직접 입력</option>
					</select>
					<!-- 중복 확인 버튼 -->
					<button type="button" id="checkEmailBtn" class="blue-button">중복
						확인</button>
				</div>

				<!-- 사용자 입력 시 직접 도메인 입력 필드 -->
				<div id="customDomainContainer" class="custom-domain"
					style="display: none;">
					<input type="text" id="customDomain" name="customDomain"
						placeholder="도메인 입력">
				</div>
				<p id="emailMessage" class="message"></p>
			</div>

			<!-- 수정 및 취소 버튼 -->
			<div class="form-buttons">
				<button type="submit" class="blue-button">수정</button>
				<button type="button" onclick="location.href='mypageView.do';"
					class="cancel-button">취소</button>
			</div>
		</form>
	</div>
	<jsp:include page="./views/footer.jsp"></jsp:include>
	<script src="script/updateUser.js"></script>
</body>
</html>
