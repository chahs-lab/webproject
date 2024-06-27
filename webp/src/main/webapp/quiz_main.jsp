<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>퀴즈세상</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:useBean class="beans.LoginBean" id="login" scope="session" />
	<h1 class="login_h1">퀴즈 세상</h1>
	<div class="login">
	<h1><a href="quiz_list.jsp" class="goquiz">퀴즈 풀러 가기</a></h1>
	<h1><a href="quiz_make.jsp" class="goquizmake">퀴즈 만들러 가기</a></h1>
	<h1><a href="quiz_list_byme.jsp" class="goquizbyme">내가 만든 퀴즈</a></h1>
	</div>
	<a href="login.jsp" class="logout">로그아웃</a>
</body>
</html>