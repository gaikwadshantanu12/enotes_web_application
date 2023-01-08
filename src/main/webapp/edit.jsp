<%@page import="com.user.Post"%>
<%@page import="com.user.UserDetails"%>
<%@page import="com.database.DatabaseConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<%
    	UserDetails user4 = (UserDetails)session.getAttribute("userD");
    	if(user4 == null){
    		response.sendRedirect("login.jsp");
    		//session.setAttribute("login-error", "To Edit Your Notes, Please Login...");
    	}
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>ENotes | Edit Notes Page</title>
		<%@include file="files_jsp/cdn_links.jsp"%>
	</head>

	<body>
	
		<%
			int note_id = Integer.parseInt(request.getParameter("note_id"));
			PostDAO postDAO = new PostDAO(DatabaseConnect.getDatabaseConnection());
			Post post = postDAO.getDataByID(note_id);
		%>
		
		<div class="container-fluid p-0">
			<%@include file="files_jsp/header.jsp" %>
		
			<h1 class="text-center mt-4">Edit Your Notes Here</h1>
		
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<form action="EditNotesServlet" method="post">
							<input type="hidden" name="note_id" value="<%= note_id %>">
  							<div class="form-group mt-4">
    							<label for="exampleInputNotesTitle1">Edit Notes Title / Enter New Title</label>
    							<input type="text" class="form-control" name="title" id="exampleInputNotesTitle1" aria-describedby="titleHelp" required="required" value="<%= post.getTitle() %>">
 							</div>
  					
  							<div class="form-group mt-4">
  								<label for="exampleInputNotes1">Edit Notes Content / Enter New Content</label>
    							<textarea rows="9" cols="" class="form-control" name="content" id="exampleInputNotes1" style="resize: none;" required="required"><%= post.getContent() %></textarea>
  							</div>
  
  							<div class="container text-center">
  								<button type="submit" class="btn btn-primary mt-3">Update Notes</button>
  							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>