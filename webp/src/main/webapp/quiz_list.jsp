<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈 사이트</title>
<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
	<a href="quiz_main.jsp" class="back">뒤로가기</a>
	<h1 class="list_h1">등록된 퀴즈</h1>
	<div class="list">
	<table>
	<tr>
	<th class="table_num">번호</th>
	<th class="table_name">이름</th>
	<th class="table_maker">만든이</th>
	<th class="table_number">푼 횟수</th>
	<th class="table_rate">평점</th>
	</tr>
	<%
		String jdbcUrl = "jdbc:mysql://localhost:3306/InternetDB";
		String dbId = "root";
		String dbPwd = "1234";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("select * from quizs");
			while(rs.next()){
				out.println("<tr>");
				out.println("<td class=\"table_num\"><a href=\"quiz.jsp?num="+rs.getString("quiz_num")+"\">"+rs.getString("quiz_num")+"</a></td>");
				out.println("<td class=\"table_name\"><a href=\"quiz.jsp?num="+rs.getString("quiz_num")+"\">"+rs.getString("quiz_name")+"</a></td>");
				out.println("<td class=\"table_maker\">"+rs.getString("quiz_maker")+"</td>");
				out.println("<td class=\"table_number\">"+rs.getString("quiz_number")+"회</td>");
				out.println("<td class=\"table_rate\">"+rs.getString("quiz_rate")+"점</td>");
				out.println("</tr>");
			}
		}
		catch (Exception ex)
		{
			out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
		}
	%>
	</table>
	</div>
</body>
</html>