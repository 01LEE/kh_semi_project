<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
</head>
<body>
    <nav>
        <ul>
            <li><a href="./index.jsp">홈</a></li>
            <li><a href="./allUser.do">유저 정보</a></li>
            <li><a href="./allBoard.do">게시판</a></li>
        </ul>
    </nav>

    <div class="container">
        <c:if test="${not empty boardList}">
            <table border="1">
                <c:forEach var="board" items="${boardList}">
                    <tr>
                        <th>Post Number</th>
                        <td>${board.postNumber}</td>
                    </tr>
                    <tr>
                        <th>Title</th>
                        <td>${board.title}</td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <td>${board.description}</td>
                    </tr>
                    <tr>
                        <th>Created Time</th>
                        <td>${board.createTime}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <div class="button-container">
            <div class="left">
                <a href="./allBoard.do">목록으로 돌아가기</a>
            </div>
            <div class="right">
                <c:forEach var="board" items="${boardList}">
                    <a href="./updateBoard.do?postNumber=${board.postNumber}">글 수정</a>
                    <a href="./deleteBoard.do?postNumber=${board.postNumber}">글 삭제</a>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
