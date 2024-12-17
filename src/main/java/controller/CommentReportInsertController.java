package controller;

import java.io.IOException;

import dto.CommentReportDTO;
import dto.UsersDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ReportService;
import view.ModelAndView;

public class CommentReportInsertController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int postNumber = Integer.parseInt(request.getParameter("postNumber"));
		int commentNumber = Integer.parseInt(request.getParameter("commentNumber"));
		int userNumber = ((UsersDTO)request.getSession().getAttribute("user")).getUserNumber();
		String reason = request.getParameter("reason");
		
		CommentReportDTO dto = new CommentReportDTO();
		dto.setCommentNumber(commentNumber);
		dto.setUserNumber(userNumber);
		dto.setCommentReportReason(reason);
		
		ReportService.getinstance().insertCommentReport(dto);
		
		ModelAndView view = new ModelAndView();
		view.setPath("./boardDetail.do?postNumber="+postNumber);
		view.setRedirect(true);

		
		return view;
	}

}
