package com.blog.dao;

import org.apache.ibatis.annotations.Param;

import com.blog.entity.blogger;

public interface bloggerDao{
	 blogger getByUserNameAndPassword(@Param("userName")String userName,@Param("password")String password);
	 
	 public Integer update(blogger blogger);
	 
	 public blogger find();
	 
	 
}
