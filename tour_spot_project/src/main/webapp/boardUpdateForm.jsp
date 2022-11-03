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
    <link rel="stylesheet" href="resources/form.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c4fe4f7a920db65124e99252c9f6071e&libraries=services"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<title>Tour_Spot</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	BoardDao dao = BoardDao.getInstance();
	BoardDto board = null;
	
	if(request.getParameter("no") != null) {
		int b_no = Integer.parseInt(request.getParameter("no"));
		board = dao.getBoardByNo(b_no); %>
	
    <h1>Tour_Spot</h1>
    <div class="form-container">
        <form method="post" action="boardUpdateAction">
        	<input type="hidden" name="b_no" value="<%=b_no%>">
            <input type="text" name="title" value="<%=board.getTitle() %>">
            <textarea name="content" rows="20"><%=board.getContent() %></textarea>
            <input type="text" name="postcode" id="postcode" placeholder="우편번호">
			<input type="button" onclick="addressSearch()" value="우편번호 찾기"> 
			<input type="text" name="main_address" id="main_address" placeholder="주소">
			<input type="text" name="detail_address" id="detail_address" placeholder="상세주소">
            <div id="map" style="width:500px;height:400px;"></div>
            <input type="submit" value="수정하기">
        </form>
    </div>
	<%}
	else {
		response.sendRedirect("board"); // borad 조회 실패 -> 페이지 이동
		System.out.println("조회실패");
	}%>
	
	<script src="resources/searchMap.js"></script>
</body>
</html>