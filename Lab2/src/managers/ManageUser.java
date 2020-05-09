package managers;

import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	public void addUser(String nom, String surname, String gender, String bdate, String usr, String mail, String pwd) {
		String query = "INSERT INTO users (name,surname,gender,bdate,usr,mail,pwd) VALUES (?,?,?,?,?,?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,nom); //cambio a nom xq name dara problema en sql
			statement.setString(2,surname);
			statement.setString(3,gender);
			statement.setString(4,bdate);
			statement.setString(5,usr);
			statement.setString(6,mail);
			statement.setString(7,pwd);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*Check if all the fields are filled correctly */
	public boolean isComplete(User user) {
	    return(hasValue(user.getNombre()) &&
	    	   hasValue(user.getApellidos()) &&
	    	   hasValue(user.getGenero()) &&
	    	   hasValue(user.getNacimiento()) &&
		       hasValue(user.getNusuario()) &&
	    	   hasValue(user.getEmail()) &&
	    	   hasValue(user.getUserpassword1()) &&
	    	   hasValue(user.getReppass()) );
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
		
	
	// TODO: add other methods 

}
