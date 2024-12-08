<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 공통 헤더 -->
	<jsp:include page="header.html" />
	<h1>글쓰기</h1>
	<form action="./insertBoard.do" method="post">
		<label for="tag">태그 선택:</label> 
		<select id="tag" name="tag">
			<option>자유</option>
			<option>팁</option>
			<option>후기</option>
		</select>
		<div class="form-group">
			<label for="title">제목</label> <input type="text" id="title"
				name="title" required>
		</div>
		<div class="form-group">
			<label for="content">내용</label> <input type="text" id="description"
				name="description" required>
		</div>
		<div class="form-group">
			<button type="submit">작성</button>
		</div>
	</form>
</body>
</html>