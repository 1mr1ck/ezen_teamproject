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
<title>Insert title here</title>
</head>
<body>
	<%
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
					<td><a href="noticeView?no=<%=notice.getN_no()%>"><%=notice.getTitle() %></a></td>
					<td><%=notice.getUser_id() %></td>
					<td><%=notice.getRegDate() %></td>
					<td><%=notice.getRegDate() %></td>
					<td><%=notice.getViewCnt() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<button onclick="location.href='noticeWriteForm'">글쓰기</button>
	</div>
	<jsp:include page="footer.jsp" />
</html>