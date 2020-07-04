package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.entity.comment;

public interface commentService {
		//添加一条评论
		public int add(comment comment);
		
		//评论查询
		public List<comment> list(Map<String,Object> map);
		
		//评论数量
		public Long getTotal(Map<String,Object> map);
		//删除评论
		public Integer delete(Integer id);
		
		
		
		
}
