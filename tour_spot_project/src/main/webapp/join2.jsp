<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
ul, li {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none
}

.start, .info {
	width: 650px;
	margin: 0 auto;
	padding: 0;
}

.start {
	padding: 50px 0 0;
	border-bottom: 3px solid #000;
}

.info {
	margin: 20px auto 0;
}

h2 {
	text-align: center;
	font-size: 30px;
	padding: 30px;
}

.start>p {
	font-size: 20px;
	font-weight: 600;
	padding: 10px 0 10px;
}

label {
	width: 120px;
	height: 10px;
	display: inline-block;
	font-size: 16px;
	font-weight: 500px;
	;
}

#userId, #passWd, #passWdCheck, #userName, #text, #email {
	width: 650px;
	height: 40px;
	border: 1px solid #d8d7d7;
	margin: 5px 0 15px;
}

#userNickName {
	width: 650px;
	height: 40px;
	border: 1px solid #d8d7d7;
	margin-top: 5px;
}

.join>p {
	margin-top: 0;
	margin-bottom: 15px;
	font-size: 12px;
}

.join>li>input {
	padding-left: 5px;
}

.must {
	color: red;
}

.btn {
	width: 650px;
	height: 50px;
	background-color: #f0812d;
	text-align: center;
	color: #fff;
	line-height: 50px;
	border-radius: 30px;
	margin: 20px auto 0;
	display: block;
	font-size: 15px;
	font-weight: 600;
	border: none
}

.btn:hover {
	background-color: #a52a2a;
}

body {
	width: 100vw;
	height: 100vh;
}

.join_container {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
</style>
<link rel="stylesheet" href="resources/joinUser.css">
<title>Insert title here</title>
</head>
<body>
	<div class="join_container">
		<div class="start">
			<h2>회원가입</h2>
			<p>기본정보</p>
		</div>
		<div class="info">
			<form action="" method="post" name="join" id="join">
				<ul class="join">
					<li><label for="userId">아이디</label></li>
					<li><input type="text" id="userId" name="userId"
						placeholder="영문,숫자_만 입력가능, 최소 8자 이상" /></li>
					<li><label for="passWd">비밀번호</label></li>
					<li><input type="password" id="passWd" name="passWd"
						placeholder="비밀번호는 영문+숫자를 혼합하여 8글자 이상 입력하시기 바랍니다." /></li>
					<li><label for="passWdCheck">비밀번호 확인</label></li>
					<li><input type="password" id="passWdCheck" name="passWdCheck"
						placeholder="비밀번호는 영문+숫자를 혼합하여 8글자 이상 입력하시기 바랍니다." /></li>
					<li><label for="userName">이름<span class="must">*</span></label></li>
					<li><input type="text" id="userName" name="userName"
						placeholder="이름을 입력해주세요." /></li>
					<li><label for="userNickName">닉네임</label></li>
					<li><input type="text" id="userNickName" name="userNickName"
						placeholder="닉네임" /></li>
					<li><label for="email">이메일<span class="must">*</span></label></li>
					<li><input type="email" id="email" name="email"
						placeholder="이메일" /></li>
					<li>
						<button class="btn" type="submit">회원가입</button>
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>