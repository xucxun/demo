package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.entity.blog;

public interface blogDao {
	/*查询所有博客列表*/
	public List<blog> countList();
	
	/*按博客id查询博客*/
	public blog selectById(Integer id);
	
	/*条件查询所有博客的列表*/
	public List<blog> list(Map<String,Object> Map);
	
	/*查询博客数量*/
	public Long getTotal(Map<String,Object> Map);
	
	/*根据类型查询博客数量*/
	public Integer getBlogByTypeId(Integer typeId);
	
	/*添加一条博客*/
	public Integer add(blog blog);
	
	/*修改博客*/
	public Integer update(blog blog);
	
	/*删除一条博客*/
	public Integer delete(Integer id);	
	
	//上一篇
	public blog getLastBlog(Integer id);
	
	//下一篇
	public blog getNextBlog(Integer id);
}
