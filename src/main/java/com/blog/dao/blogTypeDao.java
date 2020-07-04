package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.entity.blogType;

public interface blogTypeDao {
	/*无参数根据类型统计博客数量*/
	public List<blogType> countList();
	
	/*按id查询博客类型*/
	public blogType selectById(Integer id);
	
	/*条件查询所有博客类型的列表*/
	public List<blogType> list(Map<String,Object> paramMap);
	
	/*查询博客类型数量*/
	public Long getTotal(Map<String,Object> paramMap);
	
	/*添加博客类型*/
	public Integer add(blogType blogType);
	
	/*修改博客类型*/
	public Integer update(blogType blogType);
	
	/*删除博客类型*/
	public Integer delete(Integer id);	
}
