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
<title>Insert title here</title>
<link rel="stylesheet" href="resources/grid.css">
<link rel="stylesheet" href="resources/userJoinTest.css">
<link rel="stylesheet" href="resources/table.css">
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String userId = (String) sesion.getAttribute("log");
	BoardDao dao = BoardDao.getInstance();
	ArrayList<BoardDto> list = dao.getBoardUserAll(userId);
	%>
	<jsp:include page="header.jsp"/>
	<section class="userWrap">
	<ul class="userNav_list">
		<li><a href="userPageNew.jsp">정보 수정</a></li>
		<li><a href="myBoard.jsp">내가 쓴 게시글</a></li>
		<li><a href="">내가 쓴 댓글</a></li>
	</ul>
	<h1><a href="home" style="text-decoration:none">Tour_Spot</a></h1>
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
                    <td><%if(modDate != null) {%>
                   			<%=modDate%> <%} %></td>
                    <td><%=board.getViewCnt() %></td>
                </tr>
            <%} %>
            </tbody>
        </table>
    </div>
    </section>
    <jsp:include page="footer.jsp" />
</body>
</html>