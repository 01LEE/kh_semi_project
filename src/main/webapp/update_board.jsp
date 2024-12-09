<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>수정</title>
</head>
<body>
	<!-- 공통 헤더 -->
	<jsp:include page="header.jsp" />
	<h1>수정</h1>
	<form action="./syncBoard.do" method="post">
		<c:if test="${not empty board}">
			<!-- 하나의 게시글 객체에서 제목을 가져와서 입력 필드에 표시 -->
			<label for="tag">태그 선택:</label>
			<select id="tag" name="tag">
				<option value="자유" <c:if test="${board.tag == '자유'}">selected</c:if>>자유</option>
				<option value="팁" <c:if test="${board.tag == '팁'}">selected</c:if>>팁</option>
				<option value="후기" <c:if test="${board.tag == '후기'}">selected</c:if>>후기</option>
			</select>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" id="title"
					name="title" value="${board.title}" required>
			</div>
			<div class="form-group">
				<label for="description">내용</label> <input type="text"
					id="description" name="description" value="${board.description}"
					required>
			</div>
			<div class="form-group">
				<input type="hidden" name="postNumber" value="${board.postNumber}">
				<!-- 게시글 번호 숨겨서 전달 -->
				<button type="submit">수정</button>
			</div>
		</c:if>
	</form>
</body>
</html>

