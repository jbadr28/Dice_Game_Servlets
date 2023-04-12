package com.servlets;
import java.util.*;

import java.io.IOException;

import com.ba.User;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignUp")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext contx = getServletContext();
		String action = request.getParameter("action");
		String errorPage = "/Error.jsp";
		String loginPage = "/home.jsp";
		String singUpPage = "/SignUpForm.jsp";
		HashMap<String, Integer> map = new HashMap<>();
		
		if(contx.getAttribute("leaderboard")==null) {
			contx.setAttribute("leaderboard",map);
		}
		if(action!=null && action.equals("create")) {
			String nom = request.getParameter("name");
			String login = request.getParameter("Login");
			String password = request.getParameter("password");
			User user = new User();
			user.setUserName(nom);
			user.setLogin(login);
			user.setPassWord(password);
			ArrayList<User> userlist ;
			if(contx.getAttribute("userlist")==null) {
				userlist = new ArrayList<>();
				contx.setAttribute("userlist", userlist);
			}else {
				for(User us :(ArrayList<User>) contx.getAttribute("userlist")) {
					if(user.equals(us)) {
						request.setAttribute("error", "User Already Exist !!");
						contx.getRequestDispatcher(errorPage).forward(request, response);
						return;
					}
				}
				userlist = (ArrayList<User>) contx.getAttribute("userlist");
			}
			userlist.add(user);
			contx.getRequestDispatcher(loginPage).forward(request, response);
			return;
		}
	}

}
