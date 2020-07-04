package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.entity.link;

public interface linkDao {
	//根据id查询一条友情链接
	public link selectById(Integer id);
	
	//查询友情链接列表
	public List<link> list(Map<String,Object> paramMap);
	
	//查询友情链接数
	public Long getTotal(Map<String,Object> paramMap);
	
	//添加一条友情链接
	public Integer add(link link);
	
	//修改友情链接
	public Integer update(link link);
	
	//删除友情链接
	public Integer delete(Integer id);
}
