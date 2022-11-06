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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c4fe4f7a920db65124e99252c9f6071e&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="resources/form22.css">
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
	<header>
			<h1><a href="home" style="text-decoration: none">Tour_Spot</a></h1>
	</header>
	<div class="nav" style="background-color: aliceblue;">
		<ul>
			<li><a href="guide">서비스안내</a></li>
			<li><a href="rental">차량대여</a></li>
			<li><a href="board">커뮤니티</a></li>
			<li><a href="notice">공지사항</a></li>
			<li><a href="userPage">마이페이지</a></li>
		</ul>
	</div>
	<section>
		<div class="form-container">
			<form method="post" action="">
				<input type="hidden" name="main_address" id="main_address"
					value="<%=board.getMap_addr()%>">
				<div style="width: 100%;">
					<input style="border: 0; font-size: 30px;background-color:transparent;margin-top:30px;margin-bottom:30px" type="text"
						value="<%=board.getTitle() %>" readonly>
				</div>
				<div class="main">
					<table style="width: 100%; border: 0;">
						<tr>
							<td style="text-align: left;"><%=board.getUser_id() %></td>
							<td style="text-align: right;font-weight:100"><%=board.getRegDate() %></td>
							<td style="text-align: left;font-weight:100"><%=board.getModDate() %></td>
							<td style="text-align: right;">조회수:<%=board.getViewCnt() %></td>
						</tr>
					</table>
				</div>
				<div class="content">
					<textarea rows="30" style="overflow: auto; font-size: 15px;background-color:transparent;border:0;"
						rows=30 readonly><%=board.getContent() %></textarea>
				</div>
				<div class="map_image">
					<div id="map" style="width: 500px; height: 400px;"></div>
					<div id="image">
						<img style="width: 500px;"
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20151213_181%2Fjhunkim319_1449977956807ksWaB_JPEG%2F%25B2%25C9_%25B9%25E8%25B0%25E6_%25C0%25CC%25B9%25CC%25C1%25F614.jpg&type=a340" />
					</div>
				</div>
				<div class="board_menu">
					<input type="button" onclick="location.href='board.jsp'"
						value="글 목록">
					<%
            if(id != null) {
            %>
					<input type="hidden" name="no" id="no" value="<%=board.getB_no()%>">
					<input type="button"
						onclick="location.href='boardUpdateForm.jsp?no=<%=board.getB_no() %>'"
						value="글 수정"> <input type="button"
						onclick="Javascript:button_event();" value="글 삭제">
					<%} %>
				</div>
			</form>

			<div class="cmt_container">
				<input type="hidden" name="id" class="user_id" value="<%=id%>">
				<input type="hidden" name="b_no" class="b_no" value="<%=b_no%>">
				<h4>댓글</h4>
				<textarea id="content" class="content" name="content"
					placeholder="댓글을 입력하세요." required></textarea>
			</div>
			<div class="cmt_button">
				<button name="createCmt-btn"
					onclick="createComment('<%=id%>', '<%=b_no%>')">등록</button>
				<button name="testButton" onclick="testfunc(`<%=id%>`, `<%=b_no%>`)">테스트</button>
			</div>
			<div class="cmt">
				<table>
					<tbody class="cmt_list">
						<%for(CommentDto cmt : list) {%>
						<tr>
							<td class="cmt_id"><%=cmt.getuser_id() %></td>
							<td class="cmt_modDate">(<%=cmt.getModDate() %>)</td>						
							<td colspan="2"><%=cmt.getContent() %></td>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
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
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>