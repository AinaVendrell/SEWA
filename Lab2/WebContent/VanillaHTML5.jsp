<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Form </title>
<style>
input:valid {
	border-left: 4px solid green;
}
input:invalid {
	border-left: 4px solid red;
}
</style>
</head>
<body>
<form action="RegisteredEL.jsp">
  <label for="user"> User name:</label><br>
  <input type="text" id="user" name="user" placeholder="Name" required><br>
  <label for="mail"> 
  <span> Mail:</span><br>
  <input type="email" id="mail" name="mail" placeholder="Mail" required>
  <span class="error"></span>
  </label><br>
  <label for="pwd1"> Password: </label><br>
  <input type="password" id="pwd1" name="pwd1" placeholder="Password" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"><br>
  <label for="pwd2"> Confirm Password: </label><br>
  <input type="password" id="pwd2" name="pwd2" placeholder="Confirm Password" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"><br><br>
  <button> Submit </button>
</form>
</body>
</html>