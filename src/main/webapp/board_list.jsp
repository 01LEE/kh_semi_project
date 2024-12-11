<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boards List</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
}

* {
	margin: 0;
	padding: 0;
}

.board-container {
	width: 100%;
}

.board-table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	font-size: 16px;
	text-align: center; /* 모든 텍스트 기본 정렬: 가운데 */
}

.board-table th, .board-table td {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	padding: 8px;
}

a {
	color: black;
	text-decoration: none;
}

.comment {
	color: rgb(249, 75, 75);
}
/* 제목 열만 좌측 정렬 */
.board-table td:nth-child(2) {
	text-align: left;
	width: 50%;
}

.btn_container {
	width: 100%;
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-between;
}

button {
	width: 100px;
	background-color: white;
	border: 1px solid #d3d3d3;
	height: 30px;
	border-radius: 10px;
}

.body-container {
	width: 1200px;
	display: flex;
	flex-flow: column nowrap;
	margin: 0 auto;
}

thead {
	background-color: #f2f2f2;
	font-weight: bolder;
}

input {
	height: 25px;
}

select {
	height: 30px;
}
</style>
</head>
<body>
	<!-- 공통 헤더 -->
	<jsp:include page="header.jsp" />

	<h1>여행 게시판</h1>
	<div class="body-container">
		<!-- 검색 폼 -->
		<form action="boardsList.do" method="get">
			<input type="text" name="keyword" placeholder="검색어 입력"
				value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>" />
			<select name="type">
				<option value="title"
					<%="title".equals(request.getParameter("type")) ? "selected" : ""%>>제목</option>
				<option value="writer"
					<%="writer".equals(request.getParameter("type")) ? "selected" : ""%>>작성자</option>
			</select>

			<!-- 정렬 기준 선택 -->
			<select name="sort">
				<option value="title"
					<%="title".equals(request.getParameter("sort")) ? "selected" : ""%>>제목</option>
				<option value="createTime"
					<%="createTime".equals(request.getParameter("sort")) ? "selected" : ""%>>작성일</option>
				<option value="userNumber"
					<%="userNumber".equals(request.getParameter("sort")) ? "selected" : ""%>>작성자</option>
			</select>

			<!-- 오름차순/내림차순 선택 -->
			<select name="order">
				<option value="asc"
					<%="asc".equals(request.getParameter("order")) ? "selected" : ""%>>오름차순</option>
				<option value="desc"
					<%="desc".equals(request.getParameter("order")) ? "selected" : ""%>>내림차순</option>
			</select>

			<button type="submit">검색</button>
		</form>
		<div class="board-container">
			<!-- 검색 결과 출력 -->
			<c:if test="${not empty list}">
				<table class="board-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${list}">
							<tr>
								<td>${board.postNumber}</td>
								<td>[${board.tag}] <a
									href="./boardDetail.do?postNumber=${board.postNumber}">${board.title}
										<c:if test="${board.ccount > 0}">
											<span class="comment">[${board.ccount}]</span>
										</c:if>
								</a></td>
								<td>${board.nickName}</td>
								<td><c:choose>
										<c:when test="${board.updateTime != null}">
                                    ${board.formattedUpdateTime}
                                </c:when>
										<c:otherwise>
                                    ${board.formattedCreateTime}
                                </c:otherwise>
									</c:choose></td>
								<td>${board.bcount }</td>
								<td>${board.blike }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>

			<!-- 검색 결과가 없을 경우 -->
			<c:if test="${empty list}">
				<p>검색 결과가 없습니다.</p>
			</c:if>
		</div>
		<div class="btn_container">
			<!-- 목록으로 돌아가기 링크 -->
			<a href="./allBoard.do"><button>목록</button></a>
			<!-- 글쓰기 링크 -->
			<a href="./boardWriteView.do"><button>글쓰기</button></a>
		</div>
	</div>
</body>
</html>