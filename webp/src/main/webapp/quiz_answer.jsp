<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈 답</title>
<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:useBean class="beans.NumBean" id="num" scope="session" />
	<h1 class="list_h1">퀴즈 답</h1>
	<form method="post" action="quiz_rate.jsp">
	<div class="list">
	<table>
	<tr>
	<th class="quiz_c">질문</th>
	<th class="quiz_c">답변</th>
	</tr>
	<%
		request.setCharacterEncoding("UTF-8");
		String jdbcUrl = "jdbc:mysql://localhost:3306/InternetDB";
		String dbId = "root";
		String dbPwd = "1234";
		int score = 0;
		int max = 0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
			Statement stmt = connection.createStatement();			
			ResultSet rs = stmt.executeQuery("select q_num,q_question,q_answer from quiz_"+num.getNum());
			while(rs.next()){
				out.println("<tr>");
				out.println("<td  class=\"quiz_q\">"+rs.getString("q_question")+"</td>");
				String ans = request.getParameter(rs.getString("q_num"));
				String real_ans = rs.getString("q_answer");
				if (ans.equals(real_ans)){
					out.println("<td class=\"quiz_q\">"+real_ans+"</td>");
					score++;
				}
				else{
					out.println("<td class=\"quiz_wq\">"+real_ans+"</td>");	
				}
				out.println("</tr>");
			}
			rs = stmt.executeQuery("select count(*) as cnt from quiz_"+num.getNum());
			rs.next();
			max = rs.getInt("cnt");
			out.println("<tr>");
			out.println("<td colspan=\"2\" class=\"quiz_how\">"+max+"문제 중 "+score+"문제 맞혔습니다!!</td>");
			out.println("</tr>");
			rs = stmt.executeQuery("select quiz_number from quizs where quiz_num="+num.getNum());
			rs.next();
			int quiznumber = rs.getInt("quiz_number");
			stmt.executeUpdate("update quizs set quiz_number="+(quiznumber+1)+" where quiz_num="+num.getNum());
		}
		
		catch (Exception ex)
		{
			out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
		}
	%>
	<tr>
	<td><input type="number" name="rate" min="0" max="10" class="quiz_answers" value="10"></td>
	<td><input type="submit" value="메인으로" class="quiz_answers"></td>
	</tr>
	</table>
	</div>
	</form>
</body>
</html>