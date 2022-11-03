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
	<h1>Tour_Spot</h1>
	<div class="form-container">
		<form method="post" action="boardWrite">
			<input type="text" name="title" placeholder="제목" required>
			<textarea name="content" rows="20" placeholder="글내용" required></textarea>
			<input type="text" name="postcode" id="postcode" placeholder="우편번호">
			<input type="button" onclick="addressSearch()" value="우편번호 찾기"> 
			<input type="text" name="main_address" id="main_address" placeholder="주소">
			<input type="text" name="detail_address" id="detail_address" placeholder="상세주소">
			<div id="map" style="width:500px;height:400px;"></div>
			<input type="submit" value="글등록">
		</form>
	</div>
	
	<script src="resources/map.js"></script>
</body>
</html>