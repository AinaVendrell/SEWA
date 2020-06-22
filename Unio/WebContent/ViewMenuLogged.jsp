<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" session="false"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light w3-top">
	<a class="navbar-brand" id="LogoutController" href="MainController"> <i class="fa fa-home sr-only" aria-hidden="true"></i> <img src="images/unio.svg"width="30" height="30" alt="" /></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			<!-- <li class="nav-item"><a class="gF menu nav-link">EPAW</a></li>  -->
			<li class="nav-item"><a class="vF menu nav-link" title="Friends">Friends</a></li>
			<li class="nav-item"><a class="vU menu nav-link" title="Users">Users</a></li>
		</ul>
		<ul class="navbar-nav my-2 my-md-0 mr-md-3">
			<li class="nav-item"><a class="menu nav-link" id="LogoutController" href=#> LogOut </a></li>
			<li class="nav-item"><a class="vT menu nav-link" title="My Profile"><img id="avatar_pic" src="" class="w3-circle" style="height: 23px; width: 23px;" alt="Avatar"/></a></li>
		</ul>
		
	</div>
</nav>

<!-- Navbar -->
<!-- 
<nav class="w3-top">
  <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
    <a
      class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2"
      href="javascript:void(0);"
      onclick="openNav()"
      ><i class="fa fa-bars"></i
    ></a>
    <a class="gF w3-bar-item w3-button w3-padding-large w3-theme-d4"
      ><i class="fa fa-home w3-margin-right"></i> EPAW
    </a>
    <a
      class="vF w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
      title="Friends"
      ><i class="fa fa-users"></i
    ></a>
    
    <a
      class="vU w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
      title="Users"
      ><i class="fa fa-user-plus"></i
    ></a>
    
    <a
      class="vT w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white"
      title="My Account"
    >
      <img
        src="avatar/user-3.png"
        class="w3-circle"
        style="height: 23px; width: 23px;"
        alt="Avatar"
      />
    </a>
    <a class="menu nav-link" id="LogoutController">
      <i class="fa fa-times"></i>
    </a>
  </div>
</nav>
 -->
<!-- Navbar on small screens -->
 <!--
<nav
  id="navDemo"
  class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large"
>
  <a class="w3-bar-item w3-button w3-padding-large">Item1</a>
  <a class="vF w3-bar-item w3-button w3-padding-large">Friends</a>
  <a class="vT w3-bar-item w3-button w3-padding-large">My Profile</a>
</nav>
 -->