<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
</head>
<style>
body {
    font-family: Arial, sans-serif;
}

.main-container {
    width: 1200px;
    display: flex;
    flex-flow: column nowrap;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

table {
    width: 100%;
    margin: 10px auto;
    border-collapse: collapse;
    background-color: #fff;
}

th {
    border-top: 1px solid gray;
    border-bottom: 1px solid gray;
    background-color: #f2f2f2;
    color: gray;
}

.title {
    font-size: 20px;
    text-align: center;
}

.content {
    height: 500px;
}

.button-container {
    width: 100%;
    display: flex;
    justify-content: space-between;
}

.button-container .left, .button-container .right {
    display: flex;
}

.button-container .right {
    gap: 10px;
    margin-left: auto;
}

.button-container button {
    width: 100px;
    background-color: white;
    border: 1px solid #d3d3d3;
    height: 30px;
    border-radius: 10px;
}

hr {
    border: 0.5px solid rgb(221, 221, 221);
    margin-bottom: 10px;
}

.comment_form {
    width: 100%;
    background-color: #f2f2f2;
    display: flex;
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
    background-color: white;
    border: 1px solid #d3d3d3;
    border-radius: 5px;
}

textarea {
    width: 1015px;
    height: 55px;
}

.comment-table {
    font-size: 16px;
    padding: 0px 8px;
}

.comment-table td {
    line-height: 2;
    text-decoration: none;
    color: black;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fff;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover, .close:focus {
    color: black;
    text-decoration: none;
}

.reson {
    width: 100%;
    height: 100px;
    margin-top: 10px;
    border: 1px solid #ddd;
    padding: 10px;
    resize: none;
}

.fileList {
    font-size: 12px;
}

.like-container {
    display: flex;
    justify-content: center;
    width: 100%;
}

.comment td {
    padding: 0px 10px;
}

.comment button {
    background-color: white;
    border: 1px solid #d3d3d3;
}

.comment-title {
    display: flex;
    justify-content: space-between;
    border-top: 1px solid rgb(221, 221, 221);
}
.board-content{
    border-top: 1px solid rgb(221, 221, 221);
	border-bottom: 1px solid rgb(221, 221, 221);
}
.comment-button button{
 	padding: 2px;
    border-radius: 5px;
}
.comment-delete-btn button{
	width: 15px;
}
button:hover {
    background-color: #f0f0f0; /* 버튼 배경색을 연한 회색으로 변경 */
    border-color: #999; /* 버튼 테두리 색을 어두운 회색으로 변경 */
}
#like_count, .clike_count{
	color: red;
}
.fileList{
	border-bottom: 1px solid rgb(221, 221, 221);
}
</style>
<body>
    <!-- 공통 헤더 -->
    <jsp:include page="./views/header.jsp"></jsp:include>
    <div class="main-container">
        <c:if test="${not empty board}">
            <table>
                <tr>
                    <th>${board.nickName}</th>
                    <th><c:choose>
                            <c:when test="${board.formattedUpdateTime != null}">${board.formattedUpdateTime}</c:when>
                            <c:otherwise>${board.formattedCreateTime}</c:otherwise>
                        </c:choose></th>
                    <th>조회수 : ${board.bcount }</th>
                    <th>좋아요 : ${board.blike }</th>
                </tr>
                <tr>
                    <td colspan="4" class="title">${board.title}</td>
                </tr>
                <tr class="board-content">
                    <td colspan="4" class="content">${board.description}</td>
                </tr>
                <tr class="fileList">
                	<td colspan="4">
                	<p>첨부파일 목록</p>
					<c:forEach var="file" items="${fileList}">
						<span> | </span><a href="./fileDown.do?fileNumber=${file.fileNumber}">${file.fileName} </a><span> | </span>
					</c:forEach>
					</td>
                </tr>
            </table>
        </c:if>

        <div class="button-container">
            <!-- 왼쪽으로 배치할 버튼 -->
            <div class="left">
                <a href="./allBoard.do"><button>목록</button></a>
            </div>
            <div class="like-container">
                <button type="button" id="btn_like">
                    좋아요 <span id="like_count">${board.blike }</span>
                </button>
            </div>
            <!-- 오른쪽으로 배치할 버튼 -->
            <div class="right">
                <c:if test="${writer || sessionScope.user.grade == 'admin'}">
                    <a href="./updateBoard.do?postNumber=${board.postNumber}"><button>수정</button></a>
                    <a href="./deleteBoard.do?postNumber=${board.postNumber}"><button>삭제</button></a>
                </c:if>
            </div>
        </div>

        <!-- 댓글 목록 -->
        <div class="comment">
            <table class="comment-table">
                <c:forEach var="comment" items="${commentList}">
                    <tr class="comment-title">
                        <input type="hidden" name="commentNumber" value="${comment.commentNumber}">
                        <td>${comment.nickName}(${comment.cmtCreateTime})
                            <a href="./commentDelete.do?commentNumber=${comment.commentNumber}&postNumber=${comment.postNumber}" class="comment-delete-btn"><button>x</button></a>
                        </td>
                        <td class="comment-button">
                            <button type="button" class="btn_comment_like">
                                좋아요 <span class="clike_count">${comment.clike }</span>
                            </button>
                            <button class="report-btn" onclick="openReportModal('${comment.commentNumber}', '${comment.cDescription}')">신고</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="comment_content">${comment.cDescription}</td>
                    </tr>
                </c:forEach>
            </table>
            </div>
            <!-- 댓글 입력 폼 -->
       	 <div class="comment_form">
            <form action="commentWrite.do" method="post">
                <input type="hidden" name="postNumber" value="${board.postNumber}">
                <textarea name="comment" placeholder="댓글을 입력하세요"></textarea>
                <button class="btn_comment">댓글작성</button>
            </form>
         </div>
    </div>
    <!-- 신고 모달 -->
    <div id="reportModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>댓글 신고</h2>
            <form action="commentReport.do" method="post">
                <input type="hidden" id="commentNumber" name="commentNumber">
                <input type="hidden" id="postNumber" name="postNumber" value="${board.postNumber}">
                <div>
                    <label>신고 대상 댓글:</label>
                    <p id="commentContent"></p>
                </div>
                <div>
                    <label>신고 사유:</label>
                    <textarea class="reason" name="reason" required placeholder="신고 사유를 입력하세요"></textarea>
                </div>
                <button type="submit">신고 제출</button>
            </form>
        </div>
    </div>
</body>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const user = ${sessionScope.user != null ? 'true' : 'false'}; // 유저 정보가 있는지 확인

    // 좋아요 클릭 시 처리
    document.querySelector('#btn_like').onclick = () => {
        if (!user) {
            alert('로그인 후 좋아요를 눌러주세요.');
            window.location.href = './login.do'; // 로그인 페이지로 리디렉션
            return;
        }
        const postNumber = '${board.postNumber}';
        const userNumber = '${board.userNumber}';
        let baseUrl = './boardLike.do';
        baseUrl += '?postNumber='+ postNumber+'&userNumber='+userNumber;
        fetch(baseUrl).then(response => response.json())
        .then(result => {
            alert(result.msg);
            document.querySelector('#like_count').innerText = result.blike;
        });
    }

    // 댓글 좋아요 클릭 시 처리
    document.querySelectorAll('.btn_comment_like').forEach(item => {
        item.onclick = (e) => {
            if (!user) {
                alert('로그인 후 좋아요를 눌러주세요.');
                window.location.href = './login.do'; // 로그인 페이지로 리디렉션
                return;
            }
            const commentNumber = e.target.parentNode.parentNode.querySelector('input').value;
            let baseUrl = './boardCommentLike.do';
            baseUrl += '?commentNumber='+ commentNumber;
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

    // 댓글 삭제 버튼 클릭 시 처리
    document.querySelectorAll('.comment-delete-btn').forEach(item => {
        item.onclick = (event) => {
            if (!user) {
                alert('로그인 후 댓글을 삭제할 수 있습니다.');
                window.location.href = './login.do'; // 로그인 페이지로 리디렉션
                event.preventDefault(); // 기본 동작을 방지 (삭제 요청을 보내지 않음)
                return;
            }
        }
    });

    // 신고 모달 열기
    window.openReportModal = function(commentNumber, commentContent) {
        if (!user) {
            alert('로그인 후 댓글 신고를 할 수 있습니다.');
            window.location.href = './login.do'; // 로그인 페이지로 리디렉션
            return;
        }
        document.getElementById("reportModal").style.display = "block";
        document.getElementById("commentNumber").value = commentNumber;
        document.getElementById("commentContent").innerText = commentContent;
    }

    // 신고 모달 닫기
    function closeModal() {
        document.getElementById("reportModal").style.display = "none";
    }

    // 모달 외부 클릭 시 닫기
    window.onclick = function(event) {
        const modal = document.getElementById("reportModal");
        if (event.target == modal) {
            closeModal();
        }
    }
});
</script>
</html>
