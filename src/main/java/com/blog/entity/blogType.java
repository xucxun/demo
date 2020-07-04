package com.blog.entity;

import java.io.Serializable;

public class blogType implements Serializable{
  
	/* 博客类别信息*/
	private static final long serialVersionUID = 1L;/*定义程序序列化ID*/
	private Integer id;		/*博客类别id*/
	private String typeName;/*类别名称*/
	private Integer orderNum;/*序号*/
	private Integer blogCount;/*同博客类别的博客数量*/
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	public Integer getBlogCount() {
		return blogCount;
	}
	public void setBlogCount(Integer blogCount) {
		this.blogCount = blogCount;
	}
}
