<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="css/mypageView.css?v=2">
</head>
<body>
	<!-- 헤더 JSP 포함 -->
	<jsp:include page="./views/header.jsp"></jsp:include>

	<div class="mypage-container">
		<h1>마이페이지</h1>

		<!-- 사용자 정보 -->
		<div class="user-info-section">
			<div class="user-info-item">
				이름 <span>${user.userName}</span>
			</div>
			<div class="user-info-item">
				아이디 <span>${user.loginId}</span>
			</div>
			<div class="user-info-item">
				닉네임 <span>${user.nickName}</span>
			</div>
			<div class="user-info-item">
			
				이메일 <span>${user.userEmail}</span>
			</div>
		</div>

		<!-- 게시물 카테고리별 작성 수 -->
		<div class="user-posts">
			<h2>내 게시물</h2>
			<table class="posts-table">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>작성 게시물 수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="category" items="${categoryCounts}">
						<tr>
							<td>${category.categoryName}</td>
							<td>${category.postCount}</td>
						</tr>
					</c:forEach>
					<c:if test="${empty categoryCounts}">
						<tr>
							<td colspan="2">작성한 게시물이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<!-- 버튼 -->
		<div class="form-buttons">
			<button class="edit-button" onclick="location.href='updateUserView.do'">정보 수정</button>
			
		</div>
	</div>
	<jsp:include page="./views/footer.jsp"></jsp:include>
</body>
</html>
