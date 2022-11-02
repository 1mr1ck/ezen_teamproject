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
</head>
<body>
	<%
	String id = (String)session.getAttribute("log");
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
			<li><a href="mypage">마이페이지</a></li>
		</ul>
	</nav>
	<aside>
		<img
			src="https://www.navercorp.com/navercorp_/promotion/tvAds/2021/20210830105726_1.57"
			width=100% height=100vh>
	</aside>
</body>
</html>