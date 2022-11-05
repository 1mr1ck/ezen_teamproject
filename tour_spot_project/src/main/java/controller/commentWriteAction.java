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
import org.json.JSONObject;

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
		
		
		if(user_id != null && content != null && b_no != 0) {
			CommentDto comment = new CommentDto(user_id, content, b_no);
			dao.createComment(comment);	
			System.out.println("댓글 등록 성공");
		}
		else {			
			System.out.println(user_id + "님의 댓글 등록 실패");
		}
		
//		[
//		  {
//		    "modDate": "2022-11-05 20:29:28.0",
//		    "regDate": "2022-11-05 20:29:28.0",
//		    "content": "123"
//		  }
//		]
		
		ArrayList<CommentDto> list = dao.getCommentAll(b_no);
		if(list.size() > 0) {
			// 하나의 dto에 들어있는 컬럼5개의 값들을 다 뺴와야하는데 3개만 뺴옴.
//			JSONArray result = new JSONArray(list);
			
			CommentDto dto = list.get(list.size()-1);
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("user_id", dto.getuser_id());
			jsonObj.put("b_no", dto.getb_no());
			jsonObj.put("content", dto.getContent());
			response.getWriter().append(jsonObj.toString());
		} else {
			response.getWriter().append("null");				
		}
		
		//request.getRequestDispatcher("boardView?no=" + b_no).forward(request, response);
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
