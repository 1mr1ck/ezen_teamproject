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
	<title>tour_spot</title>
</head>
<body>
	<%
	String id = (String)session.getAttribute("log");
	BoardDao dao = BoardDao.getInstance();
	BoardDto board = null;
	
	request.setCharacterEncoding("utf-8");
	if(request.getParameter("no") != null) {
		int no = Integer.parseInt(request.getParameter("no"));
		board = dao.getBoardByNo(no); %>
		
	<h1>tour_spot</h1>
    <div class="form-container">
        <form method="post" action="">
            <input type="text" value="<%=board.getTitle() %>" readonly>
            <textarea rows="20" readonly><%=board.getContent() %></textarea>
            <input type="button" onclick="location.href='index'" value="글목록">
            <input type="button" onclick="location.href='boardUpdateForm.jsp?no=<%=board.getB_no() %>'" value="글수정">
        </form>
    </div>
	<%}
	else {
		response.sendRedirect("index"); //borad 조회 실패 -> 페이지 이동
	}%>
</body>
</html>