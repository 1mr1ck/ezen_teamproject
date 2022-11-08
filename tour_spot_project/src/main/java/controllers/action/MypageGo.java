package controllers.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDao;
import user.UserDto;

public class MypageGo implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserDao dao = UserDao.getInstance();
		UserDto user = null;
		HttpSession session = request.getSession();
		
		if(id != null) {
			user = dao.getUserById(id);
		}
		
		if(user != null && user.getPassword().equals(password)) {
			System.out.println("회원인증 성공");
			session.setAttribute("log", id);
			out.println("<script>alert('회원인증 완료');location.href='userPageNew.jsp';</script>");
		}
		else {
			System.out.println("회원인증 실패");
			out.println("<script>alert('회원인증 실패');location.href='userConfirm.jsp';</script>");
		}
		
		out.flush();
	}
}
