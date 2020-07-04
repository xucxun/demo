package com.blog.service.impl;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.blog.entity.blog;
import com.blog.entity.blogType;
import com.blog.entity.blogger;
import com.blog.entity.link;
import com.blog.service.blogService;
import com.blog.service.blogTypeService;
import com.blog.service.bloggerService;
import com.blog.service.linkService;

/**
 * 初始化组件
 */
//将后台数据存放入Application域中
@Component
public class blogContentListener implements ServletContextListener, ApplicationContextAware {
	
	private static ApplicationContext applicationContext;
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}
	public void refreshSystem(ServletContext application){
		//博客类别
		//在项目启动时查询blogType,在spring容器中拿到blogTypeService这个bean的引用
		blogTypeService blogTypeService = (blogTypeService) applicationContext.getBean("blogTypeService");
		List<blogType> blogTypeList = blogTypeService.countList();
		//blogTypeService中放数据，页面使用el表达式取数据
		application.setAttribute("blogTypeCountList", blogTypeList);
		
		bloggerService bloggerService=(bloggerService) applicationContext.getBean("bloggerService");
		blogger blogger=bloggerService.find(); // 查询博主信息
		blogger.setPassword(null); 
		application.setAttribute("blogger", blogger);
		
		linkService linkService = (linkService) applicationContext.getBean("linkService");
		List<link> linkList=linkService.list(null); // 查询所有的友情链接信息
		application.setAttribute("linkList", linkList);

		blogService blogService=(blogService) applicationContext.getBean("blogService");
		List<blog> blogCountList=blogService.countList(); // 归档
		application.setAttribute("blogCountList", blogCountList);

		
	}
	
	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent){
		ServletContext application = servletContextEvent.getServletContext();
		refreshSystem(application);	
	}

	public void contextDestroyed(ServletContextEvent sce) {
	}
}

