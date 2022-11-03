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
	CommentDto comment = null;
	if (request.getParameter("no") != null) {
		int c_no = Integer.parseInt(request.getParameter("no"));
		comment = commentDao.getCommentOne(c_no);
	%>

	<h1>Tour_Spot</h1>
	<div class="form-container"></div>
	<form method="post" action="commentUpdateAction2">
		<input type="text" name="c_no" value="test : <%=comment.getc_no()%>">
		<textarea name="content" rows="20"><%=comment.getContent()%></textarea>
		<input type="submit" value="댓글수정">
	</form>
	<%
	}
	else {
	response.sendRedirect("board");
	}
	%>

</body>
</html>