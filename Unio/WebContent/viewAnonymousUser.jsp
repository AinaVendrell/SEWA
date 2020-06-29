<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.square  {
	   margin-top: 15px;
	

</style>
<div uid="${user.uid}" class="w3-container w3-content"
	style="max-width: 1400; margin-top: 0px;">
	<!-- The Grid -->
	<div class="w3-row">
		<!-- Left Column -->
		<div class="w3-col m3">
			<!-- Profile -->
			<div class="square">
				<div id="duser">
					<div class="w3-card w3-round w3-white">
						
							<div class="w3-container">
							<h4 class="w3-center">Profile</h4>
	
							<p class="w3-center">
								<img src="${user.avatar}" class="w3-circle"
									style="height: 106px; width: 106px;" alt="Avatar" />
							</p>
							<hr />
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
						</div>
					</div>
				</div>
			</div>

			<!-- End Left Column -->
		</div>

		<div class="w3-col m9">
			<div>
				<c:forEach var="t" items="${tweets}">
					<div id="${t.tid}" uid="${t.uid}"
						class="w3-container w3-card w3-white w3-round w3-margin w3-animate-opacity">
						<br> <a class="vPA" title="Profile"> <img
							src="${t.avatar}" alt="Avatar"
							class="w3-left w3-circle w3-margin-right" style="width: 60px" />
						</a> <span class="w3-right w3-opacity"> ${t.postDateTime} </span>
						<h4 class="vPA">${t.username}</h4>
						<br>
						<hr class="w3-clear">
						<p>${t.content}</p>
						<p>Likes ${t.likes}</p>


					</div>
				</c:forEach>
			</div>
		</div>

		<!-- End Grid -->
	</div>
</div>


