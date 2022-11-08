<%@page import="java.sql.Timestamp"%>
<%@page import="notice.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="notice.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/boardTable.css">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = (String)session.getAttribute("log");
	NoticeDao dao = NoticeDao.getInstance();
	ArrayList<NoticeDto> list = dao.getNoticeAll();
	%>
</body>
	<jsp:include page="header.jsp" />
	<div class="table-container">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th width="200px">제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>등록날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%for(NoticeDto notice : list) {%>
				<tr>
					<td><%=notice.getN_no() %></td>
					<td><a href="noticeView.jsp?no=<%=notice.getN_no()%>"><%=notice.getTitle() %></a></td>
					<td><%=notice.getUser_id() %></td>
					<td><%=notice.getRegDate() %></td>
					<td><%=notice.getRegDate() %></td>
					<td><%=notice.getViewCnt() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<div style="width:100%;">
		<%if(id != null) {%>
			<%if(id.equals("admin")) {%>
			<button onclick="location.href='noticeWriteForm.jsp'">글쓰기기</button>
			<%}%>
		<%}%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</html>