package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.PostDAO;
import com.database.DatabaseConnect;

@SuppressWarnings("serial")
@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PostDAO postDAO = new PostDAO(DatabaseConnect.getDatabaseConnection());
		boolean f = postDAO.addNotes(title, content, uid);
		
		if(f) {
			System.out.println("Data inserted in posts");
			response.sendRedirect("show_notes.jsp");
		}
		else{
			System.out.println("Data not inserted in posts");
		}
	}

}
