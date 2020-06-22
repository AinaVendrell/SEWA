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

import org.apache.commons.beanutils.BeanUtils;

import managers.ManageTweets;
import managers.ManageUser;
import models.Tweets;
import models.User;
import models.dTmodel;

/**
 * Servlet implementation class GetTweetsFromFollowing
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		dTmodel dt = new dTmodel();
		List<Tweets> tweets = Collections.emptyList();
		
		try {
			BeanUtils.populate(dt, request.getParameterMap());
			ManageTweets tweetManager = new ManageTweets();
			if (dt.getGlobal() == 1) {
				//tweets = tweetManager.getFollowsTweets(dt.getUid(),dt.getStart(),dt.getEnd());
				tweets = tweetManager.getFollowsTweets(dt.getUid());
			}
			else if (dt.getGlobal() == 2) {
				tweets = tweetManager.getUserTweets(dt.getUid(),dt.getStart(),dt.getEnd());
			}
			else {
				tweets = tweetManager.getOthersTweets(dt.getUid());		
			}
			tweetManager.finalize();
			
		
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}	
		
		User user = new User();

		try {
			BeanUtils.populate(user, request.getParameterMap());
			ManageUser userManager = new ManageUser();
			user = userManager.getUser(user.getUid());
			userManager.finalize();
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		request.setAttribute("user",user);
		request.setAttribute("tweets",tweets);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/viewTweetsFromUser.jsp"); 
		dispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
