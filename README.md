># KH2 Semi-Project

>## 팀 소개

### 1. 팀 이름
KH 2조  

### 2. 팀원
- 팀장: 이현성  
- 팀원:
  - 최승인  
  - 이형준  
  - 홍필진  
  - 장호진

><h2>목차</h2>
<h3>1. 프로젝트 소개</h3>
<ul>
  <li>기획 의도</li>
  <li>목표</li>
</ul>
<h3>2. 개발 환경</h3>
<ul>
  <li>언어</li>
  <li>개발 툴</li>
  <li>프레임워크 및 라이브러리</li>
  <li>API</li>
</ul>
<h3>3. 개발 일정</h3>
<h3>4. 주요 기능</h3>
<h3>5. 화면 및 코드 리뷰</h3>
<h3>6. 프로젝트 소감 및 향후 계획</h3>
<ul>
  <li>소감</li>
  <li>향후 계획</li>
</ul>
<h3>7. Q & A</h3>

>## 1. 프로젝트 소개
>### 기획 의도
- 사용자에게 국내 관광지 소개
- 게시판을 통해 여행 관련 정보 공유

>### 목표
- 국내 여행 욕구 증가
- 다양한 여행 정보 공유
- 국내 관광지 활성화
  
>## 2. 개발 환경
>### 사용 언어
- Front End
  - JSP
  - CSS
  - Javascript
- Back End
  - Java   
>### 개발 툴
- Eclipse
- Oracle Database 11 XE
- DBeaver
- Tomcat 10
>### 프레임워크 및 라이브러리
- MyBatis
- Jakarta El
- Jakarta JSP & JSTL
- Toast UI Editor
- JavaMail API (메일 전송 관련)
- BCrypt (비밀번호 암호화)
- JSON
>### 사용 API
- 카카오맵 API (지도 및 위치 정보 제공)

>## 3. 개발 일정
| 기간           | 작업 내용                 |
|----------------|--------------------------|
| 11/28          | 주제 선정                |
| 11/29 ~ 12/02   | 개발 기획 및 DB 설계     |
| 12/03 ~ 12/05    | UI 설계                  |
| 12/06 ~ 12/22   | 기능 구현                |
| 12/23          | 프로젝트 발표            |

>## 4. 주요 기능
>### 로그인 페이지(담당자 : 이형준, 장호진)
- 로그인 기능(이형준)
- 아이디 찾기(장호진)
- 비밀번호 찾기 (장호진)
>### 회원가입 페이지(담당자 : 장호진)
- 아이디, 이메일, 닉네임 중복 확인
- 비밀번호 검증 기능
>### 마이 페이지(담당자 : 이형준)
- 프로필 사진 등록, 수정, 삭제
- 정보 수정
>### 관리자 기능(홍필진, 최승인)
- 회원 전체 조회 및 삭제(홍필진)
- 게시글 신고 목록 조회 및 검색처리(홍필진)
- 댓글 신고 목록 조회 및 처리(최승인)
>### 지역소개(담당자 : 이현성)
- 지역소개 작성, 수정, 삭제
- 이미지 업로드
- 카카오맵 API
>### 게시판(담당자 : 이현성, 최승인, 홍필진)
- 게시글 전체 조회(이현성, 최승인, 홍필진)
- 게시글 검색, 정렬 기능, 페이징(홍필진)
- 게시글 상세 조회(이현성, 최승인)
- 댓글 작성, 삭제(최승인)
- 게시글 작성, 수정, 삭제(최승인)
- 파일 업로드(최승인)
- 게시글 신고(홍필진), 댓글 신고(최승인)
- 게시글, 댓글 좋아요 기능(최승인)

>## 5. 화면 및 코드 리뷰
>### 메인화면
>### 로그인 화면
>### 회원가입 화면
>### 아이디 찾기
>### 비밀번호 찾기
>### 지역소개
>### 지역소개 상세 화면
>### 지역소개 작성 
>### 지역소개 수정
>### 관리자 페이지
>### 관리자 회원 조회 화면
>private ModelAndView handleView() {
        System.out.println("[AdminUserController] 사용자 목록 조회 시작");
        try {
            List<UsersDTO> list = UsersService.getInstance().selectAllUsers();
            System.out.println("[AdminUserController] 조회된 사용자 수: " + list.size());

            ModelAndView view = new ModelAndView();
            view.addObject("list", list);
            view.setPath("users_list.jsp");
            view.setRedirect(false);
            return view;
        } catch (Exception e) {
            System.out.println("[AdminUserController] 사용자 목록 조회 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }
>### 게시글 신고 조회 화면
>### 댓글 신고 조회 화면
![image](https://github.com/user-attachments/assets/4c16b55d-79b3-4a35-965c-4ac60694dd94)

>### 게시판 메인 화면
![image](https://github.com/user-attachments/assets/2832ce1e-4034-487e-a560-83826e80ede6)

>### 게시판 상세 조회 화면
![image](https://github.com/user-attachments/assets/c92c687a-cace-45ab-9e22-de339285436a)

>### 게시글 신고
![image](https://github.com/user-attachments/assets/e04b8ef6-a2a8-40f0-8a7e-f3419b10bb43)

>### 댓글 신고
![image](https://github.com/user-attachments/assets/ab01b85a-728b-46d8-ac2c-397ac2243f09)

>### 게시판 글 작성
![image](https://github.com/user-attachments/assets/55106eff-f9a0-431f-ac86-bd1ce4a5199b)

[게시판 글 작성 페이지 - board_insert.jsp](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/webapp/board_insert.jsp) <br>
[게시판 글 작성 컨트롤러 - BoardInsertController.class](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/ImportedClasses/controller/BoardInsertController.class)
```sql
<!-- 게시판 글쓰기 쿼리 -->
	<insert id="insertBoard" parameterType="dto.BoardsDTO">
		INSERT INTO
		boards(post_number, user_number, title, description, create_time, tag)
		VALUES(#{postNumber}, #{userNumber}, #{title}, #{description},
		SYSDATE, #{tag})
	</insert>
<!-- 파일업로드 글 번호 확인 -->
	<select id="selectPostNumber" resultType="int">
		select
		POST_NUMBER_SEQ.nextval from dual
	</select>
<!-- 파일 업로드 -->
	<insert id="insertBoardFile" parameterType="dto.BoardFileDTO">
		insert into
		board_file(file_number,post_number,file_path,file_name)
		values(FILE_NUMBER_SEQ.nextval, #{postNumber}, #{filePath}, #{fileName})
	</insert>
```
>### 게시판 글 수정
![image](https://github.com/user-attachments/assets/ef418bab-4d5b-4558-b0e1-f9aa514cf1c4)


>## 6. 프로젝트 소감 및 향후 계획
- 이현성 :
- 최승인 : 
- 이형준 :
- 홍필진 :
- 장호진 :
>## 7. Q & A
