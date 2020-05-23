package managers;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import models.Login;
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
	public boolean isComplete(Login login) {
	    return(hasValue(login.getEmail()) &&
	    	   hasValue(login.getPwd()));
	}
	
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
	
	// Check if login is correct
	public boolean isCorrect(Login login) {
		String user = ckeckLogin(login.getEmail(), login.getPwd());
		if ( user != null) {
			login.setUser(user);
			System.out.print("\nCorrect LogIn\n");
			return true;	
		}
		else {
			if(emailExists(login.getEmail())) {
				System.out.print("\nWrong password\n");
				login.setError(0);
			} else {
				System.out.print("\nEmail doesn't exist\n");
				login.setError(1);
			}
			return false;
		}
	}
	
	// Check if there is a user with this password and email
	private String ckeckLogin(String email, String pwd) {
		String query ="SELECT username FROM Users WHERE email = ? AND pwd = ?";
		PreparedStatement statement = null;
		String username = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1, email);
			statement.setString(2, pwd);
			ResultSet rs = statement.executeQuery();	
			if (!rs.isBeforeFirst() ) {    
			    return null;
			}
			rs.next();
			username = rs.getString(1);
			System.out.print(username);
			statement.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return username;
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
