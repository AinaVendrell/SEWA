<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />



<div class="w3-bar w3-red">
	<a class="w3-bar-item w3-button" id="LogoutController" href="MainController"> <i class="fa fa-home" aria-hidden="true"></i> </a>
	<a class="menu w3-bar-item w3-button w3-hide-small" id="RegisterController" href=#> Registration </a> 
	<a class="menu w3-bar-item w3-button w3-hide-small" id="LoginController" href=#> Login </a> 
	<a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="stack()">&#9776;</a>
</div>

<div id="stack" class="w3-bar-block w3-red w3-hide w3-hide-large w3-hide-medium">
	<a class="menu w3-bar-item w3-button" id="RegisterController" href=#> Registration </a> 
	<a class="menu w3-bar-item w3-button" id="LoginController" href=#> Login </a> 
</div>


 <!--
<nav class="navbar navbar-expand-lg sticky-top navbar-light bg-light">
	<a class="navbar-brand" id="LogoutController" href="MainController"> <i class="fa fa-home sr-only" aria-hidden="true"></i> <img src="images/unio.svg"width="30" height="30" alt="" /></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			<li class="nav-item"><a class="nav-link" id="RegisterController" href=#> Registration </a></li>
			<li class="nav-item"><a class="nav-link" id="LoginController" href=#> Login </a></li>
			<a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="stack()">&#9776;</a>
		</ul>
	</div>
</nav>
-->