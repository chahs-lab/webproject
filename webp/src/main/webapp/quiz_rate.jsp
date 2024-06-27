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
	<jsp:useBean class="beans.NumBean" id="num" scope="session" />
	<%
			String jdbcUrl = "jdbc:mysql://localhost:3306/InternetDB";
			String dbId = "root";
			String dbPwd = "1234";
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery("select quiz_number,quiz_rate from quizs where quiz_num="+num.getNum());
				rs.next();
				int quiznumber = rs.getInt("quiz_number");
				float quizrate = rs.getFloat("quiz_rate");
				float newrate = (quizrate*(quiznumber-1)+Integer.parseInt(request.getParameter("rate")))/quiznumber;
				newrate = Float.parseFloat(String.format("%.1f",newrate));
				stmt.executeUpdate("update quizs set quiz_rate="+newrate+" where quiz_num="+num.getNum());
				response.sendRedirect("quiz_main.jsp");
			}
			catch (Exception ex)
			{
				out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
			}
	%>
</body>
</html>