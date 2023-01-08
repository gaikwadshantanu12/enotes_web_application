package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.database.DatabaseConnect;

@SuppressWarnings("serial")
@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int note_id = Integer.parseInt(request.getParameter("note_id"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			PostDAO postDAO = new PostDAO(DatabaseConnect.getDatabaseConnection());
			boolean res = postDAO.updatePost(note_id, title, content);
			
			if(res) {
				System.out.println("Data updated successfully !");
				HttpSession session = request.getSession();
				session.setAttribute("note_update_msg", "Notes Updated Successfully !");
				response.sendRedirect("show_notes.jsp");
			}
			else{
				System.out.println("Data not updated !");
			}
		} 
		catch (Exception e) {
			// TODO: handle exception
		}
	}
}
