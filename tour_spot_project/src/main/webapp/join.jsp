<%@page import="model.KakaoProfile"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
	<script src="https://kit.fontawesome.com/fa861a7902.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="resources/userJoin.css">
<title>EZEN RENTAL CAR [ JOIN ]</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	UserDao dao = UserDao.getInstance();
	int no = dao.noGenerator();
	KakaoProfile profile = (KakaoProfile) request.getAttribute("profile");
	if(profile!=null){
		System.out.println(profile.getId());
	}
	%>
	 
	<!-- 회원코드/이름/나이/성별/아이디/주소/폰번/패스워드 -->
	<jsp:include page="header.jsp" />
	<section>
        <form class="wrap_outer" method="POST" action="JoinAction">
            <div class="wrap_out">
                <div class="wrap_in">
                <!--아이디 , 비밀번호 비밀번호 확인-->
                    <!-- 비밀번호 -->
                    <div class="ininfo">
                        <h3>아이디</h3>
                        <span class="info_box">
                            <input type="text" id="join_id" name="id" value="<%=profile==null?"":profile.getEmail()%>">
                            <span class="info_box_icon">@email.com</span>
                        </span>
                        <span class="error"></span>
                    </div>
                    <!-- 비밀번호 -->
                    <div class="ininfo">
                        <h3>비밀번호</h3>
                        <span class="info_box">
                            <input class="info_box_input" type="text" id="join_pw1" name="password">
                            <span class="info_box_icon"><i class="fa-solid fa-key"></i></span>
                        </span>
                        <span class="error"></span>
                    </div>
                    <div class="ininfo">
                        <h3>비밀번호 확인</h3>
                        <span class="info_box">
                            <input class="info_box_input" type="text" id="join_pw2" name="passwordCheck">
                            <span class="info_box_icon"><i class="fa-solid fa-key"></i></span>
                        </span>
                        <span class="error"></span>
                    </div>
                <!--닉네임 생년월일 성별-->
                    <div class="ininfo">
                        <h3>닉네임</h3>
                        <span class="info_box">
                            <input class="info_box_input"  type="text" id="join_name" name="name">
                            <span class="info_box_icon"><i class="fa-regular fa-square-check"></i></span>
                        </span>
                        <span class="error"></span>
                    </div>
                    <div class="ininfo">
                        <h3>생년월일</h3>
                        <span> <input class="info_box_input calendar" type="date" id="join_date" name="birthday"></span>
                        <span class="error"></span>
                    </div>
                    <!--성별-->
                    <div class="ininfo">
                        <h3>성별</h3>
                        <span> <input class="info_box_input calendar" type="date" id="join_date" name="birthday"></span>
                        <span class="error"></span>
                    </div>
                    <!--주소-->
                    <div class="ininfo">
                        <div class="addr_button">
                            <h3>주소 </h3> <button class="addr_search_button"> 찾기</button>
                        </div>
                        <span class="info_box">
	                        <input class="info_box_input_stic" type="text" id="join_addr1">
	                        <input class="info_box_input"  type="text" id="join_addr2" name="address">
                        </span>
                        <span class="error"></span>
                    </div>
                    <br>
                    <!--전화번호-->
                    <div class="ininfo">
                        <h3>전화번호</h3>
                        <ul class="info_phone">
                            <li><input type="text" class="checkPhone1" name="phone1"></li>
                            <li><input type="text" class="checkPhone2" name="phone2"></li>
                            <li><input type="text" class="checkPhone3" name="phone3"></li>
                        </ul>
                        <span class="error"></span>
                    </div>
                    <!--몰래 넘기는 정보-->
                    <input type="hidden" name="no" id="no" value="<%=no %>">
                    <input type="hidden" name="token" id="token" value="<%=profile==null?"":profile.getId() %>">
                    <!-- 회원가입 -->
                    <button class="info_bnt_submit" disabled >회원가입</button>
                </div>
            </div>
        </form>
    </section>
	<script src="resources/join.js" charset="utf-8"></script>
	<jsp:include page="footer.jsp" />
</body>
</html>