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
	<jsp:useBean class="beans.LoginBean" id="login" scope="session" />
	<%
		String jdbcUrl = "jdbc:mysql://localhost:3306/InternetDB";
		String dbId = "root";
		String dbPwd = "1234";
		String[] checkornot = request.getParameterValues("check");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("select * from quizs where quiz_maker=\""+login.getId()+"\"");
			for (int i = 0;i<checkornot.length;i++){
				stmt.executeUpdate("drop table quiz_"+checkornot[i]);
				stmt.executeUpdate("delete from quizs where quiz_num="+checkornot[i]);
			}
		}
		catch (Exception ex)
		{
			out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
		}
		response.sendRedirect("quiz_list_byme.jsp");
	%>
</body>
</html>