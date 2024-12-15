<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
window.onload = () => {
	const editor = new toastui.Editor({
		  el: document.querySelector('#description'),
		  height: '500px',
		  initialEditType: 'wysiwyg',
		  previewStyle: 'vertical'
		});

	document.querySelector('form').onsubmit = (e) => {
		//e.preventDefault();
		console.log(editor.getHTML());
		console.log(editor.getMarkdown());
		document.querySelector('input[name=description]').value = editor.getHTML();
	}	

	
	// 파일 드래그 처리
	let file_area = document.querySelector('.file_drop_area');
	let file_input = document.querySelector('#file');
	let file_list_view = document.querySelector('.file_list_view');
	let fileList = []; // 파일 목록을 저장할 배열

	file_area.ondrop = (e) => {
		e.preventDefault();
		const data = e.dataTransfer;
		console.log(data);
		console.log(data.files);
		// 파일 목록에 파일 추가
		for (let i = 0; i < data.files.length; i++) {
			fileList.push(data.files[i]); // 파일을 배열에 추가
		}

		// 파일 목록을 화면에 업데이트
		updateFileListView();
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

	// 작성 버튼 클릭 시 파일을 input[type="file"]에 추가
	document.querySelector('form').onsubmit = (e) => {
		// 파일을 input[type="file"]에 추가
		const dataTransfer = new DataTransfer();
		fileList.forEach(file => {
			dataTransfer.items.add(file);
		});
		file_input.files = dataTransfer.files;

		// 폼을 제출하도록
		// e.preventDefault(); // 필요에 따라 주석 해제
	}
	
	// 파일 목록을 화면에 표시하는 함수
	function updateFileListView() {
		file_list_view.innerHTML = ''; // 기존 목록 초기화
		fileList.forEach((file, index) => {
			const fileItem = document.createElement('div');
			const fileName = document.createElement('span');
			fileName.textContent = file.name;
			const deleteButton = document.createElement('button');
			deleteButton.textContent = '삭제';
			deleteButton.type = 'button';

			// 삭제 버튼 클릭 시 동작
			deleteButton.addEventListener('click', () => {
				// 목록에서 삭제
				fileList.splice(index, 1);
				updateFileListView(); // 화면 업데이트
			});

			fileItem.appendChild(fileName);
			fileItem.appendChild(deleteButton);
			file_list_view.appendChild(fileItem);
		});
	}
}
</script>
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
	<h1>글쓰기</h1>
	<form action="./insertBoard.do" method="post"
		enctype="multipart/form-data">
		<label for="tag">태그 선택:</label> <select id="tag" name="tag">
			<option>자유</option>
			<option>팁</option>
			<option>후기</option>
		</select>
		<div class="form-group">
			<label for="title">제목</label> <input type="text" id="title"
				name="title" required>
		</div>
		<div class="form-group">
			<label for="description">내용</label>
			<div id="description"></div>
			<input type="hidden" name="description">
		</div>
		<div class="file_drop_area"></div>
		<input type="file" name="file" id="file">
		<div class="file_list_view"></div>
		<div class="form-group">
			<button type="submit">작성</button>
		</div>
	</form>
</body>
</html>