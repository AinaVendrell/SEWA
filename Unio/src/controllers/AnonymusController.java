package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import managers.ManageLogin;
import managers.ManageTweets;
import managers.ManageUser;
import models.Tweets;
import models.User;

/**
 * Servlet implementation class AnonymusController
 */
@WebServlet("/AnonymusController")
public class AnonymusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AnonymusController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Tweets> tweets = Collections.emptyList();
		User user = new User();

		try {
			BeanUtils.populate(user, request.getParameterMap());
			ManageUser userManager = new ManageUser();
			if (user.getUid() != null) {
				user = userManager.getUser(user.getUid());
			} else {
				user = userManager.getUser(1);
			}
			userManager.finalize();
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		ManageTweets tweetManager = new ManageTweets();
		tweets = tweetManager.getTweets();
		tweetManager.finalize();
		request.setAttribute("menu", "ViewMenuNotLogged.jsp");
		request.setAttribute("content", "viewAnonymusUser.jsp");
		request.setAttribute("tweets", tweets);
		request.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("indexLogin.jsp");
		dispatcher.forward(request, response);

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
