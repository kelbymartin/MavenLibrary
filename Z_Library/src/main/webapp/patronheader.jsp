<%@page import="com.cognixia.jump.model.Patron"%>
<%@page import="com.cognixia.jump.dao.PatronDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T2 Library</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<style><%@include file="/WEB-INF/css/libraryStyle.css"%></style>

</head>

<body>
<% if(request.getAttribute("userId") != null) { session.setAttribute("id", request.getAttribute("userId")); } %>
<% PatronDAO pdao = new PatronDAO(); Patron patron = pdao.getPatronById((int) session.getAttribute("id")); %>
<header>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  		<a class="navbar-brand" href="patronHome.jsp">Library</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		<div class="collapse navbar-collapse" id="navbarNav">
  		
		    <ul class="navbar-nav mr-auto">
		    
		      	<li class="nav-item">
		        	<a class="nav-link" href="<%= request.getContextPath() %>/viewAllBooks?action">All Books</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="<%= request.getContextPath() %>/viewAvailableBooks?action">Available Books</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="<%= request.getContextPath() %>/viewCheckedOutBooks?action&id=<%=patron.getPatId() %>">Your Books</a>
		      	</li>
		      	
		    </ul>
		    
		    
		      	
		    <ul class="navbar-nav">
		      	<li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Patron</a>
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                  	<h6 class="dropdown-header"><%= patron.getUser() %></h6>
                    <a class="dropdown-item" href="patronprofile.jsp">Profile</a>
                    <a class="dropdown-item" href="<%= request.getContextPath() %>">Logout</a>
                  </div>
                </li>
		    </ul>
		    
  		</div>
	</nav>
</header>