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
		<div class="search">
			<input type="text" placeholder="주소 검색">
			<a href="search.jsp"><img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"></a>
		</div>
    </section>
    <jsp:include page="footer.jsp"/>
</body>
</html>