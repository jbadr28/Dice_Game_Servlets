<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body style="background-color: black;text-align: center;padding: 70px 0;">
	<h1 style="color:white;font-size: 100px;color:red;"><% 
		String error = (String) request.getAttribute("error");
		out.println(error);
	%></h1>
		<div class="panel panel-default" style="border-color: black;margin-left: auto; margin-right: auto;width: 800px; height: 500px; padding: 50px 0">
  		<div class="panel-body" style="text-align:center;background-color:red;padding: 50px 0; border-radius: 100px;border-color: black;border: 5px solid;line-height: 60px;color:black"><b>Please change Login and UserName</b><br>
  			<a href="SignUpForm.jsp" style="text-align:center;border: 5px solid;">Sign UP</a>
  		</div>
	</div>
</body>
</html>