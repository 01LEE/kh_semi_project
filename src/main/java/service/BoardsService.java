package service;

import java.util.List;

import config.DBManager;
import dto.BoardsDTO;
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
		return mapper.selectAllBoards();
	}

	/**
	 * 특정 게시글 번호를 기준으로 게시글 상세 정보를 조회합니다.
	 * 
	 * @param postNumber 게시글 번호
	 * @return 해당 게시글의 상세 정보 (List 형태로 반환)
	 */
	public List<BoardsDTO> selectBoardByPostNumber(int postNumber) {
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
	public int insertBoard(BoardsDTO dto) {
		return mapper.insertBoard(dto);
	}

	/**
	 * 특정 게시글 정보를 업데이트합니다.
	 * 
	 * @param board 수정할 게시글 정보를 담은 DTO 객체
	 * @return 업데이트된 행의 수
	 */
	public int updateBoard(BoardsDTO board) {
		return mapper.updateBoard(board);
	}
}