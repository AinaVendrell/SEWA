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
      <label for="nombre"> Nombre:</label>
      <br />
      <input
        type="text"
        id="nombre"
        name="nombre"
        placeholder="Nombre"
        value="${model.nombre}"
        required
      />
      <br />
      <label for="apellidos"> Apellidos:</label>
      <br />
      <input
        type="text"
        id="apellidos"
        name="apellidos"
        placeholder="Apellidos"
        value="${model.apellidos}"
        required
      />
      <br />
      <label for="nacimiento"> User name:</label>
      <br />
      <input
        type="text"
        id="nacimiento"
        name="nacimiento"
        placeholder="Nacimiento"
        value="${model.nacimiento}"
        required
      />
      <br />
      <label for="genero"> User name:</label>
      <br />
      <input
        type="text"
        id="genero"
        name="genero"
        placeholder="Genero"
        value="${model.genero}"
        required
      />
      <br />
      <label for="nusuario"> User name:</label>
      <br />
      <input
        type="text"
        id="nusuario"
        name="nusuario"
        placeholder="Nusuario"
        value="${model.nusuario}"
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
      <label for="userpassword1"> Password: </label>
      <br />
      <input
        type="password"
        id="userpassword1"
        name="userpassword1"
        placeholder="Password"
        value="${model.userpassword1}"
        required
        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"
      />
      <br />
      <label for="reppass"> Confirm password: </label>
      <br />
      <input
        type="password"
        id="reppass"
        name="reppass"
        placeholder="Confirm Password"
        value="${model.reppass}"
        required
        data-parsley-equalto="#userpassword1"
      />
      <br /><br />
      <button>Submit</button>
    </form>
  </body>
</html>
