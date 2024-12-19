<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.UsersDTO"%>
<%@ page import="service.UsersService"%>
<%@ page import="java.time.Instant"%>
<%@ page import="java.time.temporal.ChronoUnit"%>
<%@ page import="jakarta.servlet.http.Cookie"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
    /* 전체 페이지 스타일 */
    body {
        margin: 0; /* 기본 여백 제거 */
        padding: 0; /* 기본 여백 제거 */
        box-sizing: border-box; /* 모든 요소에 테두리 박스 모델 적용 */
        font-family: Arial, sans-serif; /* 기본 폰트 설정 */
        background-color: #f8f8f8; /* 배경 색상 */
    }

    /* 메인 컨테이너 */
    .main-container {
        display: flex; /* 플렉스 박스로 구성 */
        flex-direction: row; /* 텍스트와 이미지를 가로로 배치 */
        justify-content: center; /* 수평 중앙 정렬 */
        align-items: flex-start; /* 텍스트와 이미지 세로 정렬 */
        gap: 50px; /* 텍스트와 이미지 간 간격 */
        margin-top: 50px; /* 상단 여백 */
    }

    /* 텍스트 슬라이드 컨테이너 */
    .text-container {
        flex: 1; /* 텍스트 영역 크기 비율 */
        max-width: 300px; /* 텍스트 슬라이드 최대 너비 */
        height: auto; /* 텍스트 영역 높이는 자동 설정 */
        background-color: #f9f9f9; /* 텍스트 영역 배경색 */
        border-radius: 8px; /* 모서리를 둥글게 */
        padding: 20px; /* 내부 여백 */
        position: relative;
    }

    /* 텍스트 슬라이드 */
    .text-slide {
        font-size: 2rem; /* 텍스트 크기 */
        font-weight: bold; /* 굵은 텍스트 */
        color: #333; /* 텍스트 색상 */
        display: flex; /* 플렉스 박스 정렬 */
        flex-direction: column; /* 세로 방향 정렬 */
        gap: 10px; /* 텍스트 간 간격 */
        text-align: center; /* 텍스트 중앙 정렬 */
    }

    /* 이미지 슬라이드 컨테이너 */
    .image-container {
        flex: 2; /* 이미지 영역 크기 비율 */
        max-width: 600px; /* 이미지 슬라이드 최대 너비 */
        height: 400px; /* 이미지 영역 고정 높이 */
        overflow: hidden; /* 넘치는 내용 숨김 */
        position: relative; /* 위치 조정을 위한 상대 위치 */
        background-color: #ddd; /* 이미지 영역 배경색 */
        border-radius: 8px; /* 모서리를 둥글게 */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    }

    /* 이미지 슬라이드 */
    .image-slide {
        position: absolute; /* 슬라이드 절대 위치 지정 */
        width: 100%; /* 슬라이드 너비 */
        height: 100%; /* 슬라이드 높이 */
        top: 0; /* 상단 고정 */
        left: 100%; /* 초기 위치는 오른쪽 밖 */
        display: flex; /* 내부 요소 플렉스 정렬 */
        align-items: center; /* 수직 중앙 정렬 */
        justify-content: center; /* 가로 중앙 정렬 */
        transition: left 1s ease-in-out; /* 부드러운 이동 효과 */
    }

    .image-slide img {
        width: 100%; /* 이미지 너비 채움 */
        height: 100%; /* 이미지 높이 채움 */
        object-fit: cover; /* 이미지 비율 유지하며 채움 */
    }

    /* 강조 텍스트 */
    .highlight-red {
        color: #b84e4e; /* 빨간색 강조 */
    }
    .highlight-pink {
        color: #d569a8; /* 분홍색 강조 */
    }
    .highlight-orange {
        color: #d88c26; /* 주황색 강조 */
    }
</style>
    
</head>
<body>
    <!-- 헤더 JSP 포함 -->
    <jsp:include page="./views/header.jsp"></jsp:include>
<div class="main-container">
    <!-- 텍스트 슬라이드 컨테이너 -->
    <div class="slider-container text-container">
        <div class="slide text-slide" id="text1">
            <span class="highlight-red">기차타고</span>
            <span class="highlight-pink">떠나기 좋은</span>
            <span class="highlight-orange">가을여행지</span>
        </div>
        <div class="slide text-slide" id="text2">
            <span class="highlight-red">기차타고</span>
            <span class="highlight-pink">풍경을 즐기는</span>
            <span class="highlight-orange">산의 이야기</span>
        </div>
        <div class="slide text-slide" id="text3">
            <span class="highlight-red">기차타고</span>
            <span class="highlight-pink">강변에서 만나는</span>
            <span class="highlight-orange">힐링의 순간</span>
        </div>
        <div class="slide text-slide" id="text4">
            <span class="highlight-red">기차타고</span>
            <span class="highlight-pink">걷는 숲 속의</span>
            <span class="highlight-orange">아름다운 길</span>
        </div>
    </div>

    <!-- 이미지 슬라이드 컨테이너 -->
    <div class="slider-container image-container">
        <div class="slide image-slide" id="img1"><img src="img/nature/1.jpg" alt="자연 사진 1"></div>
        <div class="slide image-slide" id="img2"><img src="img/nature/2.jpg" alt="자연 사진 2"></div>
        <div class="slide image-slide" id="img3"><img src="img/nature/3.jpg" alt="자연 사진 3"></div>
        <div class="slide image-slide" id="img4"><img src="img/nature/4.jpg" alt="자연 사진 4"></div>
    </div>
</div>
<jsp:include page="./views/footer.jsp"></jsp:include>
    <!-- footer.jsp 포함 -->
    <script>
    const slidesText = document.querySelectorAll('.text-container .slide');
    const slidesImage = document.querySelectorAll('.image-container .slide');
    let currentTextSlide = 0;
    let currentImageSlide = 0;

    // 슬라이드 초기화
    function initializeSlides() {
        slidesText.forEach(slide => slide.style.left = '100%');
        slidesImage.forEach(slide => slide.style.left = '100%');

        slidesText[0].style.left = '0%';
        slidesImage[0].style.left = '0%';
    }

    // 텍스트 슬라이드 변경
    function changeTextSlide() {
        slidesText[currentTextSlide].style.left = '-100%';
        currentTextSlide = (currentTextSlide + 1) % slidesText.length;
        slidesText[currentTextSlide].style.left = '0%';
    }

    // 이미지 슬라이드 변경
    function changeImageSlide() {
        slidesImage[currentImageSlide].style.left = '-100%';
        currentImageSlide = (currentImageSlide + 1) % slidesImage.length;
        slidesImage[currentImageSlide].style.left = '0%';
    }

    // 초기화 및 슬라이드 자동 변경
    initializeSlides();
    setInterval(changeTextSlide, 5000); // 텍스트 슬라이드는 5초마다 변경
    setInterval(changeImageSlide, 5000); // 이미지 슬라이드는 5초마다 변경
</script>
</body>
</html>
