<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
	<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>ENotes | Login Page</title>
			<%@include file="files_jsp/cdn_links.jsp"%>
		</head>
	
	<body>
		<%@include file="files_jsp/header.jsp"%>
		<div class="container-fluid div-color">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card mt-5">
						<div class="card-header text-center text-white bg-custom">
							<i class="fa fa-user-circle fa-3x" aria-hidden="true"></i>
							<h4 class="mt-3">Login Page</h4>
						</div>

					<%
						String failed_msg = (String) session.getAttribute("login_failed");
						if (failed_msg != null) {
					%>
			
						<div class="alert alert-danger" role="alert"><%= failed_msg%></div>
					<%
						session.removeAttribute("login_failed");
					}
					%>
					
					<%
						String loginerror = (String)session.getAttribute("login-error");
						if(loginerror != null){%>
							<div class="alert alert-danger" role="alert"><%= loginerror%></div>
						<%
						session.removeAttribute("login-error");
						}
					%>
					
					<%
						String logout_message = (String)session.getAttribute("logout-message");
						if(logout_message != null){%>
							<div class="alert alert-success" role="alert"><%= logout_message%></div>
						<%
						session.removeAttribute("logout-message");
						}
					%>

						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Enter Email</label> 
									<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="user_email" required="required">
								</div>
							
								<div class="form-group">
									<label for="exampleInputPassword1">Enter Password</label> 
									<input type="password" class="form-control" id="exampleInputPassword1" name="user_password" required="required">
								</div>

								<button type="submit" class="btn btn-primary badge-pill btn-block">Logged Me In</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>