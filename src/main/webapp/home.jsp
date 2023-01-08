<%@page import="com.user.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
    <%
    	UserDetails user2 = (UserDetails)session.getAttribute("userD");
    	if(user2 == null){
    		response.sendRedirect("login.jsp");
    		session.setAttribute("login-error", "Please Login, Else You Can't Access Home Page");
    	}
    %>
    
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>ENotes | User Home Page</title>
			<%@include file="files_jsp/cdn_links.jsp"%>
		</head>

	<body>
		<div class="container-fluid p-0">
		<%@include file="files_jsp/header.jsp" %>
			<div class="card py-5">
				<div class="card-body text-center">
					<img src="files_images/add_notes.jpg" alt="" class="img-fluid mx-auto" style="max-widht: 300px; max-height: 300px;">
					<h1 class="display-5 mt-3 text-success">START TAKING YOUR NOTES HERE...</h1>
					<a href="add_notes.jsp" class="btn btn-outline-dark mt-3">Start Here</a>
				</div>
			</div>
		</div>
	</body>
</html>