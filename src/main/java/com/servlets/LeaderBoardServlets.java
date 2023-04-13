package com.servlets;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.LinkedList;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LeaderBoardServlets
 */
public class LeaderBoardServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext contx = getServletContext();
		HttpSession ss = request.getSession();
		HashMap<String,Integer> leaderbrd = (HashMap<String, Integer>) contx.getAttribute("leaderboard");
		List<Map.Entry<String, Integer> > list =
				new LinkedList<Map.Entry<String, Integer> >(leaderbrd.entrySet());

			// Sort the list
			Collections.sort(list, new Comparator<Map.Entry<String, Integer> >() {
				public int compare(Map.Entry<String, Integer> o1,
								Map.Entry<String, Integer> o2)
				{
					return (o1.getValue()).compareTo(o2.getValue())<=0?1:-1;
				}
			});
			
			// put data from sorted list to hashmap
			HashMap<String, Integer> temp = new HashMap<String, Integer>();
			for (Map.Entry<String, Integer> aa : list) {
				temp.put(aa.getKey(), aa.getValue());
			}
			contx.setAttribute("sortedLeaderBoard", temp);
			ss.setAttribute("leaderboard", leaderbrd);
			ss.setAttribute("sortedLeaderBoard", temp);
			System.out.println(temp.toString());
			request.getRequestDispatcher("/leaderboard.jsp").forward(request, response);
			return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
