<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/index.css">
<title>사용자들이 직접 만드는 관광지</title>
</head>
<body>
	<div class="login-wrapper"> 
		<h2>Login</h2>
		<form method="post" action="LoginAction" id="login-form">
			<input type="text" name="id" placeholder="Email"> 
			<input type="password" name="password" placeholder="Password">
			<input type="submit" value="Login">
		</form>
	</div>
</body>
</html>