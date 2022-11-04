<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천하는 관광지</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
    <section>
    	<input type = "text" id="searchWord" placeholder="검색어를 입력하세요." onkeyup="search(this);">
    	<button type="button" id="btn_search">검색</button>
		<ul id="boardList"></ul> <!-- 검색리스트가 나타나는 영역 -->
    </section>
    <jsp:include page="footer.jsp"/>
</body>
</html>
