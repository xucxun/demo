package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.linkDao;
import com.blog.entity.link;
import com.blog.service.linkService;
@Service("linkService")
public class linkServiceImpl implements linkService{
	
	@Resource
	private linkDao linkDao;
	
	@Override
	public link selectById(Integer id) {
		// TODO Auto-generated method stub
		return linkDao.selectById(id);
	}

	@Override
	public List<link> list(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		 return linkDao.list(paramMap);
	}

	@Override
	public Long getTotal(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return linkDao.getTotal(paramMap);
	}

	@Override
	public Integer add(link link) {
		// TODO Auto-generated method stub
		return linkDao.add(link);
	}

	@Override
	public Integer update(link link) {
		// TODO Auto-generated method stub
		return linkDao.update(link);
	}

	@Override
	public Integer delete(Integer id) {
		// TODO Auto-generated method stub
		return linkDao.delete(id);
	}
	
}
