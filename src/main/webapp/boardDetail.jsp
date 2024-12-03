<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
</head>
<body>
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
<a href="./allBoard.do">목록으로 돌아가기</a>

</body>
</html>



