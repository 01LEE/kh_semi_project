package mapper;

import java.util.List;
import dto.BoardsDTO;

public interface BoardsMapper {

	List<BoardsDTO> selectAllBoards();

	List<BoardsDTO> selectBoardByPostNumber(int postNumber);

	int deleteBoardByPostNumber(int postNumber);

	int insertBoard(BoardsDTO dto);

	int updateBoard(BoardsDTO board);

}