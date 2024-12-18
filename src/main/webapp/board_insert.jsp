<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> <!-- JSP 페이지의 언어와 문자 인코딩 설정 -->
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8"> <!-- 페이지의 문자 인코딩 설정 -->
<title>Insert title here</title>
<!-- Toast UI Editor의 스타일 시트 로드 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<!-- Toast UI Editor의 JavaScript 파일 로드 -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
// 페이지 로드 후 실행될 스크립트
window.onload = () => {
	// Toast UI Editor 초기화
	const editor = new toastui.Editor({
		  el: document.querySelector('#description'), // 에디터가 렌더링될 요소
		  height: '500px', // 에디터의 높이 설정
		  initialEditType: 'wysiwyg', // 초기 편집 모드: WYSIWYG (시각적 편집)
		  previewStyle: 'vertical' // 미리보기 스타일 설정
		});

	// 폼 제출 시 에디터의 HTML과 Markdown 데이터를 숨겨진 input에 설정
	document.querySelector('form').onsubmit = (e) => {
		//e.preventDefault(); // 폼 제출 기본 동작 방지 (주석 처리됨)
		console.log(editor.getHTML()); // 에디터에서 HTML 형태로 내용 가져오기
		console.log(editor.getMarkdown()); // 에디터에서 Markdown 형태로 내용 가져오기
		document.querySelector('input[name=description]').value = editor.getHTML(); // HTML 데이터를 숨겨진 input에 설정
	}	

	// 파일 드래그 앤 드롭 처리
	let file_area = document.querySelector('.file_drop_area'); // 파일 드래그 영역
	let file = document.querySelector('#file'); // 파일 input 태그

	// 파일 드래그 영역에 파일을 드롭했을 때 처리
	file_area.ondrop = (e) => {
		e.preventDefault(); // 기본 동작 방지
		const data = e.dataTransfer; // 드래그된 데이터 가져오기
		console.log(data);
		console.log(data.files); // 드래그된 파일 목록 출력
		// 드래그한 파일을 파일 input에 연결
		file.files = data.files;
		let file_list_view = document.querySelector('.file_list_view'); // 파일 목록을 표시할 영역
		for(let i=0;i<data.files.length;i++){
			file_list_view.innerHTML += `${data.files[i].name}<br>`; // 파일 이름을 화면에 표시
		}
	
		// 드래그 영역의 활성화 스타일 제거
		e.target.classList.remove('file_area_active');
	}
	
	// 드래그 중에 파일이 드래그 영역 위로 오면 활성화 상태로 처리
	file_area.ondragover = (e) => {
		e.preventDefault(); // 기본 동작 방지
	}
	
	// 드래그가 시작되었을 때 활성화 상태로 처리
	file_area.ondragenter = (e) => {
		e.target.classList.add('file_area_active'); // 활성화 상태 클래스 추가
		e.preventDefault(); // 기본 동작 방지
	}
	
	// 드래그가 끝나면 비활성화 상태로 처리
	file_area.ondragleave = (e) => {
		e.target.classList.remove('file_area_active'); // 활성화 상태 클래스 제거
		e.preventDefault(); // 기본 동작 방지
	}
}
</script>
<style>
/* 페이지 전체 높이를 1000px로 설정 */
body {
	height: 1000px;
}

/* 파일 드래그 영역 스타일 */
.file_drop_area {
	width: 200px; /* 너비 200px */
	height: 200px; /* 높이 200px */
	border: 2px dashed #e9e9e9; /* 점선 테두리 */
	background-image: url('img/file.png'); /* 파일 아이콘 이미지 설정 */
	background-repeat: no-repeat; /* 배경 이미지 반복하지 않음 */
	background-position: center; /* 배경 이미지 중앙 정렬 */
}

/* 숨겨진 파일 input 태그 */
#file {
	display: none; /* 화면에 보이지 않도록 설정 */
}

/* 파일 드래그 영역이 활성화 상태일 때 스타일 */
.file_area_active {
	box-shadow: 0px 0px 3px 5px red; /* 빨간색 그림자 효과 */
}
</style>
</head>
<body>
	<h1>글쓰기</h1>
	<!-- 게시글 작성 폼 -->
	<form action="./insertBoard.do" method="post" enctype="multipart/form-data">
		<!-- 태그 선택 -->
		<label for="tag">태그 선택:</label> 
		<select id="tag" name="tag">
			<option>자유</option>
			<option>팁</option>
			<option>후기</option>
		</select>
		
		<!-- 제목 입력 -->
		<div class="form-group">
			<label for="title">제목</label> 
			<input type="text" id="title" name="title" required> <!-- 제목 입력 필수 -->
		</div>
		
		<!-- 내용 입력 -->
		<div class="form-group">
			<label for="description">내용</label>
			<div id="description"></div> <!-- Toast UI Editor가 렌더링될 요소 -->
			<input type="hidden" name="description"> <!-- 에디터 내용이 HTML로 저장될 숨겨진 input 태그 -->
		</div>
		
		<!-- 파일 드래그 앤 드롭 영역 -->
		<div class="file_drop_area"></div>
		<!-- 파일 선택 input (숨겨짐) -->
		<input type="file" name="file" id="file">
		<!-- 파일 목록 보기 영역 -->
		<div class="file_list_view"></div>
		
		<!-- 제출 버튼 -->
		<div class="form-group">
			<button type="submit">작성</button>
		</div>
	</form>
</body>
</html>
