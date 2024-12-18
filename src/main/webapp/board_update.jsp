<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>수정</title>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<style>
body {
	height: 1000px;
}

.file_drop_area {
	width: 200px;
	height: 200px;
	border: 2px dashed #e9e9e9;
	background-image: url('img/file.png');
	background-repeat: no-repeat;
	background-position: center;
}

#file {
	display: none;
}

.file_area_active {
	box-shadow: 0px 0px 3px 5px red;
}
</style>
</head>
<body>
	<!-- 공통 헤더 -->
	<jsp:include page="./views/header.jsp"></jsp:include>
	<h1>수정</h1>
	<form action="./syncBoard.do" method="post"
		enctype="multipart/form-data">
		<c:if test="${not empty board}">
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
				<label for="description">내용</label>
				<!-- 에디터의 내용이 여기 들어갈 위치 -->
				<div id="description">${board.description}</div>
				<!-- 수정된 내용은 hidden input으로 전달 -->
				<input type="hidden" name="description">
			</div>
			<div class="file_drop_area"></div>
			<input type="file" name="file" id="file">
			<div class="file_list_view"></div>
			<div class="form-group">
				<!-- 숨겨진 삭제된 파일 정보 -->
				<input type="hidden" name="deleteFile" id="deleteFile"> 
				<input type="hidden" name="postNumber" value="${board.postNumber}">
				<button type="submit">수정</button>
				<a href="javascript:history.back();" class="btn cancel-btn">취소</a>
			</div>
		</c:if>
	</form>
</body>
<script>
    window.onload = () => {
        // 서버에서 Base64 이미지를 포함한 HTML을 그대로 가져옴
        const descriptionContent = '${board.description}';  // Base64 이미지가 포함된 HTML

        // Editor 초기화
        const editor = new toastui.Editor({
            el: document.querySelector("#description"),  // 에디터가 삽입될 DOM 요소
            height: '500px',
            initialEditType: 'wysiwyg',  // WYSIWYG 에디터로 시작
            previewStyle: 'vertical',  // 미리보기 스타일
        });

        // 폼 제출 시 수정된 내용을 hidden input에 저장
        document.querySelector('form').onsubmit = (e) => {
            // 에디터에서 수정된 HTML을 가져와서 hidden input에 저장
            console.log(editor.getHTML());
        	console.log(editor.getMarkdown());
            document.querySelector('input[name=description]').value = editor.getHTML();
        }

        // 파일 드래그 처리
        let file_area = document.querySelector('.file_drop_area');
        let file = document.querySelector('#file');

        file_area.ondrop = (e) => {
            e.preventDefault();
            const data = e.dataTransfer;
            file.files = data.files;
            let file_list_view = document.querySelector('.file_list_view');
            for (let i = 0; i < data.files.length; i++) {
                file_list_view.innerHTML += `\${data.files[i].name}<br>`;
            }
            e.target.classList.remove('file_area_active');
        }

        file_area.ondragover = (e) => {
            e.preventDefault();
        }

        file_area.ondragenter = (e) => {
            e.target.classList.add('file_area_active');
            e.preventDefault();
        }

        file_area.ondragleave = (e) => {
            e.target.classList.remove('file_area_active');
            e.preventDefault();
        }
    }
</script>
</html>

