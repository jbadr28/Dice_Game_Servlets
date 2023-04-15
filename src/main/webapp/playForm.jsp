<%@page import="javax.imageio.plugins.tiff.GeoTIFFTagSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="com.servlets.GameServlet" %>
<%@ page import="com.ba.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game</title>

		<style type="text/css">
		@import url(https://fonts.googleapis.com/css?family=Roboto:300);
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
		.login-page {
		  width: 360px;
		  padding: 8% 0 0;
		  margin: auto;
		}
		.form {
		  position: relative;
		  z-index: 1;
		  background: #FFFFFF;
		  max-width: 360px;
		  margin: 0 auto 100px;
		  padding: 45px;
		  text-align: center;
		  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		}
		.form input {
		  font-family: "Roboto", sans-serif;
		  outline: 0;
		  background: #f2f2f2;
		  width: 100%;
		  border: 0;
		  margin: 0 0 15px;
		  padding: 15px;
		  box-sizing: border-box;
		  font-size: 14px;
		}
		.form button {
		  font-family: "Roboto", sans-serif;
		  text-transform: uppercase;
		  outline: 0;
		  background: #4CAF50;
		  width: 100%;
		  border: 0;
		  padding: 15px;
		  color: #FFFFFF;
		  font-size: 14px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		}
		.form button:hover,.form button:active,.form button:focus {
		  background: #43A047;
		}
		.form .message {
		  margin: 15px 0 0;
		  color: #b3b3b3;
		  font-size: 12px;
		}
		.form .message a {
		  color: #4CAF50;
		  text-decoration: none;
		}
		.form .register-form {
		  display: none;
		}
		.container {
		  position: relative;
		  z-index: 1;
		  max-width: 300px;
		  margin: 0 auto;
		}
		.container:before, .container:after {
		  content: "";
		  display: block;
		  clear: both;
		}
		.container .info {
		  margin: 50px auto;
		  text-align: center;
		}
		.container .info h1 {
		  margin: 0 0 15px;
		  padding: 0;
		  font-size: 36px;
		  font-weight: 300;
		  color: #1a1a1a;
		}
		.container .info span {
		  color: #4d4d4d;
		  font-size: 12px;
		}
		.container .info span a {
		  color: #000000;
		  text-decoration: none;
		}
		.container .info span .fa {
		  color: #EF3B3A;
		}
		body {
		  /*background: #76b852; /* fallback for old browsers */
		  background: rgb(141,194,111);
		  background: linear-gradient(90deg, rgba(141,194,111,1) 0%, rgba(118,184,82,1) 50%);
		  font-family: "Roboto", sans-serif;
		  -webkit-font-smoothing: antialiased;
		  -moz-osx-font-smoothing: grayscale;      
		}
	</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
</head>
<h2 style="text-align: center">Welcome <%
	 				User us = (User) request.getSession().getAttribute("connecteduser");
					out.print("<b><a style=\"color:gold\"> "+us.getLogin()+"</a></b>, You are Successfully connected"); %></h2>
<body >
	<form action="GameServlet" method="POST">
		<div style="width: 100%; display: table; border-spacing: 40px;">
   			<div style="display: table-row">
        		<div style="text-align:center;background-color:powderblue;padding: 50px 0; border-radius: 50px;border-color: Red;border: 5px solid;line-height: 60px;width: 600px; display: table-cell;"> 
        			<select name="diceNumber"
					style="background-color: green;border-color: gb(52, 75, 11); font-size: 20px; text-align: center;">
						<option value="none">Pick a Dice</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select><br>
				<input
					style="color: white; background-color: rgb(52, 75, 11); border-color: white; font-size: 20px; text-align: center; margin-top: 7%"
					type="submit" name="lance" value="Roll a Dice">
	
        		</div>
        		<script type="text/javascript">
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
				function popup(){
					const swalWithBootstrapButtons = Swal.mixin({
						  customClass: {
						    confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						  },
						  buttonsStyling: false
						})
						swalWithBootstrapButtons.fire({
						  title: 'Your score is -1 !!!',
						  text: "You have launched a dice two times in one party!",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonText: 'Play Again',
						  cancelButtonText: 'Log Out',
						  reverseButtons: true
						}).then((result) => {
						  if (result.isConfirmed) {
						    swalWithBootstrapButtons.fire(
						      'A new Party will be launched',
						      'you will be redirected to start a new game party',
						      'success'
						    )
						    redirectReplay();
						  } else if (
						    /* Read more about handling dismissals below */
						    result.dismiss === Swal.DismissReason.cancel
						  ) {
						    swalWithBootstrapButtons.fire(
						      'Singing Out',
						      'You will be redirected to the Log In Page',
						      'info'
						    )
						    redirectLogin();
						  }
						})
				}
				function gamepartyend(param){
					const swalWithBootstrapButtons = Swal.mixin({
						  customClass: {
						    confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						  },
						  buttonsStyling: false
						})
						swalWithBootstrapButtons.fire({
						  title: 'Your score is '+param+' ',
						  text: "this game party is over!",
						  icon: 'info',
						  showCancelButton: true,
						  confirmButtonText: 'Play Again',
						  cancelButtonText: 'Log Out',
						  reverseButtons: true
						}).then((result) => {
						  if (result.isConfirmed) {
						    swalWithBootstrapButtons.fire(
								'A new Party will be launched',
								'you will be redirected to start a new game party',
								'success'
						    )
						    redirectReplay();
						  } else if (
						    /* Read more about handling dismissals below */
						    result.dismiss === Swal.DismissReason.cancel
						  ) {
						    swalWithBootstrapButtons.fire(
								'Singing Out',
								'You will be redirected to the Log In Page',
								'info'
						    )
						    redirectLogin();
						  }
						})
				}
        		</script>
        		
        		<div style="text-align:center;background-color:powderblue;padding: 30px 0; border-radius: 50px;border: 5px solid;display: table-cell;"> 
					
					<% 
						if(request.getSession().getAttribute("GameParyEnd")!=null){
					        out.print("<script type=\"text/javascript\">");
					       	int score = (Integer)request.getSession().getAttribute("score");
							out.print("gamepartyend(\""+score+"\" );");
							out.print("</script>");
						}
						if(request.getSession().getAttribute("error")!=null){
						        out.print("<script type=\"text/javascript\">");
								out.print("popup();");
								out.print("</script>");
 
						}
						if(request.getSession().getAttribute("dice")==null){
							out.print("<h3>not played yet</h3>");
						} else{
							out.print("<h3>"+request.getSession().getAttribute("dice")+"</h3>");
						}
						if(request.getSession().getAttribute("result")!=null){
							int result = (int) request.getSession().getAttribute("result");
							out.print("<h3>the result is "+result+"</h3><br>");
							String image = "picture/"+result;
							out.print("<img src=\"picture/"+result+".png\" alt=\"Dice\" width=\"256\" height=\"256\">");
						} else{
							out.print("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"64\" height=\"64\" fill=\"currentColor\" class=\"bi bi-exclamation-octagon\" viewBox=\"0 0 16 16\"><path d=\"M4.54.146A.5.5 0 0 1 4.893 0h6.214a.5.5 0 0 1 .353.146l4.394 4.394a.5.5 0 0 1 .146.353v6.214a.5.5 0 0 1-.146.353l-4.394 4.394a.5.5 0 0 1-.353.146H4.893a.5.5 0 0 1-.353-.146L.146 11.46A.5.5 0 0 1 0 11.107V4.893a.5.5 0 0 1 .146-.353L4.54.146zM5.1 1 1 5.1v5.8L5.1 15h5.8l4.1-4.1V5.1L10.9 1H5.1z\"/><path d=\"M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z\"/></svg>");
						}
					
						%>
				</div>
    		</div>
		</div>
	</form>
	<div>
		<button  class="nice-button" onclick="location.href='leaderboard.jsp'" style="margin-left:400px;">LeaderBoard</button>
		<button  class="nice-button" onclick="redirectLogin()" style="margin-left:300px;">Sign Out</button>
	</div>
</body>
</html>