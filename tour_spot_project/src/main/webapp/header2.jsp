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
		<div><h1>추천하는 관광지</h1></div>
	</header>
	<div style="backgroung-color:red">
	<nav>
		<ul>
			<li><a href="guide">서비스안내</a></li>
			<li><a href="rental">차량대여</a></li>
			<li><a href="board">커뮤니티</a></li>
			<li><a href="notice">공지사항</a></li>
			<li><a href="userPage">마이페이지</a></li>
		</ul>
	</nav>
	</div>
</body>
</html>