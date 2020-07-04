package com.blog.entity;

import java.util.Date;

public class comment {
	private Integer id;
	private String userName;
	private blog blog;
	private String content;
	private Date commentDate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public blog getBlog() {
		return blog;
	}
	public void setBlog(blog blog) {
		this.blog = blog;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	
	
}
