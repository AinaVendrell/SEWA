<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri = "http://java.sun.com/jsp/jstl/core"
prefix = "c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="parsley/parsley.min.js"></script>
    <!--  <script src="parsley/i18n/ca.js"></script> -->
    <title>Form with parsley</title>
    <link rel="stylesheet" type="text/css" href="css/estil.css" />
  </head>

  <body>
    <ul class="server-errors-list">
      <c:if test="${model.error[0]}">
        <li>Entered user name has been already registered</li>
      </c:if>
    </ul>

    <form data-parsley-validate action="FormController">
      <label for="name"> Name:</label>
      <br />
      <input
        type="text"
        id="name"
        name="name"
        placeholder="Name"
        value="${model.name}"
        required
      />
      <br />
      <label for="surname"> Surname:</label>
      <br />
      <input
        type="text"
        id="surname"
        name="surname"
        placeholder="Surname"
        value="${model.surname}"
        required
      />
      <br />
      <label for="birthday"> Birthday:</label>
      <br />
      <input
        type="text"
        id="birthday"
        name="birthday"
        placeholder="Birthday"
        value="${model.birthday}"
        required
      />
      <br />
      <label for="gender"> Gender:</label>
      <br />
      <input
        type="text"
        id="gender"
        name="gender"
        placeholder="Gender"
        value="${model.gender}"
        required
      />
      <br />
      <label for="userName"> User name:</label>
      <br />
      <input
        type="text"
        id="userName"
        name="userName"
        placeholder="UserName"
        value="${model.userName}"
        required
      />
      <br />
      <label for="email"> Mail: </label>
      <br />
      <input
        type="email"
        id="email"
        name="email"
        placeholder="Email"
        value="${model.email}"
        required
      />
      <br />
      <label for="pwd1"> Password: </label>
      <br />
      <input
        type="password"
        id="pwd1"
        name="pwd1"
        placeholder="Password"
        value="${model.pwd1}"
        required
        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"
      />
      <br />
      <label for="pwd2"> Confirm password: </label>
      <br />
      <input
        type="password"
        id="pwd2"
        name="pwd2"
        placeholder="Confirm Password"
        value="${model.pwd2}"
        required
        data-parsley-equalto="#pwd1"
      />
      <br /><br />
      <button>Submit</button>
    </form>
  </body>
</html>
