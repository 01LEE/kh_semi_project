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
        justify-content: center; /* 가로 방향 중앙 정렬 */
        align-items: center; /* 세로 방향 중앙 정렬 */
        gap: 100px; /* 컨테이너 간 간격 */
        margin-top: 50px; /* 상단 여백 */
    }

    /* 슬라이드 컨테이너 스타일 */
    .slider-container {
        width: 200px; /* 슬라이드 컨테이너 너비 */
        height: 500px; /* 슬라이드 컨테이너 높이 */
        overflow: hidden; /* 넘치는 내용 숨김 */
        position: relative; /* 내부 요소를 절대 위치로 배치 가능 */
    }

    .image-container {
        width: 1000px; /* 이미지 슬라이드 전체 너비 */
    }

    /* 슬라이드 스타일 */
    .slide {
        position: absolute; /* 슬라이드 절대 위치 지정 */
        width: 100%; /* 슬라이드 너비 */
        height: 100%; /* 슬라이드 높이 */
        top: 0; /* 상단 고정 */
        left: 100%; /* 초기 위치는 오른쪽 밖 */
        display: flex; /* 내부 요소 플렉스 정렬 */
        align-items: center; /* 수직 중앙 정렬 */
        justify-content: center; /* 가로 중앙 정렬 */
        text-align: center; /* 텍스트 중앙 정렬 */
        transition: left 1s ease-in-out; /* 부드러운 이동 효과 */
    }

    /* Transition 비활성화 클래스 */
    .no-transition {
        transition: none !important; /* 애니메이션 제거 */
    }

    /* 이미지 스타일 */
    .image-slide img {
        width: 100%; /* 이미지 너비 채움 */
        height: 100%; /* 이미지 높이 채움 */
        object-fit: cover; /* 이미지 비율 유지하며 채움 */
    }

    /* 텍스트 스타일 */
    .text-slide {
        font-size: 2rem; /* 텍스트 크기 */
        font-weight: bold; /* 굵은 텍스트 */
        color: #333; /* 텍스트 색상 */
        display: flex; /* 플렉스 박스 정렬 */
        flex-direction: column; /* 세로 방향 정렬 */
        gap: 10px; /* 텍스트 간 간격 */
    }

    /* 강조 텍스트 */
    .highlight-red { color: #b84e4e; } /* 빨간색 강조 */
    .highlight-pink { color: #d569a8; } /* 분홍색 강조 */
    .highlight-orange { color: #d88c26; } /* 주황색 강조 */
</style>
    
</head>
<body>
    <!-- 헤더 JSP 포함 -->
    <jsp:include page="./views/header.jsp"></jsp:include>
<div class="main-container">
    <!-- 텍스트 슬라이드 컨테이너 -->
    <div class="slider-container text-container">
        <!-- 텍스트 슬라이드 각각 정의 -->
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
        <!-- 이미지 슬라이드 각각 정의 -->
        <div class="slide image-slide" id="img1"><img src="img/nature/1.jpg" alt="자연 사진 1"></div>
        <div class="slide image-slide" id="img2"><img src="img/nature/2.jpg" alt="자연 사진 2"></div>
        <div class="slide image-slide" id="img3"><img src="img/nature/3.jpg" alt="자연 사진 3"></div>
        <div class="slide image-slide" id="img4"><img src="img/nature/4.jpg" alt="자연 사진 4"></div>
    </div>
</div>
<jsp:include page="./views/footer.jsp"></jsp:include>
    <!-- footer.jsp 포함 -->
    <script>
    // 텍스트와 이미지 슬라이드 선택
    const slidesText = document.querySelectorAll('.text-container .slide');
    const slidesImage = document.querySelectorAll('.image-container .slide');
    let currentSlide = 0; // 현재 슬라이드 인덱스

    // 슬라이드 초기화
    function initializeSlides() {
        // 모든 슬라이드에 Transition 비활성화
        slidesText.forEach(slide => slide.classList.add('no-transition'));
        slidesImage.forEach(slide => slide.classList.add('no-transition'));

        // 모든 슬라이드 초기 위치 설정
        slidesText.forEach(slide => slide.style.left = '100%');
        slidesImage.forEach(slide => slide.style.left = '100%');

        // 첫 번째 슬라이드 위치 설정
        slidesText[0].style.left = '0%';
        slidesImage[0].style.left = '0%';

        // Transition 활성화
        setTimeout(() => {
            slidesText.forEach(slide => slide.classList.remove('no-transition'));
            slidesImage.forEach(slide => slide.classList.remove('no-transition'));
        }, 50); // Transition 비활성화를 제거
    }

    // 슬라이드 변경 함수
    function changeSlide() {
        // 현재 슬라이드를 왼쪽으로 이동
        slidesText[currentSlide].style.left = '-100%';
        slidesImage[currentSlide].style.left = '-100%';

        // 다음 슬라이드 인덱스 계산
        currentSlide = (currentSlide + 1) % slidesText.length;

        // 다음 슬라이드 초기 위치 설정
        slidesText[currentSlide].classList.add('no-transition');
        slidesImage[currentSlide].classList.add('no-transition');
        slidesText[currentSlide].style.left = '100%';
        slidesImage[currentSlide].style.left = '100%';

        // 다음 슬라이드 부드럽게 표시
        setTimeout(() => {
            slidesText[currentSlide].classList.remove('no-transition');
            slidesImage[currentSlide].classList.remove('no-transition');
            slidesText[currentSlide].style.left = '0%';
            slidesImage[currentSlide].style.left = '0%';
        }, 50);
    }

    // 슬라이드 초기화 및 자동 슬라이드 설정
    initializeSlides();
    setInterval(changeSlide, 5000); // 5초마다 슬라이드 변경
</script>
</body>
</html>
