package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.entity.comment;
import com.blog.service.commentService;
import com.blog.dao.commentDao;
import com.blog.dao.blogDao;

@Service("commentService")
public class commentServiceImpl implements commentService{
	
	@Resource
	private commentDao commentDao;
	@Override
	public int add(comment comment) {
		return commentDao.add(comment);
	}

	@Override
	public List<comment> list(Map<String, Object> map) {
		return commentDao.list(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return commentDao.getTotal(map);
	}

	@Override
	public Integer delete(Integer id) {
		return commentDao.delete(id);
	}


	

	
}
