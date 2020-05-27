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
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User user = new User();
			ManageUser manager = new ManageUser();
			BeanUtils.populate(user, request.getParameterMap());
			if (manager.isComplete(user) && manager.isCorrect(user)) {
				manager.addUser(user.getName(), user.getSurname(), user.getGender(), user.getBirthday(), user.getUsername(), user.getEmail(), user.getPwd1());
				manager.finalize();
				HttpSession session = request.getSession();
				session.setAttribute("user",user.getUsername());
				System.out.println(" user ok, forwarding to ViewLoginForm");
				RequestDispatcher dispatcher = request.getRequestDispatcher("ViewSignUpDone.jsp");
				dispatcher.forward(request, response);   
			} 
			else {
				System.out.println(" forwarding to ViewRegisterForm");
				request.setAttribute("user",user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("ViewSignUpForm.jsp");
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
