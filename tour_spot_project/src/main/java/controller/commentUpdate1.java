package controller;

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

import comment.CommentDao;
import comment.CommentDto;

/**
 * Servlet implementation class commentUpdateAction
 */
@WebServlet("/commentUpdate1")
public class commentUpdate1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commentUpdate1() {
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
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		ArrayList<CommentDto> list = dao.getCommentAll(b_no);
		if(list.size() > 0) {
			// 하나의 dto에 들어있는 컬럼5개의 값들을 다 뺴와야하는데 3개만 뺴옴.
//			JSONArray result = new JSONArray(list);
			
			JSONArray result = new JSONArray();
			
			for(CommentDto dto : list) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("user_id", dto.getuser_id());
				jsonObj.put("b_no", dto.getb_no());
				jsonObj.put("content", dto.getContent());
				jsonObj.put("c_no", dto.getc_no());
				jsonObj.put("modDate", dto.getModDate());
				result.put(jsonObj);
			}
			response.getWriter().append(result.toString());
		} else {
			response.getWriter().append("null");				
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
