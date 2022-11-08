package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDao;
import user.UserDto;

/**
 * Servlet implementation class UserUpdateAction
 */
@WebServlet("/UserUpdateAction")
public class UserUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/****
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("userId");//
		String nowPw = request.getParameter("passWd");//
		String changePw = request.getParameter("changePw");//
		String changePwCheck = request.getParameter("changePwCheck");//
		String name = request.getParameter("userName");//
		String phone = request.getParameter("userPhone1") + "-" + request.getParameter("userPhone2") + "-" + request.getParameter("userPhone3");
		System.out.println(phone);
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		if(address2==null) address2="";
		String address = address1 + address2;
		System.out.printf("%s\n%s\n%s\n%s\n%s\n%s\n%s\n",id,nowPw,changePw,changePwCheck,name,phone,address);
		
		UserDao dao = UserDao.getInstance();
		UserDto dto = dao.getUserById(id);
		
		if(dto.getPassword().equals(nowPw)) {
			if(changePw == null) {
				dto.setName(name);
				dto.setPhone(phone);
				dto.setAddress(address);
				dao.updateUserInfo(dto);
				out.println("<script>alert('정보 수정 완료');location.href='home';</script>");
			}
			else {
				if(changePw.equals(changePwCheck)) {
					dto.setName(name);
					dto.setPhone(phone);
					dto.setAddress(address);
					dto.setPassword(changePw);
					dao.updateUserInfo(dto);
					out.println("<script>alert('정보 수정 완료');location.href='home';</script>");
				} else {
					out.println("<script>alert('사용 할 비밀번호와 확인이 일치하지 않습니다.');location.href='userPageNew';</script>");
				}				
			}
		} else {
			out.println("<script>alert('현재 비밀번호를 잘못 입력하였습니다.');location.href='userPageNew';</script>");
		}
		
		out.close();
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
