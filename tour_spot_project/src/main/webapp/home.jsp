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
    <section style="height:100vh;">
    	<div class="search-box">
			<input type="text" class="search-txt" name="" placeholder="주소 검색">
			<a class="search-btn" href="#"><i class="fas fa-search"></i></a>
		</div>
    </section>
    <jsp:include page="footer.jsp"/>
</body>
</html>