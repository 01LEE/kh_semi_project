<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 정보 작성</title>
<!-- ToastUI 에디터 CSS 및 JS -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<style>
/* 공통 스타일 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.header {
    background-color: #81d4fa;
    padding: 20px;
    text-align: center;
    color: #333;
    font-size: 28px;
}

.nav-bar {
    display: flex;
    justify-content: center;
    background-color: #ddd;
    padding: 10px;
}

.nav-bar a {
    margin: 0 15px;
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

.section {
    margin-bottom: 30px;
}

.section-title {
    font-size: 20px;
    margin-bottom: 10px;
    border-bottom: 2px solid #ddd;
    padding-bottom: 5px;
}

input, textarea {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

button {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

img {
    display: block;
    margin: 10px auto;
    max-width: 300px;
    height: auto;
}
</style>

<script>
// 페이지 로드 시 에디터 설정
window.onload = () => {
    const editor = new toastui.Editor({
        el: document.querySelector('#description'),
        height: '500px',
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
    });

    // 폼 제출 시, editor 내용 Hidden Input으로 설정
    document.querySelector('form').onsubmit = (e) => {
        const descriptionContent = editor.getHTML(); // editor에서 HTML 형태로 내용 가져오기
        document.querySelector('input[name=description]').value = descriptionContent; // description hidden input에 할당
    };

    // 이미지 업로드 시 미리보기 기능
    document.getElementById('image').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const preview = document.getElementById('thumbnail-preview');
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = 'block'; // 이미지 표시
            };
            reader.readAsDataURL(file);
        }
    });
}
</script>
</head>
<body>
    <!-- 헤더 -->
    <div class="header">지역 정보 작성</div>

    <!-- 내비게이션 바 -->
    <div class="nav-bar">
        <a href="#photos">사진 추가</a>
        <a href="#details">상세정보</a>
        <a href="#map">지도</a>
    </div>

    <!-- 메인 컨테이너 -->
    <div class="container">
        <form action="./insertRegion.do" method="post" enctype="multipart/form-data">
            <!-- 지역 이름 입력 -->
            <div class="section" id="details">
                <h2 class="section-title">지역 이름</h2>
                <input type="text" name="title" placeholder="지역 이름을 입력하세요" required>
            </div>

            <!-- 지역 설명 입력 -->
            <div class="section">
                <h2 class="section-title">지역 설명</h2>
                <div id="description"></div>
                <input type="hidden" name="description">
            </div>

            <!-- 이미지 업로드 -->
            <div class="section" id="photos">
                <h2 class="section-title">썸네일 이미지</h2>
                <img id="thumbnail-preview" src="" alt="이미지 미리보기" style="display:none;">
                <input type="file" id="image" name="image" accept="image/*">
            </div>

            <!-- 지도 영역 (빈 화면) -->
            <div class="section" id="map">
                <h2 class="section-title">지도</h2>
                <div class="map-container" id="map-api">지도 API 로드 중...</div>
            </div>

            <!-- 버튼 영역 -->
            <div class="section">
                <button type="submit">작성</button>
                <a href="./region.do"><button type="button">취소</button></a>
            </div>
        </form>
    </div>
</body>
</html>
