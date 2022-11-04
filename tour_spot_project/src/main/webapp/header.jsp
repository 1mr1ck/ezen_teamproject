<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/grid.css">
<title>관광지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<%
	String id = (String)session.getAttribute("log");
	UserDao dao = UserDao.getInstance();
	UserDto dto = dao.getUserById(id);
	%>
	<header>
		<%if(id == null) {%>
		<table>
			<tr>
				<td><input type="button" onclick="location.href='index'"
					value="홈으로"></td>
				<td><input type="button" onclick="location.href='login'"
					value="로그인"></td>
				<td><input type="button" onclick="location.href='join'"
					value="회원가입"></td>
			</tr>
		</table>
		<%} %>
		<%if(id != null) { %>
			<table>
				<tr>
					<td><input type="button" onclick="location.href='index'"
						value="홈으로"></td>
					<td><input type="button" onclick="location.href='LogoutAction'" value="로그아웃"></td>
					<td><input type="button" onclick="location.href='UserDeleteAction'" value="회원탈퇴테스트용"></td>
					<td><input type="button" onclick="location.href='userPage'" value="회원정보수정테스트용"></td>					
					<td><%=dto.getName() %>님 환영합니다.</td>
				</tr>
			</table>
		<%} %>
		<h1>추천하는 관광지</h1>
	</header>
	<nav>
		<ul>
			<li><a href="guide">서비스안내</a></li>
			<li><a href="rental">차량대여</a></li>
			<li><a href="board">커뮤니티</a></li>
			<li><a href="notice">공지사항</a></li>
			<li><a href="userPage">마이페이지</a></li>
		</ul>
	</nav>
</body>
</html>