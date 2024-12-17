package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.DBManager;
import dto.UsersDTO;
import mapper.UsersMapper;

/**
 * UsersService 클래스는 사용자 관련 비즈니스 로직을 처리하는 서비스 계층입니다. 이 클래스는 UsersMapper와 상호작용하여
 * 데이터베이스 작업을 수행합니다.
 */
public class UsersService {

	 // UsersService의 유일한 인스턴스를 저장하는 변수 (싱글톤 패턴)
    private static UsersService instance = new UsersService();

    /**
     * 기본 생성자: 외부에서 인스턴스를 생성하지 못하도록 private으로 설정
     */
    private UsersService() {
        // 빈 생성자
    }

    /**
     * UsersService의 싱글톤 인스턴스를 반환합니다.
     * 
     * @return UsersService 인스턴스
     */
    public static UsersService getInstance() {
        return instance;
    }

    /**
     * 모든 사용자 정보를 조회합니다.
     * 
     * @return 사용자 목록 (List 형태로 반환)
     */
    public List<UsersDTO> selectAllUsers() {
        try (SqlSession session = DBManager.getInstance().getSession()) {
            UsersMapper mapper = session.getMapper(UsersMapper.class);
            // 관리자를 제외한 사용자 조회
            List<UsersDTO> users = mapper.selectAllUsersExcludeAdmin();
            System.out.println("모든 사용자 조회 성공. 사용자 수: " + users.size());
            return users;
        } catch (Exception e) {
            System.out.println("selectAllUsers 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 새로운 사용자를 데이터베이스에 삽입합니다.
     * 
     * @param dto 사용자 정보를 담은 DTO 객체
     * @return 삽입된 행의 수
     */
    public int insertMember(UsersDTO dto) {
        try (SqlSession session = DBManager.getInstance().getSession()) {
            UsersMapper mapper = session.getMapper(UsersMapper.class);
            int result = mapper.insertMember(dto);
            session.commit();
            System.out.println("새 사용자 삽입 성공. 삽입된 행 수: " + result);
            return result;
        } catch (Exception e) {
            System.out.println("insertMember 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 로그인 ID가 이미 존재하는지 확인합니다.
     * 
     * @param loginId 로그인 ID
     * @return 존재하면 true, 아니면 false
     */
    public boolean isLoginIdExists(String loginId) {
        try (SqlSession session = DBManager.getInstance().getSession()) {
            UsersMapper mapper = session.getMapper(UsersMapper.class);
            int count = mapper.selectLoginIdCount(loginId);
            System.out.println("로그인 ID '" + loginId + "' 존재 여부: " + (count > 0));
            return count > 0;
        } catch (Exception e) {
            System.out.println("isLoginIdExists 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 사용자 로그인 처리
     * 
     * @param loginId  로그인 ID
     * @param password 비밀번호
     * @return 로그인 성공 시 UsersDTO, 실패 시 null
     */
    public UsersDTO login(String loginId, String password) {
        System.out.println("login() 호출 -> loginId: " + loginId + ", 비밀번호 인증 시작");
        try (SqlSession session = DBManager.getInstance().getSession()) {
            UsersMapper mapper = session.getMapper(UsersMapper.class);
            UsersDTO user = mapper.selectUserByLoginIdAndPassword(loginId, password);
            if (user != null) {
                System.out.println("로그인 성공 - 사용자: " + user.getNickName() + ", 등급: " + user.getGrade());
            } else {
                System.out.println("로그인 실패ㄹ- 아이디 또는 비밀번호 불일치");
            }
            return user;
        } catch (Exception e) {
            System.out.println("login 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 로그인 ID로 사용자 정보를 조회합니다.
     * 
     * @param loginId 로그인 ID
     * @return 사용자 정보 (UsersDTO)
     */
    public UsersDTO getUserByLoginId(String loginId) {
        System.out.println("getUserByLoginId() 호출 -> loginId: " + loginId + ", 사용자 정보 조회 시작");
        try (SqlSession session = DBManager.getInstance().getSession()) {
            UsersMapper mapper = session.getMapper(UsersMapper.class);
            UsersDTO user = mapper.selectUserByLoginId(loginId);
            if (user != null) {
                System.out.println("사용자 조회 성공 - 사용자: " + user.getNickName());
            } else {
                System.out.println("사용자 조회 실패 - 존재하지 않는 loginId: " + loginId);
            }
            return user;
        } catch (Exception e) {
            System.out.println("getUserByLoginId 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 사용자 번호로 특정 사용자 정보 조회
     * 
     * @param userNumber 사용자 번호
     * @return 사용자 정보 (UsersDTO)
     */
    public UsersDTO selectUserByNumber(int userNumber) {
        System.out.println("selectUserByNumber() 호출 -> userNumber: " + userNumber);
        try (SqlSession session = DBManager.getInstance().getSession()) {
            UsersMapper mapper = session.getMapper(UsersMapper.class);
            UsersDTO user = mapper.selectUserByNumber(userNumber);
            if (user != null) {
                System.out.println("사용자 조회 성공 - 사용자: " + user.getNickName());
            } else {
                System.out.println("사용자 조회 실패 - 존재하지 않는 userNumber: " + userNumber);
            }
            return user;
        } catch (Exception e) {
            System.out.println("selectUserByNumber 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 사용자와 연관된 데이터 삭제 후 사용자 삭제
     * 
     * @param userNumber 사용자 번호
     * @return 삭제 성공 여부
     */
    public boolean deleteUserAndRelatedData(int userNumber) {
        SqlSession session = null;
        try {
            session = DBManager.getInstance().getSession(); // autoCommit=false로 설정된 세션
            UsersMapper mapper = session.getMapper(UsersMapper.class);

            // 댓글 삭제
            int deletedComments = mapper.deleteCommentsByUserNumber(userNumber);
            System.out.println("삭제된 댓글 수: " + deletedComments);

            // 게시물 삭제
            int deletedBoards = mapper.deleteBoardsByUserNumber(userNumber);
            System.out.println("삭제된 게시물 수: " + deletedBoards);

            // 사용자 삭제
            int deletedUser = mapper.deleteUserByUserNumber(userNumber);
            System.out.println("삭제된 사용자 수: " + deletedUser);

            // 모든 작업이 성공하면 커밋
            session.commit();
            return deletedUser > 0;
        } catch (Exception e) {
            if (session != null) {
                session.rollback(); // 예외 발생 시 롤백
                System.out.println("deleteUserAndRelatedData 중 예외 발생: " + e.getMessage() + ", 롤백 수행");
            }
            System.out.println("deleteUserAndRelatedData 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) {
                session.close(); // 세션 닫기
                System.out.println("SqlSession 닫기");
            }
        }
    }

    /**
     * 사용자 삭제
     * 
     * @param userNumber 사용자 번호
     * @return 삭제된 행의 수
     */
    public int deleteUser(int userNumber) {
        System.out.println("deleteUser() 호출, userNumber: " + userNumber);
        try (SqlSession session = DBManager.getInstance().getSession()) {
            UsersMapper mapper = session.getMapper(UsersMapper.class);
            int result = mapper.deleteUserByUserNumber(userNumber);
            session.commit();
            System.out.println("사용자 삭제 성공 - 삭제된 행 수: " + result);
            return result;
        } catch (Exception e) {
            System.out.println("deleteUser 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }
}