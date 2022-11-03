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
 * Servlet implementation class boardWriteAction
 */
@WebServlet("/boardWriteAction")
public class boardWriteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardWriteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		BoardDao dao = BoardDao.getInstance();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String map_addr = request.getParameter("main_address");
		
		if(title != null && content != null) {
			BoardDto dto = new BoardDto(id, title, content);
			dao.createBoard(dto);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
