<%@page import="notice.NoticeDto"%>
<%@page import="notice.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/form22.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap');
</style>
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("log");
	System.out.println(id);
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto dto = null;
	int n_no = Integer.parseInt(request.getParameter("no"));
	System.out.println(n_no);
	if(n_no > 0) {
		dto = dao.getNoticeByNo(n_no);
	%>
	<jsp:include page="header.jsp" />
	<section>
		<div class="form-container">
			<div style="width : 100%;">
				<input class="title" type="text" value="<%=dto.getTitle() %> readonly">
			</div>
		</div>
		<div class="main">
			<table style="width: 100%; height: 60px;border-top: solid 1px; border-bottom: solid 1px; border-left: none; border-right: none;">
				<tr>
					<td class="user" style="text-align: left;"><%=dto.getUser_id()%></td>
					<td class="date" style="text-align: center; font-weight: 100"><%=dto.getRegDate()%></td>
					<td class="view" style="text-align: right;">조회수:<%=dto.getViewCnt()%></td>
				</tr>
			</table>			
		</div>
		<div class="con">
			<textarea rows="20" readonly><%=dto.getContent()%></textarea>
		</div>
		<div class="board_menu">
			<input class="list-button" type="button" onclick="location.href='notice'" value="글 목록">
			<%if (id.equals("admin")) {%>
			<input type="hidden" name="no" id="no" value="<%=dto.getN_no()%>">
			<input class="list-button" type="button" onclick="Javascript:button_event();" value="글 삭제">
			<%}%>
		</div>		
	</section>
	<%} else {
	response.sendRedirect("notice");
	}%>
	<script type="text/javascript">
		function button_event() { // 삭제 확인
			if (confirm("정말 삭제하시겠습니까?") == true) { // 확인
				alert("삭제되었습니다.");
				location.href = "noticeDeleteAction?no=<%=dto.getN_no() %>"
			} else {															// 취소
				return;
			}
		}
	</script>
</body>
</html>