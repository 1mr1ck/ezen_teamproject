<%@page import="user.UserDao"%>
<%@page import="user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/userPage.css">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	UserDao dao = UserDao.getInstance();
	
	String id = (String)session.getAttribute("log");
	UserDto user = dao.getUserById(id);
	%>
	<jsp:include page="header.jsp" />
	<section>
		<!-- 회원코드/이름/나이/성별/아이디/주소/폰번/패스워드 -->
		<div class="info">
			<form action="UserUpdateAction" method="post" name="info-form"
				id="info-form">
				<ul class="myInfo">
					<li><label for="userId">아이디</label></li>
					<li><input type="text" id="userId" name="userId" value="<%=id %>" readonly></li>
					<li><label for="passWd">현재 비밀번호</label></li>
					<li><input type="password" id="passWd" name="changePw" placeholder="비밀번호" /></li>
					<li><label for="passWd">사용 할 비밀번호</label></li>
					<li><input type="password" id="passWd" name="changePw" placeholder="비밀번호" /></li>
					<li><label for="passWdCheck">사용 할 비밀번호 확인</label></li>
					<li><input type="password" id="passWdCheck" name="changePwCheck" placeholder="비밀번호 확인"></li>
					<li><label for="userName">이름</label></li>
					<li><input type="text" id="userName" name="userName" value="<%=user.getName() %>"></li>
					<li><label for="userPhone">휴대번호</label></li>
					<li class="userPhone">
					<input type="text" id="userPhone" name="userPhone" placeholder="010"> - 
					<input type="text" id="userPhone" name="userPhone" placeholder="1111"> - 
					<input type="text" id="userPhone" name="userPhone" placeholder="1111"></li>
					<li><label for="userAddress">주소</label></li>
					<li><input type="text" id="userAddress" name="userAddress" value="<%=user.getAddress() %>" /></li>
					<li>
					<li>
						<button class="btn" type="submit">정보수정</button>
					</li>
				</ul>
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>