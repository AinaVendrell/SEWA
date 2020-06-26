package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import managers.ManageLogin;
import models.User;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/AnonimusUser")
public class AnonymusUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnonymusUser() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.print("ANONIM: ");
		
		HttpSession session = request.getSession();
		User anonymous = new User();
		ManageLogin manager = new ManageLogin();
		
    	anonymous = manager.getAnonymousUser();
    	System.out.println("ANONYMUS OK ");
		session.setAttribute("user", anonymous);
		request.setAttribute("menu","ViewMenuNotLogged.jsp");
		session.setAttribute("user", session.getAttribute("user"));
	    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp"); 
		dispatcher.forward(request, response);
	    	
	}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

