<%@page import="board.BoardDao"%>
<%@page import="board.BoardDto"%>
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
	BoardDao dao = BoardDao.getInstance();
	
	if(request.getParameter("b_no") != null) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDto board = new BoardDto(b_no, title, content);
		dao.updateBoard(board);
	}
	response.sendRedirect("board.jsp");
	%>
</body>
</html>