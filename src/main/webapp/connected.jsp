<%@page import="com.ba.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body style="background-color: green">
	<h1 style="text-align:center;background-color:powderblue; border-radius: 50px;border-color: Red;border-width: thick;padding: 50px 0;border: 5px solid;">Welcome <%
	 User us = (User) request.getSession().getAttribute("connecteduser");
	out.print(" "+us.getLogin()+", You are Successfully connected"); %></h1>
	<div class="panel panel-default" style="border-color: black;margin-left: auto; margin-right: auto;width: 800px; height: 500px; padding: 50px 0;">
  		<div class="panel-body" style="text-align:center;background-color:powderblue;padding: 50px 0; border-radius: 100px;border-color: Red;border: 5px solid;line-height: 60px"><b>You can now play the game or check the LeaderBoard</b><br>
  			<a href="playForm.jsp" style="text-align:center;border: 5px solid;">Start the game</a><br>
  			<a href="leaderboard.jsp" style="text-align:center;border: 5px solid;"> The LeadBoard</a>
  		</div>
	</div>
</body>
</html>