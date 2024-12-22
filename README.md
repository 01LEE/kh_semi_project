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
![image](https://github.com/user-attachments/assets/4c16b55d-79b3-4a35-965c-4ac60694dd94)

>### 로그인 화면
![image](https://github.com/user-attachments/assets/77cd7b6e-b013-4f79-9d60-74e992624ba0)

>### 회원가입 화면
![image](https://github.com/user-attachments/assets/ccc6af6c-cb41-4dbf-936e-c3d41760a35c)

>### 아이디 찾기
![image](https://github.com/user-attachments/assets/4622ea14-8da0-494f-8271-6e2c61072d51)

>### 비밀번호 찾기
![image](https://github.com/user-attachments/assets/0436a406-ebb0-49b3-8455-241e4d697f99)

>### 마이페이지
![image](https://github.com/user-attachments/assets/f857b35c-9fd2-48e1-b7cf-b969dc05915f)

>### 정보수정
![image](https://github.com/user-attachments/assets/c5a98eb8-8158-417b-a845-4aa9a0eb20cd)

>### 지역소개
![image](https://github.com/user-attachments/assets/e052593a-5813-4ffa-8a20-ad4e13ea9b9b)

>### 지역소개 상세 화면

>### 지역소개 작성

>### 지역소개 수정

>### 관리자 페이지
![image](https://github.com/user-attachments/assets/fe700490-f698-42d4-9294-000d84a1d78d)

>### 관리자 회원 조회 화면
![image](https://github.com/user-attachments/assets/cdc09a4a-d516-43be-afda-0f048c075c9c)

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
![image](https://github.com/user-attachments/assets/6626567d-d838-451f-98d7-f25b20c8045d)

>### 댓글 신고 조회 화면
![image](https://github.com/user-attachments/assets/4c16b55d-79b3-4a35-965c-4ac60694dd94)
- Front<br>
	- [댓글 신고 조회 화면 - adminCommentReportList.jsp](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/webapp/adminCommentReportList.jsp)<br>
- Back<br>
	- [댓글 신고 조회 및 신고 승인, 거부 처리 - CommentReportListController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/CommentReportListController.java)
- SQL
```
<!-- 댓글 신고 목록 조회 -->
	<select id="selectCommentReports" resultMap="comment">
		select * from
		CommentReportView
		ORDER BY report_number DESC
	</select>
 <!-- 댓글 관리 상태 변경 -->
 	<update id="updateCommentReportStatus" parameterType="map">
		UPDATE COMMENT_REPORTS
		SET REPORT_STATUS = #{status},
		HANDLED_BY_ADMIN_ID = #{adminId}
		WHERE REPORT_NUMBER = #{reportNumber}
	</update>
```
>### 게시판 메인 화면
![image](https://github.com/user-attachments/assets/2832ce1e-4034-487e-a560-83826e80ede6)
- Front<br>
	- [게시판 메인 화면 - board_list.jsp](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/webapp/board_list.jsp)<br>
- Back<br>
	- [게시판 전체 조회 - BoardMainView.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/BoardMainView.java)<br>
	- [게시판 글쓰기 화면으로 이동 - BoardInsertViewController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/BoardInsertViewController.java)<br>
- SQL
```

```
>### 게시판 상세 조회 화면
![image](https://github.com/user-attachments/assets/c92c687a-cace-45ab-9e22-de339285436a)
>#### 게시글
- Front<br>
	- [게시글 상세 조회 화면 - board_view.jsp](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/webapp/board_view.jsp)<br>
- Back<br>
	- [게시글 상세 조회 - BoardViewController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/BoardViewController.java)<br>
	- [게시글 삭제 - BoardDeleteController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/BoardDeleteController.java)<br>
	- [게시글 수정 화면으로 이동 - BoardUpdateViewController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/BoardUpdateViewController.java)<br>
	- [게시글 좋아요 - BoardLikeController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/BoardLikeController.java)<br>
- SQL
```
<!-- 게시글 하나만 조회 -->
	<select id="selectBoardByPostNumber" resultMap="boards">
		select * from
		BOARD_VIEW
		WHERE POST_NUMBER = #{postNumber, jdbcType=INTEGER}
	</select>
<!-- 게시글 삭제 -->
	<delete id="deleteBoardByPostNumber">
		DELETE FROM BOARDS WHERE POST_NUMBER = #{postNumber,
		jdbcType=INTEGER}
	</delete>
<!-- 게시글 좋아요 입력 -->
	<insert id="insertBoardLike" parameterType="map">
		insert into board_likes(post_number, user_number)
		values(#{postNumber},#{userNumber})
	</insert>
<!-- 게시글 좋아요 삭제 -->
	<delete id="deleteBoardLike" parameterType="map">
		delete from board_likes
		where post_number = #{postNumber} and user_number = #{userNumber}
	</delete>
```
>#### 댓글
- Back<br>
	- [댓글 작성 - CommentWriteController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/CommentWriteController.java)<br>
	- [댓글 삭제 - CommentDeleteController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/CommentDeleteController.java)<br>
	- [댓글 좋아요 - BoardCommentLikeController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/BoardCommentLikeController.java)<br>
- SQL 
```
<!-- 댓글 조회 -->
	<select id="getCommentList" resultMap="comments">
		select * from
		comments_view where post_number = #{postNumber} ORDER BY
		COMMENT_NUMBER
	</select>
<!-- 댓글 작성 -->
	<insert id="insertComment" parameterType="dto.CommentsDTO">
		insert into
		comments(comment_number, post_number, user_number, c_description)
		values(SEQ_COMMENTS_COMMENT_NUMBER.nextval, #{postNumber},
		#{userNumber}, #{cDescription})
	</insert>
<!-- 댓글 삭제 -->
	<delete id="deleteComment">
		DELETE FROM COMMENTS WHERE COMMENT_NUMBER =
		#{commentNumber}
	</delete>
<!-- 댓글 좋아요 입력 -->
	<insert id="insertCommentLike" parameterType="map">
		insert into comment_likes(comment_number, user_number)
		values(#{commentNumber},#{userNumber})
	</insert>
<!-- 댓글 좋아요 삭제 -->
	<delete id="deleteCommentLike" parameterType="map">
		delete from comment_likes
		where comment_number = #{commentNumber} and user_number = #{userNumber}
	</delete>
```
>#### 파일 다운로드
- Back
	- [파일 다운로드 - BoardFileDownController.java](https://github.com/01LEE/kh_semi_project/blob/choi/src/main/java/controller/BoardFileDownController.java)<br>
- SQL
```
<!-- 첨부파일 목록 -->
	<select id="selectFileList" parameterType="int" resultMap="file">
		select * from board_file where post_number = #{postNumber}
	</select>
<!-- 파일 다운로드 -->
	<select id="selectFilePath" parameterType="int" resultMap="file">
		select file_path, file_name from board_file where file_number =
		#{fileNumber}
	</select>
```
>### 게시글 신고
![image](https://github.com/user-attachments/assets/e04b8ef6-a2a8-40f0-8a7e-f3419b10bb43)
- Front
```
// 게시글 신고
	function openModal(board) {
		let userNumber = '${sessionScope.user.getUserNumber()}';
		let writerNumber = '${board.userNumber}'
		if(userNumber == writerNumber){
			alert('자기 자신이 쓴 게시글은 신고할 수 없습니다.');
            return;
		}
		
		var modal = document.getElementById('reportModal');
		document.getElementById('modalPostTitle').innerText = board.title;
		document.getElementById('modalPostNumber').value = board.postNumber;
		document.getElementById('modalPostNumberDisplay').innerText = board.postNumber;
		document.getElementById('modalAuthorId').innerText = board.nickName;
		// 사용자 닉네임을 세션에서 가져오거나 입력하도록 설정
		var userNickname = "${sessionScope.user != null ? sessionScope.user.nickName : ''}";
		document.getElementById('modalUserNickname').value = userNickname;
		modal.style.display = 'block';
	}

	function closeModal() {
		var modal = document.getElementById('reportModal');
		modal.style.display = 'none';
	}
```
- Back<br>
	- [게시글 신고 - ReportWriteController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/ReportWriteController.java)
>### 댓글 신고
![image](https://github.com/user-attachments/assets/ab01b85a-728b-46d8-ac2c-397ac2243f09)
- Front
```
// 신고 모달 열기
    window.openCommentReportModal = function(commentNumber, commentContent, commentUserNumber) {
        if (!user) {
            alert('로그인 후 댓글 신고를 할 수 있습니다.');
            window.location.href = './login.do'; // 로그인 페이지로 리디렉션
            return;
        }
        let userNumber = '${sessionScope.user.getUserNumber()}';
		let writerNumber = commentUserNumber;
		if(userNumber == writerNumber){
			alert('자기 자신이 쓴 댓글은 신고할 수 없습니다.');
            return;
		}
        document.getElementById('commentReportModal').style.display = 'block';
        document.getElementById('commentNumber').value = commentNumber;
        document.getElementById('commentContent').innerText = commentContent;
    };

    // 신고 모달 닫기
    function commentCloseModal() {
        document.getElementById('commentReportModal').style.display = 'none';
    }

    // 'X' 버튼 클릭 시 모달 닫기
    document.querySelector('.commentclose').addEventListener('click', commentCloseModal);

});
```
- Back<br>
	- [댓글 신고 - CommentReportInsertController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/CommentReportInsertController.java)
- SQL
```
<!-- 댓글 신고 -->
	<insert id="insertCommentReport"
		parameterType="dto.CommentReportDTO">
		insert into comment_reports(report_number,
		comment_number, user_number,
		comment_report_reason)
		values
		(comment_reports_report_number_seq.nextval, #{commentNumber},
		#{userNumber}, #{commentReportReason})
	</insert>
```
>### 게시판 글 작성
![image](https://github.com/user-attachments/assets/55106eff-f9a0-431f-ac86-bd1ce4a5199b)
- Front<br>
	- [게시판 글 작성 페이지 - board_insert.jsp](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/webapp/board_insert.jsp) <br>
- Back<br>
	- [게시판 글 작성 및 파일 업로드 - BoardInsertController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/BoardInsertController.java)<br>
- SQL
```
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
- Front<br>
	- [게시판 글 수정 화면 - board_update.jsp](https://github.com/01LEE/kh_semi_project/blob/choi/src/main/webapp/board_update.jsp)<br>
- Back<br>
	- [게시판 글 수정 - BoardUpdateController.java](https://github.com/01LEE/kh_semi_project/blob/semi_project/src/main/java/controller/BoardUpdateController.java)<br>
- SQL
```
<!-- 기존 업로드 된 파일 삭제 -->
	<delete id="deleteBoardFile">
		delete from board_file where post_number =
		#{postNumber}
	</delete>
<!-- 파일 업로드 -->
	<insert id="insertBoardFile" parameterType="dto.BoardFileDTO">
		insert into
		board_file(file_number,post_number,file_path,file_name)
		values(FILE_NUMBER_SEQ.nextval, #{postNumber}, #{filePath}, #{fileName})
	</insert>
```
>## 6. 프로젝트 소감 및 향후 계획
- 이현성 :
- 최승인 : 처음엔 배운 내용을 실제로 적용하는 방법에 대한 감이 잘 잡히지 않아 막막했지만, 프로젝트를 진행하면서 점차 내가 무엇을 알고 있고, 어떤 부분이 부족한지 구체적으로 파악할 수 있었습니다. 이번 프로젝트를 통해 기본적인 파일 업로드 기능을 구현했지만, 이후에는 업로드된 파일을 개별적으로 관리할 수 있도록 수정할 계획입니다.
- 이형준 :
- 홍필진 :
- 장호진 :
>## 7. Q & A
