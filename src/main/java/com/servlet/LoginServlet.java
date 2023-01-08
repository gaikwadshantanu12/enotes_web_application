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
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");

		UserDetails userDetails = new UserDetails();
		userDetails.setEmail(email);
		userDetails.setPassword(password);

		UserDAO userDAO = new UserDAO(DatabaseConnect.getDatabaseConnection());
		UserDetails user = userDAO.loginUser(userDetails);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userD", user);
			response.sendRedirect("home.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("login_failed", "Please check user credentials");
			response.sendRedirect("login.jsp");
		}
	}

}
