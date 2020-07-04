package com.blog.service;

import com.blog.entity.blogger;

/**
 * 判断博主登录
 * @Param String userName
 * @Param String password
 * */
public interface bloggerService {
	 blogger getByUserNameAndPassword(String userName,String password);
	 

	/**更新博主对象*/
	public Integer update(blogger blogger);
	 
	 /**查询博主*/
	 blogger find();
		
		
}
