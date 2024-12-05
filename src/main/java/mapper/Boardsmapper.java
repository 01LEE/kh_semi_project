package mapper;

import java.util.List;
import dto.BoardsDTO;

public interface Boardsmapper {

	List<BoardsDTO> selectAllBoards();

	List<BoardsDTO> selectBoardByPostNumber(int postNumber);

	int deleteBoardByPostNumber(int postNumber);

	int insertBoard(BoardsDTO dto);

	void updateBoard(BoardsDTO board);

	

}