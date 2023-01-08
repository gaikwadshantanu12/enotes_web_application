<%@page import="com.user.Post"%>
<%@page import="com.user.UserDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.database.DatabaseConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
    <%
    	UserDetails user3 = (UserDetails)session.getAttribute("userD");
    	if(user3 == null){
    		response.sendRedirect("login.jsp");
    		session.setAttribute("login-error", "To See All Notes, Please Login...");
    	}
    %>
    
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>ENotes | All Notes</title>
			<%@include file="files_jsp/cdn_links.jsp"%>
		</head>

		<body>
			<%@include file="files_jsp/header.jsp"%>
			
			<%
				String update_msg = (String)session.getAttribute("note_update_msg");
			
				if(update_msg != null){%>
					<div class="alert alert-success" role="alert"><%= update_msg%></div>
				<%
					session.removeAttribute("note_update_msg");
				}
			%>
			
			<%
				String delete_wrong_msg = (String)session.getAttribute("delete_went_wrong");
			
				if(delete_wrong_msg != null){%>
					<div class="alert alert-danger alert-dismissible fade show" role="alert"><%= delete_wrong_msg%></div>
				<%
					session.removeAttribute("delete_went_wrong");
				}
			%>
		
			<div class="container">
				<h2 class="text-center mt-4">All Notes</h2>
		
				<div class="row">
					<div class="col-md-12">
					
					<%
						if(user3 != null){
							PostDAO postDAO = new PostDAO(DatabaseConnect.getDatabaseConnection());
							List<Post> post = postDAO.getData(user3.getID());
									
							for(Post p : post){%>
								
								<div class="card mt-3">
									<img alt="" src="files_images/add_notes.jpg" class="card-img-top mt-2 mx-auto" style="max-width: 100px; max-height: 100px;">
					
									<div class="card-body p-4">
							
										<h5 class="card-title"><%= p.getTitle() %></h5>
										<p><%= p.getContent() %></p>
						
										<p>
											<b class="text-success">Published By : <%= user3.getName() %></b><br>
											<b class="text-primary"></b>
										</p>
						
										<p>
											<b class="text-success">Published Date : <%= p.getDate() %></b><br>
											<b class="text-success"></b>
										</p>
							
										<div class="container text-center mt-2">
											<a href="DeleteNotesServlet?note_id=<%= p.getId() %>" class="btn btn-danger mr-2">Delete</a>
											<a href="edit.jsp?note_id=<%= p.getId() %>" class="btn btn-primary ml-2">Edit</a>
										</div>
									</div>
								</div>
								
									<%}
								}
							%>
					</div>
				</div>
			</div>
		</body>
	</html>