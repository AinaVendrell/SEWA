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

import managers.ManageTweets;
import managers.ManageUser;
import models.Tweets;
import models.User;
import models.dTmodel;

/**
 * Servlet implementation class GetTweets
 */
@WebServlet("/GetTweets")
public class GetTweets extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetTweets() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		dTmodel dt = new dTmodel();
		List<Tweets> tweets = Collections.emptyList();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		try {
			BeanUtils.populate(dt, request.getParameterMap());
			ManageTweets tweetManager = new ManageTweets();
			if (dt.getGlobal() == 1) {
				tweets = tweetManager.getFollowsTweets(dt.getUid());
			} else if (dt.getGlobal() == 2) {
				if (dt.getUid() == null) {
					tweets = tweetManager.getUserTweets(user.getUid(), dt.getStart(), dt.getEnd());
				} else {
					tweets = tweetManager.getUserTweets(dt.getUid(), dt.getStart(), dt.getEnd());
				}
			} else if (dt.getGlobal() == 3) {
				tweets = tweetManager.getTweets();
			} else {
				tweets = tweetManager.getOthersTweets(dt.getUid());
			}
			tweetManager.finalize();

			if (dt.getGlobal() != 3) {
				ManageUser userManager = new ManageUser();
				user = userManager.getUser(user.getUid());
				userManager.finalize();
			}

		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		if (dt.getGlobal() != 3) {
			request.setAttribute("user", user);
		}
		System.out.println("GetTweets: forwarding to viewTweetsFromUser");
		request.setAttribute("tweets", tweets);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/viewTweetsFromUser.jsp");
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
