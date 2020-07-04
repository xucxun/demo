package com.blog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.blog.dao.bloggerDao;
import com.blog.entity.blogger;
import com.blog.service.bloggerService;

import javax.servlet.http.HttpSession;

@Service("bloggerService")
public class bloggerServiceImpl implements bloggerService {

	@Resource
	private bloggerDao bloggerDao;
	
	public blogger getByUserNameAndPassword(String userName, String password) {
		// TODO Auto-generated method stub
		return bloggerDao.getByUserNameAndPassword(userName,password);
	}
	
	public blogger find() {
		return bloggerDao.find();
	}

	@Override
	public Integer update(blogger blogger) {
		return bloggerDao.update(blogger);
	}

}
