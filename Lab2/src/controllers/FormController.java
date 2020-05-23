package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import managers.ManageUser;
import models.User;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/FormController")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User model = new User();
		String view = "signupjsp.jsp";
		ManageUser manager = new ManageUser();
		
		try {
			BeanUtils.populate(model,request.getParameterMap());
			if (manager.isComplete(model)) {
				if (manager.isCorrect(model)) {
					manager.addUser(model.getName(), model.getSurname(), model.getGender(), model.getBirthday(), model.getUsername(), model.getEmail(), model.getPwd1());
					manager.finalize();
					view = "RegisteredEL.jsp";
				}	
			}
				
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		request.setAttribute("model", model);
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
