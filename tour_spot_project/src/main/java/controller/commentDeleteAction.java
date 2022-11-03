package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.CommentDao;
import comment.CommentDto;

/**
 * Servlet implementation class commentDeleteAction
 */
@WebServlet("/commentDeleteAction")
public class commentDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commentDeleteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		CommentDao dao = CommentDao.getInstance();
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("log");
		String content = request.getParameter("content");
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		if(user_id != null && content != null && b_no != 0) {
			CommentDto comment = new CommentDto(user_id, content, b_no);
			dao.createComment(comment);	
			System.out.println(user_id + "님의 댓글 등록 완료");
			System.out.println("b_no : " + b_no);
			System.out.println("user_id : " + user_id);
		}
		else {			
			System.out.println(user_id + "님의 댓글 등록 실패");
		}
		request.getRequestDispatcher("home").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
