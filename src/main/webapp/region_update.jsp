<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 정보 수정</title>
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

.section {
    margin-bottom: 30px;
}

.section-title {
    font-size: 20px;
    margin-bottom: 10px;
    border-bottom: 2px solid #ddd;
    padding-bottom: 5px;
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

.map-container {
    width: 100%;
    height: 500px;
    background-color: #eaeaea;
    margin-top: 20px;
}
</style>

<script>
// ToastUI Editor 설정
window.onload = () => {
    const editor = new toastui.Editor({
        el: document.querySelector('#description-editor'),
        height: '500px',
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
        initialValue: `${region.description}` // 기존 설명 데이터를 설정
    });

    // 폼 제출 시 ToastUI 에디터 내용 전송
    document.querySelector('form').onsubmit = () => {
        document.querySelector('input[name=description]').value = editor.getHTML();
    };

    // 이미지 미리보기 기능
    document.getElementById('image').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const preview = document.getElementById('thumbnail-preview');
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    });
};
</script>
</head>
<body>
    <!-- 헤더 -->
    <div class="header">지역 정보 수정</div>

    <!-- 메인 컨테이너 -->
    <div class="container">
        <form action="./syncRegion.do" method="post" enctype="multipart/form-data">
            <!-- 지역 이름 -->
            <div class="section">
                <h2 class="section-title">지역 이름</h2>
                <input type="text" name="title" value="${region.title}" required>
            </div>

            <!-- 지역 설명 -->
            <div class="section">
                <h2 class="section-title">지역 설명</h2>
                <div id="description-editor"></div> <!-- ToastUI 에디터 영역 -->
                <input type="hidden" name="description"> <!-- 에디터 내용 전송 -->
            </div>

            <!-- 썸네일 이미지 -->
            <div class="section">
                <h2 class="section-title">썸네일 이미지</h2>
                <c:if test="${not empty region.imageUrl}">
                    <img id="thumbnail-preview" src="data:image/png;base64,${region.imageUrl}" alt="기존 썸네일 이미지">
                </c:if>
                <input type="file" id="image" name="image" accept="image/*">
                <input type="hidden" name="existingImageUrl" value="${region.imageUrl}">
            </div>

            <!-- 지도 -->
            <div class="section">
                <h2 class="section-title">지도</h2>
                <div class="map-container" id="map">지도 API 로드 중...</div>
            </div>

            <!-- 숨겨진 필드: 지역 번호 -->
            <input type="hidden" name="regionNumber" value="${region.regionNumber}">

            <!-- 수정/취소 버튼 -->
            <div class="section">
                <button type="submit">수정</button>
                <a href="./regionDetail.do?regionNumber=${region.regionNumber}">
                    <button type="button">취소</button>
                </a>
            </div>
        </form>
    </div>

    <!-- Kakao 지도 스크립트 -->
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY&autoload=false"></script>
    <script>
    kakao.maps.load(() => {
        const container = document.getElementById('map');
        const options = {
            center: new kakao.maps.LatLng(37.5665, 126.9780), // 예시 좌표: 서울
            level: 5
        };
        const map = new kakao.maps.Map(container, options);
    });
    </script>
</body>
</html>
