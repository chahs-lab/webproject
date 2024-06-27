<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈 만들기</title>
<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
	<a href="quiz_main.jsp" class="back">뒤로가기</a>
	<script type="text/javascript" src="script.js"></script>
	<form method="post" action="quiz_make_process.jsp">
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<h1 class="list_h1">문제 만들기</h1>
	<div class="list">
	<table id='table'>
		<tr>
			<td class="table_num">이름</td>
			<td colspan="3" class="q_name_insert"><input type="text" name="q_name" class="quiz_a"></td>
		</tr>
		<tr>
			<td class="table_num">번호</td>
			<td>문제</td>
			<td>답</td>
			<td class="table_num"></td>
		</tr>
		<tr>
			<td>1</td>
			<td><input class="quiz_a" type="text" name="question"></td>
			<td><input class="quiz_a" type="text" name="answer"></td>
			<td><input type="checkbox">
		</tr>
		<tr>
			<td></td>
			<td><input class="tableeq" type="button" name="addq" value="문제 추가" onclick="addRow()"></td>
			<td><input class="tableeq" type="button" name="minusq" value="문제 삭제" onclick="subRow()"></td>
			<td><input class="tableeq" type="submit" value="저장하기"></td>
		</tr>
	</table>
	</div>
	</form>
</body>
</html>