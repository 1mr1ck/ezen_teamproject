<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/form.css">
<title>Tour_Spot</title>
</head>
<body>
	<h1>Tour_Spot</h1>
	<div class="form-container">
		<form method="post" action="commentWriteAction">
		<textarea name="content" rows="20" placeholder="댓글내용" required></textarea>
            <input type="submit" value="글등록">
		</form>
	</div>
</body>
</html>