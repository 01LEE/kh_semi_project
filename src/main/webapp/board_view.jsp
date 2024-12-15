<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>

</head>
<style>
/* 게시글 상세 페이지 CSS */ /* 게시글 상세 페이지 CSS */
body {
	font-family: Arial, sans-serif;
}

.main-container {
	width: 1200px;
	display: flex;
	flex-flow: column nowrap;
	margin: 0 auto;
}

table {
	width: 1200px;
	margin: 20px auto;
	border-collapse: collapse;
	background-color: #fff;
}

th {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	background-color: #f2f2f2;
	height: 40px;
}

td {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	padding: 8px;
}

.title {
	font-size: 24px;
	text-align: center;
}

.content {
	height: 400px;
}

/* 공통 버튼 스타일 */
/* 링크 버튼 배치 */
.button-container {
	width: 100%;
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.button-container .left {
	display: flex;
}

.button-container .right {
	display: flex;
	gap: 10px; /* 버튼 간격 */
	margin-left: auto;
}

p {
	height: 50px;
}

button {
	width: 100px;
	background-color: white;
	border: 1px solid #d3d3d3;
	height: 30px;
	border-radius: 10px;
}

hr {
	border: 1px solid rgb(221, 221, 221);
	margin-bottom: 20px;
}

.comment_form {
	width: 100%;
	background-color: #f2f2f2;
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-between;
	padding: 10px 15px;
	position: relative;
	font-size: 0px;
	box-sizing: border-box;
}

.btn_comment {
	width: 100px;
	height: 50px;
	position: absolute;
	top: 12px;
	right: 15px;
}

textarea {
	width: 1050px;
	height: 50px;
}

.comment-table {
	font-size: 16px;
}

.comment-table td {
	line-height: 2;
	text-decoration: none;
	color: black;
}
</style>
<body>
	<!-- 공통 헤더 -->
	<jsp:include page="header.jsp" />
	<div class="main-container">
		<c:if test="${not empty board}">
			<table>
				<!-- 단일 게시글이므로 반복문을 제거하고, 바로 board 객체를 사용 -->
				<tr>
					<th>${board.nickName}</th>
					<th><c:choose>
							<c:when test="${board.updateTime != null}">${board.updateTime}</c:when>
							<c:otherwise>${board.createTime}</c:otherwise>
						</c:choose></th>
					<th>조회수 : ${board.bcount }</th>
					<th>좋아요 : ${board.blike }</th>
				</tr>
				<tr>
					<td colspan="4" class="title">${board.title}</td>
				</tr>
				<tr>
					<td colspan="4" class="content">${board.description}</td>
				</tr>
			</table>
		</c:if>
		<div class="button-container">
			<!-- 왼쪽으로 배치할 버튼 -->
			<div class="left">
				<a href="./allBoard.do"><button>목록</button></a>
			</div>
			<div>
				<button type="button" id="btn_like">좋아요 : <span id="like_count">${board.blike }</span></button>
			</div>
			<!-- 오른쪽으로 배치할 버튼 -->
			<div class="right">
				<c:if test="${writer || sessionScope.user.grade == 'admin'}">
					<a href="./updateBoard.do?postNumber=${board.postNumber}"><button>수정</button></a>
					<a href="./deleteBoard.do?postNumber=${board.postNumber}"><button>삭제</button></a>
				</c:if>
			</div>
		</div>
		<hr>
		<!-- 댓글 입력 폼 -->
		<div class="comment_form">
			<form action="commentWrite.do" method="post">
				<input type="hidden" name="postNumber" value="${board.postNumber}">
				<textarea name="comment" placeholder="댓글을 입력하세요"></textarea>
				<button class="btn_comment">댓글작성</button>
			</form>
		</div>
		<!-- 댓글 목록 -->
		<div class="comment">
			<table class="comment-table">
				<c:forEach var="comment" items="${commentList}">
					<tr>
						<input type="hidden" name="commentNumber" value="${comment.commentNumber}">
						<td>${comment.nickName}(${comment.cmtCreateTime})
						<c:if test="${comment.userNumber == sessionScope.user.userNumber || sessionScope.user.grade == 'admin'}">
								<a href="./commentDelete.do?commentNumber=${comment.commentNumber}&postNumber=${comment.postNumber}">삭제</a>
						</c:if> <br>${comment.cDescription}
						</td>
						<td>
							<button type="button" id="btn_comment_like">좋아요 : <span class="clike_count">${comment.clike }</span></button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div></div>
		<p>첨부파일 목록</p>
		<c:forEach var="file" items="${fileList}">
			<a href="./fileDown.do?fileNumber=${file.fileNumber}">${file.fileName}</a>
			<br>
		</c:forEach>
	</div>
	</div>
</body>
<script>
document.addEventListener("DOMContentLoaded", function () {
            //좋아요 경고창 띄우기(글번호 같이 띄움)
            document.querySelector('#btn_like').onclick = () => {
            	const postNumber = '${board.postNumber}';
            	const userNumber = '${board.userNumber}';
            	let baseUrl = './boardLike.do';
            	baseUrl += '?postNumber='+ postNumber+'&userNumber='+userNumber;
            	console.log(baseUrl);
            	fetch(baseUrl).then(response => response.json())
            	.then(result => {
            		alert(result.msg);
            		console.log(result.blike);
            		document.querySelector('#like_count').innerText = result.blike;
        		});
			}
            //좋아요 경고창 띄우기(글번호 같이 띄움)
           document.querySelectorAll('#btn_comment_like').forEach(item => {
				item.onclick = (e) => {
            	const commentNumber = e.target.parentNode.parentNode.querySelector('input').value;
            	console.log("댓글번호 : " + commentNumber);
            	let baseUrl = './boardCommentLike.do';
            	baseUrl += '?commentNumber='+ commentNumber;
            	console.log(baseUrl);
            	fetch(baseUrl).then(response => response.json())
            	.then(result => {
            		alert(result.msg);
            		 const likeCountElement = e.target.querySelector('.clike_count');
                     if (likeCountElement) {
                         likeCountElement.innerText = result.clike;
                     }
        		});
				}
			});
    });
    </script>
</html>



