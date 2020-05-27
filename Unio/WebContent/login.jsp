<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<div>
  <ul class="server-errors-list">
    <c:if test="${login.error[0]}">
      <li>Wrong password</li>
    </c:if>
    <c:if test="${login.error[1]}">
      <li>Email does not exist (SingIn ?)</li>
    </c:if>
  </ul>

  <div class="description">
    <img class="mb-4" src="images/unio.svg" alt="unio" width="72" height="72" />

    <h1>Login UNIO</h1>
    <hr />
    <br />
  </div>
  <div class="container">
    <form
      data-parsley-trigger="keyup"
      data-parsley-validate
      action="LoginController"
      method="POST"
    >
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-4 col-md-8">
          <label for="email" class="sr-only">Email</label>
          <input
            type="email"
            class="form-control"
            id="email"
            name="email"
            placeholder="Email"
            required
            data-parsley-type="email"
            value="${login.email}"
          />
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-4 col-md-8">
          <label class="sr-only" for="pwd1">Password</label>
          <input
            type="password"
            id="pwd"
            name="pwd"
            class="form-control"
            placeholder="Password"
            aria-describedby="passwordHelpBlock"
            required
            value="${login.pwd}"
          />
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-4 col-md-8">
          <button type="submit" class="btn btn-primary btn-block">
            Login
          </button>
        </div>
      </div>
    </form>
  </div>
</div>
