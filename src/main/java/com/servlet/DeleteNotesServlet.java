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
@WebServlet("/DeleteNotesServlet")
public class DeleteNotesServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int note_id = Integer.parseInt(request.getParameter("note_id"));
			
			PostDAO postDAO = new PostDAO(DatabaseConnect.getDatabaseConnection());
			
			boolean res = postDAO.deletePost(note_id);
			
			HttpSession session = null;
			if(res) {
				System.out.println("Data deleted successfully !");
				session = request.getSession();
				session.setAttribute("note_update_msg", "Notes Deleted Successfully !");
				response.sendRedirect("show_notes.jsp");
			}
			else{
				session = request.getSession();
				session.setAttribute("delete_went_wrong", "Something Went Wrong ! Deletion Operation Cancel !");
				response.sendRedirect("show_notes.jsp");
				System.out.println("Data not deleted !");
			}
		} 
		catch (Exception e) {
			// TODO: handle exception
		}
	}
}
