package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.Boardsmapper;

import java.io.IOException;
import java.util.List;

import config.DBManager;
import dto.BoardsDTO;

/**
 * Servlet implementation class UpdateBoardSelvert
 */
@WebServlet("/syncBoard.do")
public class UpdateBoardSelvert2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateBoardSelvert2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String postNumberStr = request.getParameter("postNumber");
		int postNumber = Integer.parseInt(postNumberStr);

		// 게시글 객체 생성 후 수정 내용 설정
		BoardsDTO board = new BoardsDTO();
		board.setPostNumber(postNumber);
		board.setTitle(title);
		board.setDescription(description);

		// 게시글 업데이트
		Boardsmapper mapper = DBManager.getInstance().getSession().getMapper(Boardsmapper.class);
		mapper.updateBoard(board);

		// 수정 후 게시글 목록 페이지로 리디렉션
		response.sendRedirect("./boardDetail.do?postNumber=" + postNumber);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
