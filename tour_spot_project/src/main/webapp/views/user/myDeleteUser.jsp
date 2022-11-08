<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/myDeleteUser.css">
<title>Insert title here</title>
</head>
<body>
	<div class="login-wrapper"> 
		<h2>EXIT</h2>
		<form method="POST" id="login-form" action="service">
			<input type="hidden" name="command" value="UserDelete">
			<input type="text" name="id" placeholder="Email"> 
			<input type="password" name="password" placeholder="Password">
			<input type="submit" value="회원탈퇴">
		</form>
	</div>
</body>
</html>