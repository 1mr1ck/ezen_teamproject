<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/index.css">
<title>사용자들이 직접 만드는 관광지</title>
</head>
<body>
    <div class="index">
        <form method="post" action="LoginAction">
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" class="id"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="password" class="password"></td>
                </tr>
            </table>
            <input type="submit" value="로그인">
            <input type="button" onclick="location.href='join'" value="회원가입"><br>
            <input type="button" value="카카오 로그인"><br>
            <input type="button" onclick="location.href='home'" value="비회원">
        </form>
    </div>
</body>
</html>