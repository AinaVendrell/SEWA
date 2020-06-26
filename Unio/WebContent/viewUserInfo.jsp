<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div uid="${user.uid}" class="w3-card w3-round w3-white">
	<div class="w3-container">
	<c:choose>
		<c:when test="${real.uid == user.uid}">
			<h4 class="w3-center">
				My Profile</i>
			</h4>
		</c:when>
		<c:otherwise>
			<h4 class="w3-center">
				Profile</i>
			</h4>
		</c:otherwise>
	</c:choose>
		
		<p class="w3-center">
			<img src="${user.avatar}" class="w3-circle"
				style="height: 106px; width: 106px" alt="Avatar">
		</p>
		<hr>
		<p id="username">
			<i class="fa fa-user fa-fw w3-margin-right w3-text-theme"></i>
			${user.username}
		</p>
		<p id="name">
			<i class="fa fa-id-card fa-fw w3-margin-right w3-text-theme"></i>
			${user.name} ${user.surname}
		</p>
		<p id="email">
			<i class="fa fa-envelope fa-fw w3-margin-right w3-text-theme"></i>
			${user.email}
		</p>
		<p id="birthday">
			<i class="fa fa-calendar fa-fw w3-margin-right w3-text-theme"></i>
			${user.birthday}
		</p>
		<c:if test="${real.uid == user.uid}">
		<button type="button" class="eP w3-button w3-theme-d1 w3-left">
			<i class="fa fa-pencil"></i> &nbsp;Edit
		</button>
	</c:if>
	<c:if test="${real.uid == user.uid}">
		<button type="button" class="dP w3-button w3-theme-d1 w3-right">
			<i class="fa fa-times-circle"></i> &nbsp;Delete
		</button>
	</c:if>
	</div>

</div>
<br>
<!-- script para que aparezca foto de perfil en nav bar -->
 <script>
 	$(document).ready(function() {
 		document.getElementById('avatar_pic').src="${user.avatar}"
 	});
 </script> 
