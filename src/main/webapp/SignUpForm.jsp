<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	<h1 style="text-align:center">Create your Account</h1>
	<hr>
	<div class="form-group" align="center">
		<br>
		<form action="CreateUserServlet" method="POST">
		<input type="hidden"  name="action" value="create">
			<div class="form-group">
				<label for="exampleInputEmail4">Name:</label> 
				<input type="username"  name="name" aria-describedby="emailHelp" placeholder="Enter your name">
			</div>
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