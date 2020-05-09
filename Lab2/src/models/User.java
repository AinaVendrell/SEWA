package models;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private String name = "";
	private String surname = "";
	private String birthday = "";
	private String gender = ""; 
	private String userName = "";
	private String email = "";
	private String pwd1 = "";
	private String pwd2 = "";
	
	private boolean[] error  = {false,false,false,false,false,false,false,false};
	
	public User() {
		
	}
	
	
	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getSurname() {
		return surname;
	}



	public void setSurname(String surname) {
		this.surname = surname;
	}



	public String getBirthday() {
		return birthday;
	}



	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
		System.out.println(userName);
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String mail) {
		String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(mail);
		if (matcher.matches()) {
			this.email = mail;
			System.out.println(mail);
		} else {
			error[1]=true;
			System.out.println(mail);
		}
	}



	public String getPwd1() {
		return pwd1;
	}



	public void setPwd1(String pwd1) {
		this.pwd1 = pwd1;
	}



	public String getPwd2() {
		return pwd2;
	}



	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}

	
	public boolean[] getError() {
		return error;
	}
		
}
