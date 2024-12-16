<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Region List</title>
<style>
/* 이미지가 가로로 배치되도록 flex 사용 */
.image-container {
	display: flex;
	flex-wrap: wrap; /* 여러 줄로 넘어가도록 설정 */
	gap: 20px; /* 이미지 간의 간격을 20px로 설정 */
}

.image-item {
	width: 30%; /* 한 줄에 3개씩 배치 */
	text-align: center; /* 이미지 중앙 정렬 */
}

img {
	width: 100%; /* 이미지 크기 100%로 조정 */
	height: auto; /* 비율에 맞게 높이 자동 조정 */
	border-radius: 8px; /* 이미지 모서리 둥글게 */
}
</style>
</head>
<body>
	<!-- 공통 헤더 -->
	<jsp:include page="header.jsp" />
	<h1>Region List</h1>
	<c:if test="${sessionScope.user != null}">
		<c:set var="user" value="${sessionScope.user}" />
		<c:if test="${user.grade == 'admin'}">
			<!-- 관리자가 아니면 버튼 표시 안됨 -->
			<a href="./RegionWriteView.do"><button>글 쓰기</button></a>
		</c:if>
	</c:if>
	
		<c:if test="${sessionScope.user != null}">
		<c:set var="user" value="${sessionScope.user}" />
		<c:if test="${user.grade == 'admin'}">
			<!-- 관리자가 아니면 버튼 표시 안됨 -->
			<a href="./admin.jsp"><button>admin</button></a>
		</c:if>
	</c:if>
	
	
	<div class="image-container">
		<c:forEach var="region" items="${regionList}">
			<div class="image-item">
				<p>${region.title}</p>
				<a href="./regionDetail.do?regionNumber=${region.regionNumber}">
					<img src="${region.imageUrl}" alt="${region.title}" />
				</a>
			</div>
		</c:forEach>
	</div>
</body>
</html>
