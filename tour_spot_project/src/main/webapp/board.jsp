<%@page import="java.sql.Timestamp"%>
<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@page import="board.BoardDao"%>
<%@page import="board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/boardTable.css">
<title>Tour_Spot</title>
</head>
<body>
	<%
	BoardDao dao = BoardDao.getInstance();
	ArrayList<BoardDto> list = dao.getBoardAll();
	String id = (String) session.getAttribute("log");
	%>
	<jsp:include page="header.jsp" />
	<div class="table-container">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th width="200px">제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>수정날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%for(BoardDto board : list) {
            	Timestamp modDate = board.getModDate();%>
				<tr>
					<td><%=board.getB_no() %></td>
					<td><a href="boardView?no=<%=board.getB_no()%>"><%=board.getTitle() %></a></td>
					<td><%=board.getUser_id() %></td>
					<td><%=board.getRegDate() %></td>
					<td>
						<%if(modDate != null) {%> 
						<%=modDate%>
						<%}	%>
					</td>
					<td><%=board.getViewCnt() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<div style="width:100%;">
			<%if(id != null) {%>
			<button onclick="location.href='boardWriteForm'">글쓰기</button>
			<%} %>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>