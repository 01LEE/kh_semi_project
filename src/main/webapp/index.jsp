<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 페이지 스타일 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
    }

    /* 네비게이션 바 스타일 */
    nav {
        background-color: #333;
        overflow: hidden;
    }

    nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
    }

    nav ul li {
        padding: 14px 20px;
    }

    nav ul li a {
        text-decoration: none;
        color: white;
        font-size: 18px;
        display: block;
        text-align: center;
        transition: background-color 0.3s ease;
    }

    nav ul li a:hover {
        background-color: #575757;
    }

    /* 하위 콘텐츠 스타일 */
    h1 {
        text-align: center;
        margin-top: 30px;
        color: #333;
    }
</style>
</head>
<body>
    <nav>
        <ul>
        	<li><a href="./index.jsp">홈</a></li>
            <li><a href="./allUser.do">유저 정보</a></li>
            <li><a href="./allBoard.do">게시판</a></li>
        </ul>
    </nav>

    <h1>Welcome to the Website!</h1>
</body>
</html>
