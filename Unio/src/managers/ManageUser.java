package managers;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

import models.User;
import utils.DAO;

public class ManageUser {
	
	private DAO db = null ;
	
	public ManageUser() {
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
	
	
    // Add new user
    public void addUser(String name, String surname, String gender, String birthday, String uid, String email, String pwd) {
        String query = "INSERT INTO users (name,surname,gender,birthday,uid,email,pwd) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement statement = null;
        try {
            statement = db.prepareStatement(query);
            statement.setString(1,name); 
            statement.setString(2,surname);
            statement.setString(3,gender);
            statement.setString(4,birthday);
            statement.setString(5,uid);
            statement.setString(6,email);
            statement.setString(7,pwd);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	// Check if all the fields are filled correctly 
	public boolean isComplete(User user) {
	    return(hasValue(user.getName()) &&
	    	   hasValue(user.getSurname()) &&
	    	   hasValue(user.getGender()) &&
	    	   hasValue(user.getBirthday()) &&
		       hasValue(user.getUid()) &&
	    	   hasValue(user.getEmail()) &&
	    	   hasValue(user.getPwd()) &&
	    	   hasValue(user.getPwd2()) );
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
		
	// Check if the uid and email doesn't exist yet
	public boolean isCorrect(User user) {
		/*if(uidExists(user.getUid())){
			user.setError(0);
			System.out.print("User already exists\n");
		}*/
		/*if(emailExists(user.getEmail())){
			user.setError(1);
			System.out.print("Email already exists\n");
		}*/
		if(user.getError()[0] || user.getError()[1]) {
			System.out.print("user or email already exists\n");
			return false;
		}
		return true;	
	}

	// Check if the uid doesn't exist yet
	private boolean uidExists(String uid) {
		String query ="SELECT * FROM User WHERE uid = ?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1, uid);
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
	
	// Check if the email doesn't exist yet
	private boolean emailExists(String email) {
		String query ="SELECT * FROM User WHERE email = ?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1, email);
			ResultSet rs = statement.executeQuery();	
			if (!rs.isBeforeFirst() ) { 
				System.out.print("No mail\n");
			    return false;
			}
			statement.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.print("MAIL\n");
		return true;
	}
	
	// Get a user given its PK
	public User getUser(String uid) {
		String query = "SELECT name, surname, gender, birthday, uid, avatar FROM users WHERE uid = ? ;";
		PreparedStatement statement = null;
		ResultSet rs = null;
		User user = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,uid);
			rs = statement.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUid(rs.getString("uid"));
				user.setName(rs.getString("name"));
				user.setSurname(rs.getString("surname"));
				user.setBirthday(rs.getString("birthday"));
				user.setGender(rs.getString("gender"));
				user.setAvatar(rs.getString("avatar"));

			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	// Update a user
	public void updateUser(String uid, String name) {
		String query = "UPDATE users SET uid = ? , name = ? WHERE uid = ? ;";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,uid);
			statement.setString(2,name);
			statement.setString(3,uid);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	// Delete existing user
	public void deleteUser(String uid) {
		String query = "DELETE FROM users WHERE uid = ?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,uid);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Get users a given user is following
	public List<User> getUserFollows(String uid) {
			String query = "SELECT users.uid,users.name, users.avatar FROM followers JOIN users ON users.uid = followers.fid WHERE followers.uid = ?;";
			PreparedStatement statement = null;
			List<User> l = new ArrayList<User>();
			try {
				statement = db.prepareStatement(query);
				statement.setString(1,uid);
				ResultSet rs = statement.executeQuery();
				while (rs.next()) {
					User user = new User();
					user.setUid(rs.getString("uid"));
					user.setName(rs.getString("name"));
					user.setAvatar(rs.getString("avatar"));
					l.add(user);
				}
				rs.close();
				statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	public List<User> getUserFollows(String uid, Integer start, Integer end) {
			String query = "SELECT users.uid,users.name, users.avatar FROM followers JOIN users ON users.uid = followers.fid WHERE followers.uid = ? ORDER BY users.name LIMIT ?,?;";
			PreparedStatement statement = null;
			List<User> l = new ArrayList<User>();
			try {
				statement = db.prepareStatement(query);
				statement.setString(1,uid);
				statement.setInt(2,start);
				statement.setInt(3,end);
				ResultSet rs = statement.executeQuery();
				while (rs.next()) {
					User user = new User();
					user.setUid(rs.getString("uid"));
					user.setName(rs.getString("name"));
					user.setAvatar(rs.getString("avatar"));
					l.add(user);
				}
				rs.close();
				statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	// Get users a given user is following
	public List<User> getUserFollowers(String uid) {
			String query = "SELECT users.uid,users.name FROM users JOIN followers ON users.uid = followers.uid WHERE followers.fid = ?;";
			PreparedStatement statement = null;
			List<User> l = new ArrayList<User>();
			try {
				statement = db.prepareStatement(query);
				statement.setString(1,uid);
				ResultSet rs = statement.executeQuery();
				while (rs.next()) {
					User user = new User();
					user.setUid(rs.getString("uid"));
					user.setName(rs.getString("name"));
					l.add(user);
				}
				rs.close();
				statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	// Get all the users
	public List<User> getUser() {
			String query = "SELECT uid,name FROM users;";
			PreparedStatement statement = null;
			List<User> l = new ArrayList<User>();
			try {
				statement = db.prepareStatement(query);
				ResultSet rs = statement.executeQuery();
				while (rs.next()) {
					User user = new User();
					user.setUid(rs.getString("uid"));
					user.setName(rs.getString("name"));
					l.add(user);
				}
				rs.close();
				statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
}

