package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDao;
import user.UserDto;

/**
 * Servlet implementation class JoinAction
 */
@WebServlet("/JoinAction")
public class JoinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		UserDao dao = UserDao.getInstance();
		UserDto dto = null;
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		
		String birth = request.getParameter("birthday");
		Date birthday = Date.valueOf(LocalDate.parse(birth));
		
		String gender = request.getParameter("gender");
		String id = request.getParameter("id");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address = address1+" "+address2;
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		String password = request.getParameter("password");
	//  String passwordCheck = request.getParameter("passwordCheck");
		String token = request.getParameter("token");
		
		System.out.println(name+birth+gender+id+address+phone+password+token);
		
		if(token != null) {
			dto = new UserDto(no, name, birthday, gender, id, address, phone, password);
		} else {
			dto = new UserDto(no, name, birthday, gender, id, address, phone, password, token);
		}
		
		if(dto != null) {
			dao.createUser(dto);
		}
		
//		if(password.equals(passwordCheck)) {
//			if(name != null && id != null && phone != null && password != null) {
//				dto = new UserDto(no, name, birthday, gender, id, address, phone, password);
//				dao.createUser(dto);
//				System.out.println(name + "님 회원가입 완료");
//			}
//		}
		
		request.getRequestDispatcher("home").forward(request, response);
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
