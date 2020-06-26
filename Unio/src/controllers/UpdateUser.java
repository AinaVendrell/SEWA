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
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUser() {
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
		HttpSession session = request.getSession();
		User realUser = (User) session.getAttribute("user");		

		try {
			BeanUtils.populate(user, request.getParameterMap());
			ManageUser userManager = new ManageUser();
			realUser = userManager.getUser(realUser.getUid()); // user sin update			
			boolean error = false;
			user.setUid(realUser.getUid()); 
			
			if (!realUser.getUsername().equals(user.getUsername())) {
				if(!userManager.updateUsername(user.getUid(), user.getUsername())) {
					user.setError(0);
					error = true;
				}
			}			
			if (!realUser.getEmail().equals(user.getEmail())) { 
				if(!userManager.updateEmail(user.getUid(), user.getEmail())) {
					user.setError(1);
					error = true;
				}
			}
			if (!realUser.getName().equals(user.getName())) {
				userManager.updateName(user.getUid(), user.getName());
			}

			if (!realUser.getSurname().equals(user.getSurname())) {
				userManager.updateSurname(user.getUid(), user.getSurname());
			}

			if (!realUser.getPwd().equals(user.getPwd())) {
				userManager.updatePwd(user.getUid(), user.getPwd());
			}	
			
			userManager.finalize();
			
			if (error == true) {
				System.out.println("EDIT WRONG ");
				request.setAttribute("user",user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("ViewEditProfile.jsp"); 
				dispatcher.include(request,response);
			}
			else {
				System.out.println("EDIT OKEY ");
			    request.setAttribute("user",realUser);
			    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			    dispatcher.forward(request, response);
		    	
		    }	
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
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