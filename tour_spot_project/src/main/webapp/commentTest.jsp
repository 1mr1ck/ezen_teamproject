<%@page import="comment.CommentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comment.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%
	int no = Integer.parseInt(request.getParameter("no"));
	CommentDao dao = CommentDao.getInstance();
	ArrayList<CommentDto> list = dao.getCommentAll(no);
	%>
	<table>
		<thead>
			<tr>
				<th>no</th>
				<th>title</th>
				<th>user</th>
				<th>regDate</th>
				<th>modDate</th>
				<th>modDate</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (CommentDto comment : list) {
			%>
			<tr>
				<td><%=comment.getc_no()%></td>
				<td><%=comment.getb_no()%></td>
				<td><%=comment.getContent()%></td>
				<td><%=comment.getuser_id()%></td>
				<td><%=comment.getRegDate()%></td>
				<td><%=comment.getModDate() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>