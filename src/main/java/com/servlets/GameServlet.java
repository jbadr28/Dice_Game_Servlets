package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import com.ba.User;
import com.ba.LeaderBoard;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/game")
public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession ss = request.getSession();
		PrintWriter pw = response.getWriter();
		ss.setAttribute("dice", null);
		request.getRequestDispatcher("playForm.jsp").forward(request, response);
		doPost(request,response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ss = request.getSession();
		PrintWriter pw = response.getWriter();
		String playPage = "/playForm.jsp";
		String diceErrorPage = "/diceError.jsp";
		String action = request.getParameter("action");
		HashMap<String, Integer> map ;
		ServletContext contx = getServletContext();
		if(contx.getAttribute("leaderboard")==null) {
			map = new HashMap<>();
			contx.setAttribute("leaderboard",map);
		}else {
			map = (HashMap<String, Integer>) contx.getAttribute("leaderboard");
		}
		if (action!=null && action.equals("replay")) {
			replay(request,response);
		}
		else { 
			String dice_number = request.getParameter("diceNumber");
			User connectedUser = (User) ss.getAttribute("connecteduser");

				if(dice_number.equals("none")) {
					ss.setAttribute("dice", "Please pick a Dice");
					ss.setAttribute("result", null);
					request.getRequestDispatcher(playPage).forward(request, response);
					return;
				}
				if(connectedUser.isDicePlayed(Integer.valueOf(dice_number))) {
					ss.setAttribute("error", true);
					if(connectedUser.getBestScore()==null) {
						connectedUser.setBestScore(-1);
						map.put(connectedUser.getLogin(), connectedUser.getBestScore());
					}
					request.getRequestDispatcher(playPage).forward(request, response);
					return;
				}
		
				else {
					ss.setAttribute("dice", "dice number "+dice_number+" is launched for the first time");
					((User) ss.getAttribute("connecteduser")).playDice(Integer.valueOf(dice_number));
					Random rn = new Random();
					int result = rn.nextInt(6)+1;
					if((Integer)ss.getAttribute("result")!=null && ((Integer)ss.getAttribute("result")).equals(result)) {
						ss.setAttribute("GameParyEnd", true);
						if(connectedUser.getBestScore() == null || 0>connectedUser.getBestScore()) {
							connectedUser.setBestScore(0);
						}
						map.put(connectedUser.getLogin(), connectedUser.getBestScore());
						ss.setAttribute("score", 0);
						request.getRequestDispatcher(playPage).forward(request, response);
						return;
					}
					ss.setAttribute("result", result);
					connectedUser.setRes(result, Integer.valueOf(dice_number));
					if(Integer.valueOf(dice_number).equals(2) && (result==1 || result==6)) {
						ss.setAttribute("GameParyEnd", true);
						if(connectedUser.getBestScore() == null || 0>connectedUser.getBestScore()) {
							connectedUser.setBestScore(0);
						}
						map.put(connectedUser.getLogin(), connectedUser.getBestScore());
						ss.setAttribute("score", 0);
						request.getRequestDispatcher(playPage).forward(request, response);
						return;
					}
					
					if(connectedUser.isPlayedAllDices()) {
						ss.setAttribute("GameParyEnd", true);
						int score = 0;
						if(connectedUser.getRes(1)>connectedUser.getRes(2) && connectedUser.getRes(2)>connectedUser.getRes(3)) {
							score = connectedUser.getRes(1)*connectedUser.getRes(2)*connectedUser.getRes(3);
						}
						else if(connectedUser.getRes(1)<connectedUser.getRes(2) && connectedUser.getRes(2)<connectedUser.getRes(3)) {
							score = connectedUser.getRes(1)+connectedUser.getRes(2)+connectedUser.getRes(3);
						}
						
						if(connectedUser.getBestScore() == null || score>connectedUser.getBestScore()) {
							connectedUser.setBestScore(score);
							
						}
						
						map.put(connectedUser.getLogin(), connectedUser.getBestScore());
						ss.setAttribute("score", score);
						request.getRequestDispatcher(playPage).forward(request, response);
						return;
					}
					request.getRequestDispatcher(playPage).forward(request, response);
					return;
				}
			}
		
	}
	public static void replay(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("dice");
		request.getSession().removeAttribute("error");
		request.getSession().removeAttribute("result");
		request.getSession().removeAttribute("GameParyEnd");
		request.getSession().removeAttribute("score");
		String playPage = "/playForm.jsp";
		User u = (User) request.getSession().getAttribute("connecteduser");
		boolean [] replay = new boolean[3];
		replay[0] = replay[1] = replay[2] =false;
		u.setDices(replay);
	}
}
