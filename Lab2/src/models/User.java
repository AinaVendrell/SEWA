package models;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private String nombre = "";
	private String apellidos = "";
	private String nacimiento = "";
	private String genero = ""; 
	private String nusuario = "";
	private String email = "";
	private String userpassword1 = "";
	private String reppass = "";
	
	private boolean[] error  = {false,false,false,false,false,false,false,false};
	
	public User() {
		
	}
	
	
	public String getNombre() {
		return nombre;
	}



	public void setNombre(String nombre) {
		this.nombre = nombre;
	}



	public String getApellidos() {
		return apellidos;
	}



	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}



	public String getNacimiento() {
		return nacimiento;
	}



	public void setNacimiento(String nacimiento) {
		this.nacimiento = nacimiento;
	}



	public String getGenero() {
		return genero;
	}



	public void setGenero(String genero) {
		this.genero = genero;
	}



	public String getNusuario() {
		return nusuario;
	}



	public void setNusuario(String nusuario) {
		this.nusuario = nusuario;
		System.out.println(nusuario);
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



	public String getUserpassword1() {
		return userpassword1;
	}



	public void setUserpassword1(String userpassword1) {
		this.userpassword1 = userpassword1;
	}



	public String getReppass() {
		return reppass;
	}



	public void setReppass(String reppass) {
		this.reppass = reppass;
	}

	
	public boolean[] getError() {
		return error;
	}
		
}
