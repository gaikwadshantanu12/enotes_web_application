package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.Post;

public class PostDAO {
	
	private Connection connection;

	public PostDAO(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean addNotes(String title, String content, int uid) {
		boolean f = false;
		
		try {
			String query = "INSERT INTO post(title, content, uid) values (?,?,?)";
			
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, content);
			preparedStatement.setInt(3, uid);
			
			int i = preparedStatement.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		} 
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return f;
	}
	
	public List<Post> getData(int id){
		List<Post> list = new ArrayList<Post>();
		Post post = null;
		
		try {
			String query = "SELECT * FROM post WHERE uid=? ORDER BY id DESC";
			
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				post = new Post();
				
				post.setId(resultSet.getInt(1));
				post.setTitle(resultSet.getString(2));
				post.setContent(resultSet.getString(3));
				post.setDate(resultSet.getTimestamp(4));
				
				list.add(post);
			}
		} 
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	public Post getDataByID(int note_id) {
		Post post = null;
		
		try {
			String query = "SELECT * FROM post WHERE id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, note_id);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setTitle(resultSet.getString("title"));
				post.setContent(resultSet.getString("content"));
				//System.out.println(post.getId()+"\n"+post.getTitle()+"\n"+post.getContent());
			}
		} 
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return post;
	}
	
	public boolean updatePost(int note_id, String title, String content) {
		boolean f = false;
		
		try {
			String query = "UPDATE post SET title=?, content=? WHERE id=?";
			
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, content);
			preparedStatement.setInt(3, note_id);
			
			int i = preparedStatement.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		} 
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return f;
	}
	
	public boolean deletePost(int note_id) {
		boolean f = false;
		
		try {
			String query = "DELETE FROM post WHERE id=?";
			
			PreparedStatement preparedStatement = connection.prepareCall(query);
			preparedStatement.setInt(1, note_id);
			
			int i = preparedStatement.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		} 
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return f;
	}

}
