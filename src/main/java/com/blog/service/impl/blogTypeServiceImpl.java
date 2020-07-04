package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.blog.dao.blogTypeDao;
import com.blog.entity.blogType;
import com.blog.service.blogTypeService;
@Service("blogTypeService")
public class blogTypeServiceImpl implements blogTypeService{
	@Resource
	private blogTypeDao blogTypeDao;
	
	@Override
	public List<blogType> countList() {
		return blogTypeDao.countList();
	}

	@Override
	public blogType selectById(Integer id) {
		return blogTypeDao.selectById(id);
	}

	@Override
	public List<blogType> list(Map<String, Object> paramMap) {
		return blogTypeDao.list(paramMap);
	}

	@Override
	public Long getTotal(Map<String, Object> paramMap) {
		return blogTypeDao.getTotal(paramMap);
	}

	@Override
	public Integer add(blogType blogType) {
		return blogTypeDao.add(blogType);
	}

	@Override
	public Integer update(blogType blogType) {
		return blogTypeDao.update(blogType);
	}

	@Override
	public Integer delete(Integer id) {
		return blogTypeDao.delete(id);
	}


}
