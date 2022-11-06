<%@page import="comment.CommentDto"%>
<%@page import="comment.CommentDao"%>
<%@page import="java.util.ArrayList"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c4fe4f7a920db65124e99252c9f6071e&libraries=services"></script>
<link rel="stylesheet" href="resources/form.css">
<title>Tour_Spot</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("log");
	System.out.println("id : " + id);
	
	BoardDao dao = BoardDao.getInstance();
	BoardDto board = null;
	
	CommentDao commentDao = CommentDao.getInstance();
	int b_no = Integer.parseInt(request.getParameter("no"));
		
	if(request.getParameter("no") != null) {
		ArrayList<CommentDto> list = commentDao.getCommentAll(b_no);
		dao.updateViewCnt(b_no);
		board = dao.getBoardByNo(b_no);
	%>

	<h1>
		<a href="home" style="text-decoration: none">Tour_Spot</a>
	</h1>
	<div class="form-container">
		<form method="post" action="">
			<input type="hidden" name="main_address" id="main_address"
				value="<%=board.getMap_addr()%>"> <input type="text"
				value="<%=board.getTitle() %>" readonly>
			<textarea rows="20" readonly><%=board.getContent() %></textarea>
			<div id="map" style="width: 500px; height: 400px;"></div>
			<input type="button" onclick="location.href='board.jsp'" value="글 목록">
			<%
            if(id != null) {
            %>
			<input type="hidden" name="no" id="no" value="<%=board.getB_no()%>">
			<input type="button"
				onclick="location.href='boardUpdateForm.jsp?no=<%=board.getB_no() %>'"
				value="글 수정"> <input type="button"
				onclick="Javascript:button_event();" value="글 삭제">
			<%} %>
		</form>
	</div>
	<div class="cmt_container">
		<input type="hidden" name="id" class="user_id" value="<%=id%>">
		<input type="hidden" name="b_no" class="b_no" value="<%=b_no%>">
		<textarea id="content" class="content" name="content"
			placeholder="댓글을 입력하세요." rows="1"></textarea>
		<button name="create_cmt" onclick="createCmt(`<%=b_no%>`)">댓글등록</button>
	</div>
	<div>
		<table border="1">
			<tbody class="cmt_list" id="cmt_list">
				<%for(CommentDto cmt : list) {%>
				<tr>
					<td class="id"><%=cmt.getuser_id() %></td>
					<td class="content"><%=cmt.getContent() %></td>
					<%if(id.equals(cmt.getuser_id())) {%>
					<td><button name="update-cmt" onclick="updateCmt('<%=b_no%>', '<%=cmt.getc_no()%>')">수정</button></td>
					<td><button name="delete-cmt" onclick="deleteCmt('<%=b_no%>', '<%=cmt.getc_no()%>')">삭제</button></td>
					<%} %>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<%}
	else {
		response.sendRedirect("board"); // borad 조회 실패 -> 페이지 이동
	}%>
	<script src="resources/map.js"></script>
	<script src="resources/comment.js"></script>
	<script type="text/javascript">
		function button_event() {												// 삭제 확인
			if(confirm("정말 삭제하시겠습니까?") == true) {							// 확인
				alert("삭제되었습니다.");
				location.href="boardDeleteForm.jsp?no=<%=board.getB_no() %>"
			} else {															// 취소
				return;
			}
		}
	</script>
</body>
</html>