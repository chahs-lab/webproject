<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
	<h1 class="login_h1">계정 생성</h1>
	<form method="post" action="login_new_process.jsp">
	<div class="login">
		<p class="login_id_txt">아이디</p>
		<input type="textbox" value="id" name="id" class="login_id">
		<p class="login_pwd_txt">비밀번호</p>
		<input type="password" value="password" name="pwd" class="login_pwd">
		<input type="submit" value="계정 생성" class="login_submit_2">
	</div>
	</form>
</body>
</html>