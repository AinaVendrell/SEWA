package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import managers.ManageTweets;
import models.Tweets;
import models.User;

/**
 * Servlet implementation class DelTweetFromUser
 */
@WebServlet("/LikeTweetFromUser")
public class LikeTweetFromUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeTweetFromUser() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Tweets tweet = new Tweets();
		
		
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		
		try {
			BeanUtils.populate(tweet, request.getParameterMap());
			ManageTweets tweetManager = new ManageTweets();
			tweet = tweetManager.getTweet(tweet.getTid());
			
			boolean result = tweetManager.checkLike(user.getUid(), tweet.getTid());
			
			if(result == false) {
				tweetManager.likeTweet(tweet.getTid(), tweet.getLikes(), user.getUid());
			}
			
			tweetManager.finalize();
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
