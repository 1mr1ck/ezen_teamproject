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
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		dao.deleteComment(c_no);
	response.sendRedirect("boardView?no="+b_no);
	 %>
	<%}
	else {
		response.sendRedirect("board"); // borad 조회 실패 -> 페이지 이동
	}%>
</body>
</html>