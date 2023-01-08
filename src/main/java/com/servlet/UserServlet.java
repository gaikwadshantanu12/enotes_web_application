package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.database.DatabaseConnect;
import com.user.UserDetails;

@SuppressWarnings("serial")
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_name = request.getParameter("first_name");
		String user_email = request.getParameter("user_email");
		String user_password = request.getParameter("user_password");

		UserDetails userDetails = new UserDetails();
		userDetails.setName(user_name);
		userDetails.setEmail(user_email);
		userDetails.setPassword(user_password);

		UserDAO userDAO = new UserDAO(DatabaseConnect.getDatabaseConnection());
		boolean f = userDAO.addUser(userDetails);

		HttpSession session;

		if (f) {
			session = request.getSession();
			session.setAttribute("register_success", "User registered successfully !");
			response.sendRedirect("register.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("register_fail", "User not registered. Something went wrong on server !");
			response.sendRedirect("register.jsp");
		}
	}
}
