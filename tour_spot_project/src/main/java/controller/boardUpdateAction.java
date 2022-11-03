package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDao;
import board.BoardDto;

/**
 * Servlet implementation class boardUpdateAction
 */
@WebServlet("/boardUpdateAction")
public class boardUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardUpdateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		BoardDao dao = BoardDao.getInstance();
		
		System.out.println(request.getParameter("b_no"));
		if(request.getParameter("b_no") != null) {
			int b_no = Integer.parseInt(request.getParameter("b_no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String map_addr = request.getParameter("main_address");
			
			BoardDto board = new BoardDto(b_no, title, content, map_addr);
			dao.updateBoard(board);
		}
		response.sendRedirect("board");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
