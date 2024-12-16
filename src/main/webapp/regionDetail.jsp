<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Region Detail</title>
</head>
<body>
	<!-- 공통 헤더 -->
	<jsp:include page="header.jsp" />
	<h1>Region Detail</h1>

	<!-- 단일 지역의 상세 정보 출력 -->
	<div class="region-item">
		<h1>${regionDetail.title}</h1>
		<p>${regionDetail.description}</p>
		<img src="${regionDetail.imageUrl}" alt="${regionDetail.title}" />
	</div>

	<c:if test="${sessionScope.user != null}">
		<c:set var="user" value="${sessionScope.user}" />
		<c:if test="${user.grade == 'admin'}">
			<a href="./updateRegion.do?regionNumber=${regionDetail.regionNumber}"><button>수정</button></a>
			<a href="./deleteRegion.do?regionNumber=${regionDetail.regionNumber}"><button>삭제</button></a>
		</c:if>
	</c:if>
</body>
</html>
