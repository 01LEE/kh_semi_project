package service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import config.DBManager;
import dto.BoardFileDTO;
import dto.BoardsDTO;
import dto.CommentsDTO;
import mapper.BoardsMapper;

/**
 * BoardsService 클래스는 게시판 관련 비즈니스 로직을 처리하는 서비스 계층입니다. 이 클래스는 BoardsMapper와
 * 상호작용하여 데이터베이스 작업을 수행합니다.
 */
public class BoardsService {

	// BoardsService의 유일한 인스턴스를 저장하는 변수 (싱글톤 패턴)
	private static BoardsService instance = new BoardsService();

	// BoardsMapper 객체 (MyBatis 매퍼)
	private BoardsMapper mapper;

	/**
	 * 기본 생성자: DBManager를 통해 BoardsMapper를 초기화합니다.
	 */
	public BoardsService() {
		mapper = DBManager.getInstance().getSession().getMapper(BoardsMapper.class);
	}

	/**
	 * BoardsService의 싱글톤 인스턴스를 반환합니다.
	 * 
	 * @return BoardsService 인스턴스
	 */
	public static BoardsService getInstance() {
		if (instance == null)
			instance = new BoardsService();
		return instance;
	}

	/**
	 * 모든 게시글을 조회합니다.
	 * 
	 * @return 게시글 목록 (List 형태로 반환)
	 */
	public List<BoardsDTO> selectAllBoards() {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.selectAllBoards();
		}
	}

	/**
	 * 특정 게시글 번호를 기준으로 게시글 상세 정보를 조회합니다.
	 * 
	 * @param postNumber 게시글 번호
	 * @return 해당 게시글의 상세 정보 (List 형태로 반환)
	 */
	public BoardsDTO selectBoardByPostNumber(int postNumber) {
		return mapper.selectBoardByPostNumber(postNumber);
	}

	/**
	 * 특정 게시글 번호를 기준으로 게시글을 삭제합니다.
	 * 
	 * @param postNumber 게시글 번호
	 * @return 삭제된 행의 수
	 */
	public int deleteBoardByPostNumber(int postNumber) {
		return mapper.deleteBoardByPostNumber(postNumber);
	}

	/**
	 * 새로운 게시글을 데이터베이스에 삽입합니다.
	 * 
	 * @param dto 게시글 정보를 담은 DTO 객체
	 * @return 삽입된 행의 수
	 */
	public int insertBoard(BoardsDTO dto, List<BoardFileDTO> fList) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			int postNumber = mapper.selectPostNumber();
			dto.setPostNumber(postNumber);
			int count = mapper.insertBoard(dto);
			fList.forEach(item -> {
				item.setPostNumber(postNumber);
				mapper.insertBoardFile(item);
			});
			return count;
		}
	}

	/**
	 * 특정 게시글 정보를 업데이트합니다.
	 * 
	 * @param board 수정할 게시글 정보를 담은 DTO 객체
	 * @return 업데이트된 행의 수
	 */
	public int updateBoard(BoardsDTO dto, List<BoardFileDTO> fList) {
		// 게시글 내용 업데이트
		int count = mapper.updateBoard(dto); // dto는 수정할 게시글 정보
		// 기존 파일 삭제 (필요한 경우)
		mapper.deleteBoardFile(dto.getPostNumber());
		// 새로운 파일 추가
		fList.forEach(item -> {
			item.setPostNumber(dto.getPostNumber());
			mapper.insertBoardFile(item);
		});
		return count;
	}

	public List<BoardsDTO> getBoardsByTag(String tag) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.getBoardsByTag(tag);
		}
	}

	// 조회수
	public int updateBoardsCount(int postNumber) {
		return mapper.updateBoardsCount(postNumber);

	}

	public int insertComment(CommentsDTO comment) {
		return mapper.insertComment(comment);
	}

	public List<CommentsDTO> getCommentList(int postNumber) {
		return mapper.getCommentList(postNumber);
	}

	public int deleteComment(int commentNumber) {
		return mapper.deleteComment(commentNumber);

	}

	public int getBoardCount(Map<String, Object> params) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.getBoardCount(params);
		}
	}

	public List<BoardsDTO> selectBoards(int offset, int pageSize) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.selectBoards(offset, pageSize); // 페이징된 게시글 목록 조회
		}
	}

	public List<BoardsDTO> searchBoards(Map<String, Object> params) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.searchBoards(params);
		}
	}

	public int getTotalRecords() {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.getBoardCount(null); // 조건 없이 전체 게시글 수 조회
		}
	}

	public int getBoardCountByTag(String tag) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.getBoardCountByTag(tag);
		}
	}

	public List<BoardsDTO> getBoardsByTagWithPaging(String tag, int offset, int pageSize) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.getBoardsByTagWithPaging(tag, offset, pageSize);
		}
	}

	public List<BoardFileDTO> selectFileList(int postNumber) {
		return mapper.selectFileList(postNumber);
	}

	public String selectFilePath(int fileNumber) {
		return mapper.selectFilePath(fileNumber);
	}

	public int insertBoardLike(int postNumber, int userNumber) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("postNumber", postNumber);
			map.put("userNumber", userNumber);
			return mapper.insertBoardLike(map);
		}

	}

	public int deleteBoardLike(int postNumber, int userNumber) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("postNumber", postNumber);
			map.put("userNumber", userNumber);
			return mapper.deleteBoardLike(map);
		}

	}

	public int getBoardLike(int postNumber) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.getBoardLike(postNumber);
		}
	}

	public int insertCommentLike(int commentNumber, int userNumber) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("commentNumber", commentNumber);
			map.put("userNumber", userNumber);
			return mapper.insertCommentLike(map);
		}

	}

	public int deleteCommentLike(int commentNumber, int userNumber) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("commentNumber", commentNumber);
			map.put("userNumber", userNumber);
			return mapper.deleteCommentLike(map);
		}

	}

	public int getCommentLike(int commentNumber) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.getCommentLike(commentNumber);
		}
	}

	public int getCommentUserNumber(int commentNumber) {
		try (SqlSession session = DBManager.getInstance().getSession()) {
			BoardsMapper mapper = session.getMapper(BoardsMapper.class);
			return mapper.getCommentUserNumber(commentNumber);
		}
	}
}