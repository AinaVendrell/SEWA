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

import managers.ManageUser;
import models.User;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		HttpSession session = request.getSession(false);
		
		try {
			BeanUtils.populate(user, request.getParameterMap());
			ManageUser userManager = new ManageUser();
			userManager.deleteUser(user.getUid());
			userManager.finalize();
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		if (session!=null) {
			session.invalidate();
		}		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewDeleteDone.jsp");
	    if (dispatcher != null) dispatcher.forward(request, response);
	    
	    

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
