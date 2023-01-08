<%@page import="com.user.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
    <%
    	UserDetails user1 = (UserDetails)session.getAttribute("userD");
    	if(user1 == null){
    		response.sendRedirect("login.jsp");
    		session.setAttribute("login-error", "To Add Notes, Please Login...");
    	}
    %>
      
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>ENotes | Add Notes Here</title>
		<%@include file="files_jsp/cdn_links.jsp"%>
	</head>

	<body>
		<div class="container-fluid p-0">
			<%@include file="files_jsp/header.jsp" %>
		
			<h1 class="text-center mt-4">Add Your Notes</h1>
		
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<form action="AddNotesServlet" method="post">
  							<div class="form-group mt-4">
  						
  								<%
  									UserDetails userDetails = (UserDetails)session.getAttribute("userD");
  									if(userDetails != null){%>
  										<input type="hidden" value="<%=userDetails.getID() %>" name="uid">
  									<%}
  								%>
  							
    							<label for="exampleInputNotesTitle1">Enter Notes Title</label>
    							<input type="text" class="form-control" name="title" id="exampleInputNotesTitle1" aria-describedby="titleHelp" required="required">
 							</div>
  					
  							<div class="form-group mt-4">
  								<label for="exampleInputNotes1">Enter Notes Content</label>
    							<textarea rows="9" cols="" class="form-control" name="content" id="exampleInputNotes1" style="resize: none;" required="required"></textarea>
  							</div>
  
  							<div class="container text-center">
  								<button type="submit" class="btn btn-primary mt-3">Add Notes</button>
  							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>