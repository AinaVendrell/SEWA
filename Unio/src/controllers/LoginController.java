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
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.print("LoginController: ");
		
		User login = new User();
		ManageLogin manager = new ManageLogin();
		
	    try {
	    		    
	    	BeanUtils.populate(login, request.getParameterMap());
	    	if (manager.isComplete(login) && manager.isCorrect(login)) {
	    		System.out.println("login OK, forwarding to ViewLoginDone ");
		    	HttpSession session = request.getSession();
				session.setAttribute("user", login);
				request.setAttribute("menu","ViewMenuLogged.jsp");
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp"); 
			    dispatcher.forward(request, response);
			    
		    } 
			else {
				System.out.println("login WRONG, forwarding to ViewLoginDone ");
				request.setAttribute("login",login);
				request.setAttribute("menu","ViewMenuNotLogged.jsp");
				request.setAttribute("content","ViewLoginForm.jsp");
				RequestDispatcher dispatcher = request.getRequestDispatcher("indexLogin.jsp");
			    dispatcher.forward(request, response);
		    	
		    }
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	    
	}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

