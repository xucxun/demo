package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.entity.comment;

public interface commentDao {
	//添加一条评论
	public int add(comment comment);
	
	//更新一条评论
	public int update(comment comment);
	
	//评论查询
	public List<comment> list(Map<String,Object> map);
	
	//评论数量
	public Long getTotal(Map<String,Object> map);
	
	//删除评论
	public Integer delete(Integer id);

	//根据博客id查看评论
	public Integer selectByBlogId(Integer blogId);
	
	//根据博客id删除评论
	public Integer deleteByBlogId(Integer blogId);
}
