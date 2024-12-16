package controller;

import java.io.IOException;
import java.util.List;

import dto.BoardsDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardsService;
import view.ModelAndView;

public class BoardUpdateViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int postNumber = Integer.parseInt(request.getParameter("postNumber"));

		BoardsDTO board = BoardsService.getInstance().selectBoardByPostNumber(postNumber);

		ModelAndView view = new ModelAndView();
		view.addObject("board", board);
		view.setPath("board_update.jsp");
		view.setRedirect(false);
		return view;
	}
}
