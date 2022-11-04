<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZEN RENTAL CAR [ JOIN ]</title>
<link rel="stylesheet" href="resources/join.css">
</head>
<body>
	<%
	UserDao dao = UserDao.getInstance();
	int no = dao.noGenerator();
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
						<td><input type="text" name="id"></td>
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
						<td>이름</td>
						<td><input type="text" name="name"></td>
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
						<td><input type="text" name="phone"></td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="회원가입">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>