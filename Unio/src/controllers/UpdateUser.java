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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		HttpSession session = request.getSession();
		User realUser = (User) session.getAttribute("user");
		
		try {
			BeanUtils.populate(user, request.getParameterMap());
			ManageUser userManager = new ManageUser();
			realUser = userManager.getUser(realUser.getUid());
			/*if (realUser.getEmail() != user.getEmail()) {
				userManager.updateEmail(user.getUid(), user.getEmail());
			}
			if (realUser.getName() != user.getName()) {
				userManager.updateName(user.getUid(), user.getName());
			}
			if (realUser.getSurname() != user.getSurname()) {
				userManager.updateSurname(user.getUid(), user.getSurname());
			}
			if (realUser.getGender() != user.getGender()) {
				userManager.updateGender(user.getUid(), user.getGender());
			}*/
			System.out.println("CANVI USERNAME	" + user.getUsername());
			System.out.println("CANVI NAME	" + user.getName());
			System.out.println("CANVI SURNAME	" + user.getSurname());
			System.out.println("CANVI EMAIL	" + user.getEmail());
			System.out.println("CANVI PWD	" + user.getPwd());
			
			System.out.println("\n\n\n2CANVI USERNAME	" + realUser.getUsername());
			System.out.println("2CANVI NAME	" + realUser.getName());
			System.out.println("2CANVI SURNAME	" + realUser.getSurname());
			System.out.println("2CANVI EMAIL	" + realUser.getEmail());
			System.out.println("2CANVI PWD	" + realUser.getPwd());
			userManager.finalize();
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		request.setAttribute("user",user);
		request.setAttribute("real", realUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewEditProfile.jsp"); 
		dispatcher.include(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
