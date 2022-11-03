<%@page import="comment.CommentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comment.CommentDao"%>
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
	String id = (String)session.getAttribute("log");
	
	BoardDao dao = BoardDao.getInstance();
	BoardDto board = null;
	
	CommentDao commentDao = CommentDao.getInstance();
	
	if(request.getParameter("no") != null) {
		int b_no = Integer.parseInt(request.getParameter("no"));
		ArrayList<CommentDto> list = commentDao.getCommentAll(b_no);
		board = dao.getBoardByNo(b_no); %>
		
	<h1>Tour_Spot</h1>
    <div class="form-container">
        <form method="post" action="">
            <input type="text" value="<%=board.getTitle() %>" readonly>
            <textarea rows="20" readonly><%=board.getContent() %></textarea>
            <input type="button" onclick="location.href='board.jsp'" value="글목록">
            <%
            if(id != null) {
            %>
            <input type="button" onclick="location.href='boardUpdateForm.jsp?no=<%=board.getB_no() %>'" value="글수정">
            <input type="button" onclick="location.href='commentWriteForm.jsp'" value="댓글작성">
            <%} %>
        </form>
    </div>
    	<table border="1">
		<thead>
			<tr>
				<th>댓글번호</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (CommentDto comment : list) {
			%>
			<tr>
				<td><%=comment.getc_no()%></td>
				<td><%=comment.getContent()%></td>
				<td><%=comment.getuser_id()%></td>
				<td><%=comment.getRegDate()%></td>
				<td><%=comment.getModDate() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	<%}
	else {
		response.sendRedirect("board.jsp"); // borad 조회 실패 -> 페이지 이동
	}%>
</body>
</html>