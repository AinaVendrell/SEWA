package managers;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import models.Tweets;
import models.User;
import utils.DAO;

public class ManageLogin {
	
	private DAO db = null ;
	
	public ManageLogin() {
		try {
			db = new DAO();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void finalize() {
		try {
			super.finalize();
			db.disconnectBD();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
	
	
	// Check if all the fields are filled correctly 
	public boolean isComplete(User login) {
	    return(hasValue(login.getEmail()) &&
	    	   hasValue(login.getPwd()));
	}
	
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
	
	// Check if login is correct
	public boolean isCorrect(User login) {
		Integer user = ckeckLogin(login.getEmail(), login.getPwd());
		if ( user != 0) {
			login.setUid(user);
			System.out.println("Correct LogIn");
			return true;	
		}
		else {
			if(emailExists(login.getEmail())) {
				System.out.println("Wrong password");
				login.setError(0);
			} else {
				System.out.println("Email doesn't exist");
				login.setError(1);
			}
			return false;
		}
	}
	
	// Check if there is a user with this password and email
	private Integer ckeckLogin(String email, String pwd) {
		String query ="SELECT uid FROM users WHERE email = ? AND pwd = ?";
		PreparedStatement statement = null;
		ResultSet rs = null;
		Integer uid = 0;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1, email);
			statement.setString(2, pwd);
			rs = statement.executeQuery();
			if (rs.next()) {
				uid = rs.getInt("uid");
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return uid;
	}
	
	// Check if email exists
	private boolean emailExists(String email) {
		String query ="SELECT * FROM Users WHERE email = ?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1, email);
			ResultSet rs = statement.executeQuery();	
			if (!rs.isBeforeFirst() ) {    
			    return false;
			}
			statement.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
}
