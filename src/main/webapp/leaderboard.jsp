<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.ServletContext" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						
						HashMap<String,Integer> list = (HashMap<String,Integer>) request.getSession().getAttribute("sortedLeaderBoard");
						for(Map.Entry<String,Integer> ut: list.entrySet()){
						
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