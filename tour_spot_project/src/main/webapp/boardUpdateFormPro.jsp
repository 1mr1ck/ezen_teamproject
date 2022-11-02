<%@page import="board.BoardDao"%>
<%@page import="board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>tour_spot</title>
</head>
<body>
	<%
	BoardDao dao = BoardDao.getInstance();
	
	if(request.getParameter("no") != null) {
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDto board = new BoardDto(no, title, content);
		dao.updateBoard(board);
	}
	response.sendRedirect("index");
	%>
</body>
</html>