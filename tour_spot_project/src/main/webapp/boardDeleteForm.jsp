<%@page import="board.BoardDto"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/form.css">
	<title>Insert title here</title>
</head>
<body>

	<script>alert("삭제되었습니다.")</script>
	
	<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("log");
	
	BoardDao dao = BoardDao.getInstance();
	BoardDto board = null;
	
	if(request.getParameter("no") != null) {
		int b_no = Integer.parseInt(request.getParameter("no"));
		board = dao.getBoardByNo(b_no);
		dao.deleteBoard(board);
		response.sendRedirect("board");
	}%>
	
</body>
</html>