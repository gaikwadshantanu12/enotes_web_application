<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
	<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>ENotes | Registration Page</title>
			<%@include file="files_jsp/cdn_links.jsp"%>
		</head>
	
		<body>
			<%@include file="files_jsp/header.jsp"%>
			<div class="container-fluid div-color">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card mt-5">
						<div class="card-header text-center text-white bg-custom">
							<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
							<h4 class="mt-3">Registration Page</h4>
						</div>

						<%
						String registration_msg = (String) session.getAttribute("register_success");
						if (registration_msg != null) {
						%>
					
						<div class="alert alert-success" role="alert"><%=registration_msg%>
							<a href="login.jsp"> Click here to login</a>
						</div>
					
					<%
						session.removeAttribute("register_success");
					}
					%>

					<%
						String failed_msg = (String) session.getAttribute("register_fail");
						if (failed_msg != null) {
					%>
					
					<div class="alert alert-danger" role="alert"><%=failed_msg%></div>
					
					<%
						session.removeAttribute("register_fail");
					}
					%>

						<div class="card-body">
							<form action="UserServlet" method="post">
								<div class="form-group">
									<label for="exampleInputName1">Enter Full Name</label> 
									<input type="text" class="form-control" id="exampleInputName1" aria-describedby="nameHelp" name="first_name" required="required">
								</div>
							
								<div class="form-group">
									<label for="exampleInputEmail1">Enter Email</label> 
									<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="user_email" required="required">
								</div>
							
								<div class="form-group">
									<label for="exampleInputPassword1">Enter Password</label> 
									<input type="password" class="form-control" id="exampleInputPassword1" name="user_password" required="required">
								</div>

								<button type="submit" class="btn btn-primary badge-pill btn-block">Register Me</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>