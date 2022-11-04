<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZEN RENTAL CAR [LOGIN]</title>
<link rel="stylesheet" href="resources/login.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div>
			<form method="post" action="LoginAction">
				<table border="1" style="border-collapse : collapse;">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" placeholder="id" required></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="password" placeholder="password" required></td>
					</tr>
				</table>
				<input type="submit" value="로그인">
			</form>
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=f17145af917afa076cf92e7f58096053&redirect_uri=http://localhost:8081/tour_spot_project/KakaoControllar&response_type=code" ><img src="kakao_login/kakao_login_small.png"></a>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>