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
	<script type="text/javascript">
	function redirectLogin(){
		var xhr = new XMLHttpRequest();
		  //xhr.open("GET", "GameServlet?action=deconnect", true);
		  xhr.open("GET", "Deconnect", true);
		  xhr.onload = function() {
		    if (this.status == 200) {
		      // if the request is successful, redirect the user to the home page
		      window.location.href = "home.jsp";
		    }
		  };
		  xhr.send();
	}
	function redirectReplay() {
		var xhr = new XMLHttpRequest();
		  xhr.open("GET", "GameServlet?action=replay", true);
		  xhr.onload = function() {
		    if (this.status == 200) {
		      window.location.href = "playForm.jsp";
		    }
		  };
		  xhr.send();
		
	}
	</script>
	<style>
		.nice-button {
		  background-color: #ff7f50;
		  background-image: linear-gradient(to bottom right, #ff7f50, #ffaf40);
		  border: none;
		  border-radius: 5px;
		  color: #fff;
		  cursor: pointer;
		  display: inline-block;
		  font-size: 16px;
		  font-weight: bold;
		  padding: 10px 20px;
		  text-align: center;
		  text-decoration: none;
		  transition: all 0.3s ease;
  		  
		}
		
		.nice-button:hover {
		  background-image: linear-gradient(to bottom right, #ffaf40, #ff7f50);
		  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
		}
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
			body {
		  /*background: #76b852; /* fallback for old browsers */
		  background: rgb(141,194,111);
		  background: linear-gradient(90deg, rgba(141,194,111,1) 0%, rgba(118,184,82,1) 50%);
		  font-family: "Roboto", sans-serif;
		  -webkit-font-smoothing: antialiased;
		  -moz-osx-font-smoothing: grayscale;      
		}
		}
</style>
</head>
<body >
<button  class="nice-button" onclick="redirectReplay()" style="margin-left: 300px; margin-top: 30px;">Replay</button>
<button  class="nice-button" onclick="redirectLogin()" style="margin-left: 300px; margin-top: 30px;">Sign Out</button>
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