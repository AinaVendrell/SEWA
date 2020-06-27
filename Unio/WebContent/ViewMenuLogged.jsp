<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" session="false"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light w3-top">
  <a class="navbar-brand" id="LogoutController" href="MainController">
    <i class="fa fa-home sr-only" aria-hidden="true"></i>
    <img src="images/unio.svg" width="30" height="30" alt=""
  /></a>
  <button
    class="navbar-toggler"
    type="button"
    data-toggle="collapse"
    data-target="#navbarTogglerDemo02"
    aria-controls="navbarTogglerDemo02"
    aria-expanded="false"
    aria-label="Toggle navigation"
  >
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item">
        <a class="vF menu nav-link" title="Friends">Friends</a>
      </li>
      <li class="nav-item">
        <a class="vU menu nav-link" title="Users">Users</a>
      </li>
      <li class="nav-item">
        <a class="gF menu nav-link" title="Users">TweetsFriend</a>
      </li>
      <li class="nav-item">
        <a class="aU menu nav-link" title="Users">Anonymous</a>
      </li>
    </ul>
    <ul class="navbar-nav my-2 my-md-0 mr-md-3">
      <li class="nav-item">
        <a class="menu nav-link" id="LogoutController" href="#"> LogOut </a>
      </li>
      <li class="nav-item">
        <a class="vT menu nav-link" title="My Profile"
          ><img            
            src="${user.avatar}"
            class="w3-circle"
            style="height: 23px; width: 23px;"
            alt="Avatar"
        /></a>
      </li>
    </ul>
  </div>
</nav>
