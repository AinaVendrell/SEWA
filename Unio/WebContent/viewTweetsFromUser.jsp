<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="t" items="${tweets}">       
 <div id="${t.tid}" class="w3-container w3-card w3-white w3-round w3-margin w3-animate-opacity"><br>
   <img src="${t.avatar}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
   <span class="w3-right w3-opacity"> ${t.postDateTime} </span>
   <h4> ${t.uid} </h4><br>
   <hr class="w3-clear">
   <p> ${t.content} </p>
   <p> ${t.likes} </p>
   <button type="button" class="lT w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-o-up"></i> &nbsp;Like</button>
   <c:if test="${sessionScope.roll == 1}">
   <button type="button" class="dT w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button> 
   </c:if>
 </div>
</c:forEach>
