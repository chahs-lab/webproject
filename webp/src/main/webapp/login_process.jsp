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
	<jsp:useBean class="beans.LoginBean" id="login" scope="session" />
	<%
			login.setId(request.getParameter("id"));
			login.setPwd(request.getParameter("pwd"));
			String jdbcUrl = "jdbc:mysql://localhost:3306/InternetDB";
			String dbId = "root";
			String dbPwd = "1234";
			Boolean loginornot = false;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery("select user_id,user_pwd from user");
				while(rs.next()){
					if (rs.getString("user_id").equals(login.getId())&&rs.getString("user_pwd").equals(login.getPwd())){
						loginornot = true;
					}
				}
			}
			catch (Exception ex)
			{
				out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
			}
			if (loginornot){
				response.sendRedirect("quiz_main.jsp");
			}
			else {
		%>
		<script>
		alert("아이디 또는 비밀번호가 다릅니다.");
		history.back();
		</script>
		<%
			}
		%>
</body>
</html>