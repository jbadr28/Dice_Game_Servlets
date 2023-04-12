<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>
	<h1 style="color:red;text-align:center">Dice Game</h1>
	<h3 style="text-align:center"><i>Enter your login & password to have access to the game</i></h3>
	<hr>
	<div class="form-group" align="center">
		<a href="SignUpForm.jsp">Sign Up</a>
		<br>
		<form action="LoginServlet" method="POST">
			<div class="form-group">
				<label for="exampleInputEmail4">Login:</label> 
				<input type="username"  name="Login" aria-describedby="emailHelp" placeholder="Enter Login">
			</div>
			<div>
			<label>Password:</label> 
			<input type="password" name="password">
			</div>
			
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	<hr>
</body>
</html>