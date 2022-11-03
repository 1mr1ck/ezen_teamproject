<%@page import="comment.CommentDto"%>
<%@page import="comment.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("log");
	
	CommentDao dao = CommentDao.getInstance();
	CommentDto comment = null;
	
	if(request.getParameter("no") != null) {
		int c_no = Integer.parseInt(request.getParameter("no"));
		dao.deleteComment(c_no); %>
			
	<h1>Tour_Spot</h1>
	<div>alert("삭제되었습니다.")</div>
	
	<%}
	else {
		response.sendRedirect("board"); // borad 조회 실패 -> 페이지 이동
	}%>
</body>
</html>