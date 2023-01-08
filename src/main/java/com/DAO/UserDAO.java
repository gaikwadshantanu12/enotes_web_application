package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.user.UserDetails;

public class UserDAO {
	private Connection connection;

	public UserDAO(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean addUser(UserDetails userDetails) {
		boolean f = false;
		
		try {
			String query = "INSERT INTO user(name, email, password) values(?,?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, userDetails.getName());
			preparedStatement.setString(2, userDetails.getEmail());
			preparedStatement.setString(3, userDetails.getPassword());
			
			int i = preparedStatement.executeUpdate();
			if(i== 1) {
				f = true;
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public UserDetails loginUser(UserDetails userDetails) {
			
		UserDetails userD = null;
		try {
			String query = "SELECT * FROM user WHERE email=? and password=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, userDetails.getEmail());
			preparedStatement.setString(2, userDetails.getPassword());
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				userD = new UserDetails();
				userD.setEmail(resultSet.getString("email"));
				userD.setName(resultSet.getString("name"));
				userD.setPassword(resultSet.getString("password"));
				userD.setID(resultSet.getInt("id"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return userD;
	}
}
