package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import managers.ManageUser;
import models.User;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/EpawLauncher")
public class EpawLauncher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EpawLauncher() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* START servlet: simulates a user has been logged in*/
		HttpSession session = request.getSession();
		String uid = "oriol";
		
		ManageUser userManager = new ManageUser();
		User user = userManager.getUser(uid);
		userManager.finalize();
		
		session.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp"); 
		dispatcher.forward(request,response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
