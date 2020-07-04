package com.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.blog.entity.PageBean;
import com.blog.entity.blog;
import com.blog.service.blogService;
import com.blog.utils.StringUtil;
import com.blog.utils.pageUtil;;
@Controller
public class blogListController {
	
	@Resource
	private blogService blogService;
	
	//list转发到首页
	@RequestMapping({"/index"})
	public ModelAndView index(@RequestParam(value="page",required=false,defaultValue = "1")String page,
			@RequestParam(value="typeId",required=false)String typeId,
			@RequestParam(value="releaseDateStr",required=false)String releaseDateStr,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("title","个人博客系统");
		if(StringUtil.isEmpty(page)) {
			page = "1";
		}
		//每页显示10条博客
		PageBean pageBean = new PageBean(Integer.parseInt(page),10);
		Map<String,Object> map = new HashMap<>();
		map.put("start", pageBean.getStart());
		map.put("size",pageBean.getPageSize());
		map.put("typeId", typeId);
		map.put("releaseDateStr",releaseDateStr);
		List<blog> list = blogService.list(map);
		//分页功能
		StringBuffer param = new StringBuffer();
		if(StringUtil.isNotEmpty(typeId)) {
			param.append("typeId="+typeId+"&");
		}
		
		if(StringUtil.isNotEmpty(releaseDateStr)) {
			param.append("releaseDateStr="+releaseDateStr+"&");
		}
		mv.addObject("ListPage","fontpage/list.jsp");
		String pageHtml = pageUtil.genPageHtml(request.getContextPath()+"/index.html", blogService.getTotal(map), Integer.parseInt(page), 10, param.toString());
		mv.addObject("pageHtml",pageHtml);
		mv.addObject("blogList",list);
		return mv;
		
	}
}
