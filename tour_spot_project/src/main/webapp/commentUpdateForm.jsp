<%@page import="java.util.ArrayList"%>
<%@page import="comment.CommentDto"%>
<%@page import="comment.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour_Spot</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

CommentDao commentDao = CommentDao.getInstance();
if(request.getParameter("no") != null) {
	int b_no = Integer.parseInt(request.getParameter("no"));
	int c_no = Integer.parseInt(request.getParameter("c_no"));
	ArrayList<CommentDto> list = commentDao.getCommentOne(c_no);
	
}
%>

</body>
</html>