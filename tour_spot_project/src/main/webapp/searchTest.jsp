<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<div class="grid">
	<header>
		<div>
			<select class="area" name="area">
				<option value="전체">전체</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="강원">강원</option>
				<option value="충북">충북</option>
				<option value="충남">충남</option>
				<option value="경북">경북</option>
				<option value="경남">경남</option>
				<option value="전북">전북</option>
				<option value="전남">전남</option>
			</select>
			<button id="search-btn" onclick="getSpotByRegion()">검색</button>
		</div>
	</header>
	<section>
		<table>
			<thead class="spotTitle"></thead>
			<tbody class="spotInfo"></tbody>
		</table>
	</section>
	</div>
	<script src="resources/searchByRegion.js"></script>
</body>
</html>