package models;

public class Login {

	private String user = "";
	private String email = "";
	private String pwd = "";
	private boolean[] error = {false, false};
	
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		System.out.println(user);
		this.user = user;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		System.out.println("inside login" + email);
		this.email = email;
	}


	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		System.out.println(pwd);
		this.pwd = pwd;
	}
	
	public boolean[] getError() {
		return error;
	}
	
	public void setError(int index) {
		this.error[index]= true;
	}
}
	
