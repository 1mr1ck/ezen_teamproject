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
	<title>Tour_Spot</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	BoardDao dao = BoardDao.getInstance();
	BoardDto board = null;
	
	if(request.getParameter("no") != null) {
		int b_no = Integer.parseInt(request.getParameter("no"));
		board = dao.getBoardByNo(b_no); %>
		
	<h1>Tour_Spot</h1>
    <div class="form-container">
        <form method="post" action="">
            <input type="text" value="<%=board.getTitle() %>" readonly>
            <textarea rows="20" readonly><%=board.getContent() %></textarea>
            <input type="button" onclick="location.href='board.jsp'" value="글목록">
            <input type="button" onclick="location.href='boardUpdateForm.jsp?no=<%=board.getB_no() %>'" value="글수정">
        </form>
    </div>
	<%}
	else {
		response.sendRedirect("board.jsp"); // borad 조회 실패 -> 페이지 이동
	}%>
</body>
</html>