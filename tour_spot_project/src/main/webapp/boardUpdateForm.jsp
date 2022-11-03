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
	
	if(request.getParameter("b_no") != null) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		board = dao.getBoardByNo(b_no); %>
	
    <h1>Tour_Spot</h1>
    <div class="form-container">
        <form method="post" action="boardUpdateFormPro.jsp">
        	<input type="hidden" name="b_no" value="<%=b_no%>">
            <input type="text" name="title" value="<%=board.getTitle() %>">
            <textarea name="content" rows="20"><%=board.getContent() %></textarea>
            <input type="submit" value="수정하기">
        </form>
    </div>
	<%}
	else {
		response.sendRedirect("board"); // borad 조회 실패 -> 페이지 이동
	}%>
</body>
</html>