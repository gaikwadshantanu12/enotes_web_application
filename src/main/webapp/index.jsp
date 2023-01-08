<%@page import="com.database.DatabaseConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
	<html>
		<head>
			<style type="text/css">
				.back-img{
					background: url("files_images/background_image_1.jpg");
					width: 100%;
					height: 91.5vh;
					background-repeat: no-repeat;
					background-size: cover;
				}
			</style>
			<meta charset="ISO-8859-1">
			<title>ENotes Web Application</title>
			<%@include file="files_jsp/cdn_links.jsp"%>
		</head>

	<body>
		<%@include file="files_jsp/header.jsp" %>
	
		<div class="container-fluid back-img">
			<div class="text-right">
				<h1 class="text-grey"><i class="fa fa-book mr-2 mt-5" aria-hidden="true"></i>ENotes - Save Your Notes Here</h1>
				<a href="login.jsp" class="btn btn-dark btn-lg mt-3 mr-2"><i class="fa fa-user-circle mr-2" aria-hidden="true"></i>Login</a>
				<a href="register.jsp" class="btn btn-dark btn-lg mt-3 ml-2"><i class="fa fa-user-plus mr-2" aria-hidden="true"></i>Register</a>
			</div>
		</div>
	</body>
</html>