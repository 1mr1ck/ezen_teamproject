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

	CommentDao commentDao = CommentDao.getInstance();
	CommentDto comment = null;
	if (request.getParameter("no") != null) {
		int c_no = Integer.parseInt(request.getParameter("no"));
		comment = commentDao.getCommentOne(c_no);
	%>
	
</body>
</html>