<%@page import="notice.NoticeDto"%>
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
	
	<script>alert("삭제되었습니다.")</script>
	
	<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("log");
	
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto notice = null;
	
	if(request.getParameter("no") != null) {
		int b_no = Integer.parseInt(request.getParameter("no"));
		notice = dao.getNoticeByNo(b_no);
		dao.deleteNotice(notice);
		response.sendRedirect("notice");
	}%>
</body>
</html>