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
	<%
			String jdbcUrl = "jdbc:mysql://localhost:3306/InternetDB";
			String dbId = "root";
			String dbPwd = "1234";
			String newId = request.getParameter("id");
			String newPwd = request.getParameter("pwd");
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery("select user_id from user");
				while(rs.next()){
					if (rs.getString("user_id").equals(newId)){
					%>
					<script>
					alert("이미 존재하는 ID입니다.");
					history.back();
					</script>
					<%
					}
				}
				stmt.executeUpdate("insert into user value(\""+newId+"\",\""+newPwd+"\")");
				%>
				<script>
				alert("성공적으로 생성되었습니다.");
				document.location.href = "login.jsp";
				</script>
				<%
			}
			catch (Exception ex)
			{
				out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
			}
		%>
</body>
</html>