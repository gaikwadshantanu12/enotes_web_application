package com.database;

import java.sql.*;

public class DatabaseConnect {
	
	private static Connection connection;
	
	public static Connection getDatabaseConnection() {
		try {
			if(connection == null) {
				System.out.println("Driver registration started");
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("Driver is registered");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_enotes","root","");
				System.out.println("Connected to database !");
			}
		} 
		catch(Exception e) {
			System.out.println(e);
		}
		return connection;
	}
}
