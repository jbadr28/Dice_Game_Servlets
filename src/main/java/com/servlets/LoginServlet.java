package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.ba.User;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext scontx = getServletContext();
		String login = request.getParameter("Login");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		ArrayList<User> userlist = (ArrayList<User>) scontx.getAttribute("userlist");
		if (userlist != null && !userlist.isEmpty()) {
			User foundUser = null;
			for (User it : userlist) {
				if (it.getPassWord().equals(password) && it.getLogin().equals(login)) {
					foundUser = it;
					break;
				}
			}

			if (foundUser != null) {
				out.print("succesfuly connected as : "+foundUser.getUserName());
				request.getSession().setAttribute("connecteduser", foundUser);
				request.getRequestDispatcher("connected.jsp").forward(request, response);
				return;
				
			} else {
				out.print("Login ou mot de passe incorrects");

			}
		} else {
			out.print("Login ou mot de passe incorrects");
		}

	}
		
	

}
