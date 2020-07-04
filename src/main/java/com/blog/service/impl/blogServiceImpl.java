package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.blog.dao.blogDao;
import com.blog.dao.commentDao;
import com.blog.entity.blog;
import com.blog.service.blogService;

@Service("blogService")
public class blogServiceImpl implements blogService{
	@Resource
	private blogDao blogDao;
	@Resource
	private commentDao commentDao;
	
	@Override
	public List<blog> countList() {
		return blogDao.countList();
	}
	@Override
	public List<blog> list(Map<String, Object> map) {
		return blogDao.list(map);
	}
	@Override
	public Long getTotal(Map<String, Object> map) {
		return blogDao.getTotal(map);
	}
	@Override
	public Integer getBlogByTypeId(Integer typeId) {
		return blogDao.getBlogByTypeId(typeId);
	}
	@Override
	public blog selectById(Integer id) {
		return blogDao.selectById(id);
	}
	@Override
	public Integer add(blog blog) {
		return blogDao.add(blog);
	}
	@Override
	public Integer update(blog blog) {
		return blogDao.update(blog);
	}
	@Override
	public Integer delete(Integer id) {
		commentDao.deleteByBlogId(id);
		return blogDao.delete(id);
	}
	@Override
	public blog getLastBlog(Integer id) {
		// TODO Auto-generated method stub
		return blogDao.getLastBlog(id);
	}
	@Override
	public blog getNextBlog(Integer id) {
		// TODO Auto-generated method stub
		return blogDao.getNextBlog(id);
	}
	
}
