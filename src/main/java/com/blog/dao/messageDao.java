package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.entity.message;

public interface messageDao {
	//添加一条留言
		public int add(message message);
		
		//更新一条留言
		public int update(message message);
		
		//留言查询
		public List<message> list(Map<String,Object> map);
		
		//留言数量
		public Long getTotal(Map<String,Object> map);
		
		//删除留言
		public Integer delete(Integer id);

}
