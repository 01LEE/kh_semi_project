package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.BoardsDTO;
import service.BoardsService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/boardsList.do")
public class SelectBoard extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardsService boardsService = BoardsService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword"); // 검색어
        String type = request.getParameter("type");       // 검색 기준: 제목 or 작성자
        String tag = request.getParameter("tag");         // 카테고리
        String sort = request.getParameter("sort");       // 정렬 기준
        String order = request.getParameter("order");     // 정렬 방식
        String pageParam = request.getParameter("page");  // 현재 페이지 번호

        // 기본값 설정
        if (type == null || type.isEmpty()) type = "title"; // 기본 검색 기준
        if (sort == null || sort.isEmpty()) sort = "createTime"; // 기본 정렬: 작성 시간
        if (order == null || order.isEmpty()) order = "desc";    // 기본 정렬 방식: 내림차순
        if (keyword != null) keyword = keyword.trim(); // 검색어 공백 제거

        // 페이지 설정
        int page = 1;
        int pageSize = 40;
        try {
            page = Integer.parseInt(pageParam);
            if (page <= 0) page = 1;
        } catch (NumberFormatException e) {
            page = 1; // 잘못된 값일 경우 기본값 설정
        }

        // 파라미터 맵 생성
        Map<String, Object> params = new HashMap<>();
        params.put("type", type);
        params.put("keyword", keyword);
        params.put("tag", tag);
        params.put("sort", sort);
        params.put("order", order);
        params.put("offset", (page - 1) * pageSize);
        params.put("limit", pageSize);

        // 서비스 호출
        List<BoardsDTO> boardList = boardsService.searchBoards(params);
        int totalCount = boardsService.getBoardCount(params); // 전체 게시글 수

        // 페이징 처리
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

        // JSP로 데이터 전달
        request.setAttribute("list", boardList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("tag", tag != null ? tag : "전체");
        request.setAttribute("sort", sort);
        request.setAttribute("order", order);
        request.setAttribute("keyword", keyword != null ? keyword : "");
        request.setAttribute("type", type);

        // 디버깅용 파라미터 출력
        System.out.println("Search Parameters: " + params);

        RequestDispatcher dispatcher = request.getRequestDispatcher("board_list.jsp");
        dispatcher.forward(request, response);
    }
}