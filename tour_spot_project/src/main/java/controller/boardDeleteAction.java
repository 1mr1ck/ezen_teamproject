package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDao;
import board.BoardDto;

/**
 * Servlet implementation class boardDeleteAction
 */
@WebServlet("/boardDeleteAction")
public class boardDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardDeleteAction() {
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
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log");
		
		BoardDao dao = BoardDao.getInstance();
		BoardDto board = null;
		
		if(request.getParameter("no") != null) {
			int b_no = Integer.parseInt(request.getParameter("no"));
			board = dao.getBoardByNo(b_no);
			dao.deleteBoard(board);
			response.sendRedirect("board");
		}
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
