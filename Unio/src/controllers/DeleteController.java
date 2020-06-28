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
 * Servlet implementation class DeleteController
 */
@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = new User();
		HttpSession session = request.getSession(false);
		User realUser = (User) session.getAttribute("user");
		
		try {
			BeanUtils.populate(user, request.getParameterMap());
			ManageUser userManager = new ManageUser();
			userManager.deleteUser(user.getUid());
			userManager.finalize();
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		if (realUser.getUid().equals(user.getUid())) {
			if (session!=null) {
				session.invalidate();
			}	
			System.out.println("DeleteController: your user acount has been deleted forwarding to ViewDeleteDone");
			request.setAttribute("menu","ViewMenuNotLogged.jsp");
			request.setAttribute("content","ViewDeleteDone.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("indexLogin.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("DeleteController: you have deleted another user acount");
			request.setAttribute("menu","ViewMenuLogged.jsp");
			request.setAttribute("user", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

