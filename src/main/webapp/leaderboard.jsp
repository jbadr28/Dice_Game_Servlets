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
	<style>
		table {
			border-collapse: collapse;
			width: 100%;
			max-width: 800px; /* adjust as needed */
			margin: 0 auto; /* center the table */
			padding-bottom: 10%;
		}
		
		thead {
			
			background-color: #f9f9f9;
		}
		
		th {
			background-color: #4CAF50;
			color: white;
			font-weight: bold;
			padding: 12px;
			text-align: center;
		}
		
		td {
			border: 5px solid #ddd;
			padding: 8px;
		}
		
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		
		tr:hover {
			background-color: #ddd;
		}
		
		@media screen and (max-width: 600px) {
			/* Responsive styles for small screens */
			table, thead, tbody, th, td, tr {
				display: block;
			}
			th {
				text-align: center;
			}
			td {
				text-align: center;
				border: none;
				position: relative;
				padding-left: 50%;
			}
			td:before {
				position: absolute;
				left: 6px;
				content: attr(data-label);
				text-align: left;
				font-weight: bold;
			}
		}
</style>
</head>
<body >
<form action="LeaderBoardServlets" m>
<table
				style="text-align: center; font-size: 15px; line-height: 30px; margin-left: auto; margin-right: auto; margin-top: 10px;">
				<thead>
					<tr>
						<th>User Name</th>
						<th>Best Score</th>
					</tr>
				</thead>
				<tbody>
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
				</tbody>
			</table>
			</form>
</body>
</html>