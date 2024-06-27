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
	<jsp:useBean class="beans.LoginBean" id="login" scope="session" />
	<form method="post" action="quiz_main.jsp">
	<%
		request.setCharacterEncoding("UTF-8");
		String quiz_name = request.getParameter("q_name");
		String[] questions = request.getParameterValues("question");
		String[] answers = request.getParameterValues("answer");
		String jdbcUrl = "jdbc:mysql://localhost:3306/InternetDB";
		String dbId = "root";
		String dbPwd = "1234";
		int newquiz_num = 1;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("select count(*) as cnt from quizs");
			rs.next();
			newquiz_num += rs.getInt("cnt");
			stmt.executeUpdate("create table quiz_"+newquiz_num+"(q_num int primary key,q_question varchar(45) not null, q_answer varchar(45) not null)");
			stmt.execute("insert into quizs value("+newquiz_num+",\""+quiz_name+"\",\""+login.getId()+"\",0,0)");
			for (int i = 0; i<questions.length;i++){
				stmt.executeUpdate("insert into quiz_"+newquiz_num+" value("+(i+1)+",\""+questions[i]+"\",\""+answers[i]+"\")");
			}
		}
		catch (Exception ex)
		{
			out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
		}
	%>
	<h1 class="login_h1">퀴즈 등록 성공</h1>
	<div class="qmp">
	<input type="submit" value="메인으로" class="gomain">
	</div>
	</form>
</body>
</html>