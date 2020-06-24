<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="u" items="${users}">       
 <div uid="${u.uid}" class="sU w3-container w3-card w3-white w3-round w3-margin w3-animate-opacity"><br>
   <a class="vP" title="Profile">
   	<img src="${u.avatar}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px"/>
   </a>
   <h4 class="vP" > ${u.username} </h4><br>
   <button type="button" class="uU w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-user-times"></i> &nbsp;Unfollow</button> 
 </div>
</c:forEach>