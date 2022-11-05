package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.google.gson.Gson;

import board.BoardDao;
import board.BoardDto;
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
		request.setCharacterEncoding("utf-8");
		CommentDao dao = CommentDao.getInstance();
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("log");
		String content = request.getParameter("content");
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		System.out.println(user_id + "/" + content + "/" + b_no);
		
		
		if(user_id != null && content != null && b_no != 0) {
			CommentDto comment = new CommentDto(user_id, content, b_no);
			dao.createComment(comment);	
			System.out.println(user_id + "님의 댓글 등록 완료");
		}
		else {			
			System.out.println(user_id + "님의 댓글 등록 실패");
		}
		
		// ajax JSON
//		if(b_no > 0) {
//			ArrayList<CommentDto> list = dao.getCommentAll(b_no);
//			if(list.size() > 0) {
//				JSONArray result = new JSONArray(list);
//				response.getWriter().append(result.toString());
//			} else {
//				response.getWriter().append("null");
//			}
//		}
//		else {
//			response.getWriter().append("null");;
//		}
		
		request.getRequestDispatcher("boardView?no=" + b_no).forward(request, response);
		
		
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
