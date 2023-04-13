<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.ServletContext" %>
<%@ page import="com.ba.LeaderBoard" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>LeaderBoard</title>
</head>
<body>
<form action="LeaderBoardServlets" m>
<table
				style="text-align: center; font-size: 15px; line-height: 30px; margin-left: auto; margin-right: auto; margin-top: 10px;">
				<tr>
					<th>User Name</th>
					<th>Best Score</th>
				</tr>
				<% 
						
						HashMap<String,Integer> list = (HashMap<String,Integer>) getServletContext().getAttribute("leaderboard");
						HashMap<String,Integer> sorted = LeaderBoard.sortByValue(list);
						for(Map.Entry<String,Integer> ut: sorted.entrySet()){
						
						out.print("<tr>");
							out.print("<td>"+ut.getKey()+"</td>");
							out.print("<td>"+ut.getValue()+"</td>");
							out.print("</tr>");
						
	
						}
						%>
			</table>
			</form>
</body>
</html>