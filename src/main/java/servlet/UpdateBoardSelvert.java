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
@WebServlet("/updateBoard.do")
public class UpdateBoardSelvert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardSelvert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postNumberStr = request.getParameter("postNumber");
		int postNumber = Integer.parseInt(postNumberStr);
		Boardsmapper mapper = DBManager.getInstance().getSession().getMapper(Boardsmapper.class);
		List<BoardsDTO> boardList = mapper.selectBoardByPostNumber(postNumber);
		request.setAttribute("boardList", boardList);
		request.getRequestDispatcher("update_board.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
