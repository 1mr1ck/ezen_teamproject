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
import user.UserDao;

/**
 * Servlet implementation class commentWrite
 */
@WebServlet("/commentWriteAction")
public class commentWriteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commentWriteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		CommentDao dao = CommentDao.getInstance();
		

		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("log");
		String content = request.getParameter("content");
		
		if(user_id != null && content != null) {
			CommentDto comment = new CommentDto( user_id, content);
			dao.createComment(comment);	
			System.out.println(user_id + "님의 댓글 등록 완료");
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
