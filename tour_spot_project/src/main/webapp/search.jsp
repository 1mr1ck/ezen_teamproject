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
<title>test</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	// String address = request.getParameter("서울");
	
	BoardDao dao = BoardDao.getInstance();
	ArrayList<BoardDto> list = dao.getBoardSearch("서울");
	%>
	
	<div>
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
                    <td><%if(modDate != null) {%>
                   			<%=modDate%> <%} %></td>
                    <td><%=board.getViewCnt() %></td>
                </tr>
            <%} %>
            </tbody>
		</table>
	</div>
</body>
</html>