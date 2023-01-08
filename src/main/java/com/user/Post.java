package com.user;

import java.util.Date;

public class Post{
	private int id;
	private String title;
	private String content;
	private Date date;
	private UserDetails userDetails;
	
	public Post(int id, String title, String content, Date date, UserDetails userDetails) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.userDetails = userDetails;
	}

	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}
}