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
    <link rel="stylesheet" href="resources/table.css">
	<title>Tour_Spot</title>
</head>
<body>
	<%
	BoardDao dao = BoardDao.getInstance();
	ArrayList<BoardDto> list = dao.getBoardAll();
	%>
	<h1>Tour_Spot</h1>
	<div class="table-container">
        <table border="1">
            <thead>
                <tr>
                    <th>no</th>
                    <th width="200px">title</th>
                    <th>name</th>
                    <th>regDate</th>
                    <th>modDate</th>
                </tr>
            </thead>
            <tbody>
            <%for(BoardDto board : list) {%>
                <tr>
                    <td><%=board.getB_no() %></td>
                    <td><a href="boardView?no=<%=board.getB_no()%>"><%=board.getTitle() %></a></td>
                    <td><%=board.getUser_id() %></td>
                    <td><%=board.getRegDate() %></td>
                    <td><%=board.getModDate() %></td>
                </tr>
            <%} %>
            </tbody>
        </table>
        <button onclick="location.href='boardWriteForm'">글쓰기</button>
    </div>
</body>
</html>