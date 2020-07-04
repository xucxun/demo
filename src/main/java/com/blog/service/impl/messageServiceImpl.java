package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.blog.entity.message;
import com.blog.dao.messageDao;
import com.blog.service.messageService;
@Service("messageService")
public class messageServiceImpl implements messageService{
	@Resource
	private messageDao messageDao;
	@Override
	public int add(message message) {
		return messageDao.add(message);
	}

	@Override
	public List<message> list(Map<String, Object> map) {
		return messageDao.list(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return messageDao.getTotal(map);
	}

	@Override
	public Integer delete(Integer id) {
		return messageDao.delete(id);
	}

}
