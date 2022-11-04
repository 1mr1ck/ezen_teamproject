<%@page import="model.KakaoProfile"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZEN RENTAL CAR [ JOIN ]</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	UserDao dao = UserDao.getInstance();
	int no = dao.noGenerator();
	KakaoProfile profile = (KakaoProfile) request.getAttribute("profile");
	if(profile!=null){
		System.out.println(profile.getId());
	}
	%>
	 
	<!-- 회원코드/이름/나이/성별/아이디/주소/폰번/패스워드 -->
	<jsp:include page="header.jsp" />
	<section>
		<div>
			<form method="POST" action="JoinAction" style="border-collapse : collapse;">
				<table border="1">
					<tr>
						<td>회원코드</td>
						<td><input type="text" name="no" value="<%=no %>" readonly></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" value="<%=profile==null?"":profile.getEmail() %>"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input type="password" name="passwordCheck"></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="name" ></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="date" name="birthday"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
						<select name="gender">
							<option value="남">남</option>
							<option value="여">여</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
						<input type="text" id="userPhone1" name="phone1" required> -
						<input type="text" id="userPhone2" name="phone2" required> -
						<input type="text" id="userPhone3" name="phone3" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="submit" value="회원가입">
						<td>
							<input type="hidden" name="token" id="token" value="<%=profile==null?"":profile.getId() %>">
							<input type="submit" value="회원가입">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script src="resources/join.js" charset="utf-8"></script>
	<jsp:include page="footer.jsp" />
</body>
</html>