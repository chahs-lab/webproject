<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈 풀기</title>
<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
	<a href="quiz_list.jsp" class="back">뒤로가기</a>
	<jsp:useBean class="beans.NumBean" id="num" scope="session" />
	<h1 class="list_h1">퀴즈 풀기</h1>
	<form method="post" action="quiz_answer.jsp">
	<div class="list">
	<table>
	<tr>
	<th class="quiz_c">질문</th>
	<th class="quiz_c">답변</th>
	</tr>
	<% 
		num.setNum(request.getParameter("num"));
		request.setCharacterEncoding("UTF-8");
		String jdbcUrl = "jdbc:mysql://localhost:3306/InternetDB";
		String dbId = "root";
		String dbPwd = "1234";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("select q_num,q_question,q_answer from quiz_"+num.getNum());
			while(rs.next()){
				out.println("<tr>");
				out.println("<td class=\"quiz_q\">"+rs.getString("q_question")+"</td>");
				out.println("<td class=\"quiz_q\"><input class=\"quiz_a\" type=\"text\" name=\""+rs.getString("q_num")+"\"></td>");
				out.println("</tr>");
			}
		}
		catch (Exception ex)
		{
			out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
		}
	%>
	<tr>
	<td colspan='2'><input type="submit" value="정답 확인" class="quiz_answer"></td>
	</tr>
	</table>
	</div>
	</form>
</body>
</html>