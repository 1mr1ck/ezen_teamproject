package controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.KakaoProfile;
import model.OauthToken;
import user.UserDao;
import user.UserDto;

@WebServlet("/KakaoControllar")
public class KakaoControllarAction extends HttpServlet  {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoControllarAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println("GET 접근");
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.print("POST 접근");
		doProcess(request,response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Redirect URI : http://localhost:8081/tour_spot_project/KakaoControllar
		//REST API 키 : f17145af917afa076cf92e7f58096053 ;
		String code = request.getParameter("code");
		
		String endPoint = "https://kauth.kakao.com/oauth/token";
		URL urlData = new URL(endPoint);
		
		HttpsURLConnection conn = (HttpsURLConnection) urlData.openConnection();
		String bodyData = "grant_type=authorization_code&";
		bodyData+="client_id=f17145af917afa076cf92e7f58096053&";
		bodyData+="redirect_uri=http://localhost:8081/tour_spot_project/KakaoControllar&";
		bodyData+="code="+code;
		//Https 프로퍼티 설정하기
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		//응답 true 설정
		conn.setDoOutput(true);
		
		//스트림 연결해서 값 넣기
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(),"UTF-8"));
		bw.write(bodyData);
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		//빌더생성
		StringBuilder sb = new StringBuilder();
		String input = "";
		while((input=br.readLine())!=null) {
			sb.append(input);
		}
		
		Gson gson = new Gson();
		OauthToken oauthToken = gson.fromJson(sb.toString(),OauthToken.class);
		System.out.println("토큰 값 "+oauthToken.getAccess_token());
		
		//user 정보 받기
		String endPoint2 = "https://kapi.kakao.com/v2/user/me";
		URL urlData2 = new URL(endPoint2);
		
		//https 스트림 생성
		HttpsURLConnection conn2 = (HttpsURLConnection)urlData2.openConnection();
		conn2.setRequestMethod("GET");
		conn2.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		conn2.setRequestProperty("Authorization","Bearer "+oauthToken.getAccess_token());
		conn2.setDoOutput(true);
		
		//IO request
		BufferedReader br2 = new BufferedReader(new InputStreamReader(conn2.getInputStream(),"UTF-8"));
		String input2 = "";
		StringBuilder sb2 = new StringBuilder();
		while((input2=br2.readLine())!=null) {
			sb2.append(input2);
		}
		//객체 담기
		Gson gson2 = new Gson();
		KakaoProfile profile = gson2.fromJson(sb2.toString(),KakaoProfile.class);
		
		//있는 회원인지 아닌지
		boolean dupl = UserDao.getInstance().contain(new UserDto(profile.getId()));
		
		if(dupl) {
			System.out.println("이미 가입된 회원");
			
		}
		else {
			System.out.println("회원 가입진행 절차");
			
		}
	}
}

