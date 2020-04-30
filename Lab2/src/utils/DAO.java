package utils;

import java.sql.*;

public class DAO {
	
	private Connection connection = null;
	
	public DAO() throws Exception {
		
		// WITHOUT POOL
		String user = "mysql";
		String password="prac";
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		connection=DriverManager.getConnection("jdbc:mysql://localhost/ts1?user="+user+"&password="+password);

	}
	
	//execute queries
	
	public PreparedStatement prepareStatement(String query) throws SQLException{
		// Note that this is done using https://www.arquitecturajava.com/jdbc-prepared-statement-y-su-manejo/
		return connection.prepareStatement(query);
	}
	
	public void disconnectBD() throws SQLException{
		connection.close();
	}
}