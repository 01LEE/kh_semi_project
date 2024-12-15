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
<div class="body-container">
    <h1>게시글 목록</h1>

    <!-- 태그별 필터 버튼 -->
    <div>
        <a href="${pageContext.request.contextPath}/boardsCategory.do?tag=팁"><button>팁</button></a>
        <a href="${pageContext.request.contextPath}/boardsCategory.do?tag=자유"><button>자유</button></a>
        <a href="${pageContext.request.contextPath}/boardsCategory.do?tag=후기"><button>후기</button></a>
        <a href="${pageContext.request.contextPath}/boardsCategory.do"><button>전체</button></a>
    </div>

    <!-- 검색 폼 -->
    <form action="${pageContext.request.contextPath}/boardsList.do" method="get">
        <select name="tag">
            <option value="">전체</option>
            <option value="팁" ${param.tag == '팁' ? 'selected' : ''}>팁</option>
            <option value="자유" ${param.tag == '자유' ? 'selected' : ''}>자유</option>
            <option value="후기" ${param.tag == '후기' ? 'selected' : ''}>후기</option>
        </select>
        <input type="text" name="keyword" placeholder="검색어 입력" value="${param.keyword}" />
        <select name="type">
            <option value="title" ${param.type == 'title' ? 'selected' : ''}>제목</option>
            <option value="writer" ${param.type == 'writer' ? 'selected' : ''}>작성자</option>
        </select>
        <button type="submit">검색</button>
    </form>

    <!-- 검색 결과 -->
    <div class="board-container">
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
                            <td>[${board.tag}] <a href="./boardDetail.do?postNumber=${board.postNumber}">${board.title}</a>
                                <c:if test="${board.ccount > 0}">
                                    <span class="comment">[${board.ccount}]</span>
                                </c:if>
                            </td>
                            <td>${board.nickName}</td>
                            <td><c:choose>
                                    <c:when test="${board.updateTime != null}">
                                        ${board.formattedUpdateTime}
                                    </c:when>
                                    <c:otherwise>
                                        ${board.formattedCreateTime}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${board.bcount}</td>
                            <td>${board.blike}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty list}">
            <p>검색 결과가 없습니다.</p>
        </c:if>
    </div>

    <!-- 버튼 -->
    <div class="btn_container">
        <a href="./boardWriteView.do"><button>글쓰기</button></a>
        <!-- 페이징 처리 -->
    <c:if test="${totalPages > 1}">
        <div class="pagination">
            <!-- 이전 버튼 -->
            <c:if test="${currentPage > 1}">
                <a href="boardsList.do?page=${currentPage - 1}&tag=${param.tag}&keyword=${param.keyword}&type=${param.type}&sort=${param.sort}&order=${param.order}">
                    <button>이전</button>
                </a>
            </c:if>
            <c:if test="${currentPage == 1}">
                <button disabled>이전</button>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="boardsList.do?page=${i}&tag=${param.tag}&keyword=${param.keyword}&type=${param.type}&sort=${param.sort}&order=${param.order}">
                    <button <c:if test="${i == currentPage}">class="active"</c:if>>${i}</button>
                </a>
            </c:forEach>

            <!-- 다음 버튼 -->
            <c:if test="${currentPage < totalPages}">
                <a href="boardsList.do?page=${currentPage + 1}&tag=${param.tag}&keyword=${param.keyword}&type=${param.type}&sort=${param.sort}&order=${param.order}">
                    <button>다음</button>
                </a>
            </c:if>
            <c:if test="${currentPage == totalPages}">
                <button disabled>다음</button>
            </c:if>
        </div>
    </c:if>
        <a href="./allBoard.do"><button>목록</button></a>
    </div>
    </div>
</body>
</html>