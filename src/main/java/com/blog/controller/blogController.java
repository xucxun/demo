package com.blog.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;

import com.blog.entity.PageBean;
import com.blog.entity.blog;
import com.blog.entity.blogType;
import com.blog.service.blogService;
import com.blog.service.impl.blogContentListener;
import com.blog.utils.DateJsonValueProcessor;
import com.blog.utils.ResponseUtil;
import com.blog.utils.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

//博客管理页面
@Controller
@RequestMapping({"/admin/blog"})
public class blogController {
	
	@Autowired
	private blogContentListener blogContentListener;
	
	@Resource
	private blogService blogService;
	//写博客
	// 发布、修改博客
	@RequestMapping({"/saveBlog"})
	public String saveBlog(blog blog,HttpServletResponse response)throws Exception{
		int n=0;
		if(blog.getId()==null){
			//添加新的博客
			n = blogService.add(blog);
		}else{
			//修改博客
			n = blogService.update(blog);
		}
		
		JSONObject result = new JSONObject();
		// 刷新系统缓存
		blogContentListener.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
		if(n>0){
			result.put("success",Boolean.valueOf(true));
		}else{
			result.put("success",Boolean.valueOf(false));
		}
		ResponseUtil.write(response, result);
		return null;
		
	}
	
	//博客内容管理
	@RequestMapping({"/list"})
	public String list(@RequestParam(value="page",required=false,defaultValue = "1")String page,
			@RequestParam(value="rows",required=false,defaultValue = "5")String rows,blog blog,
			HttpServletResponse response) throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("size",pageBean.getPageSize());
		//模糊查询标题
		map.put("title", StringUtil.formatLike(blog.getTitle()));
		//分页查询博客列表
		List<blog> list = blogService.list(map);
		//取总记录数
		Long total = blogService.getTotal(map);		
		//封装到json
		JSONObject result = new JSONObject();
		//java日期格式转换JSON
		JsonConfig Jsonconfig = new JsonConfig();
		Jsonconfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(list,Jsonconfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;		
	}
	//删除博客
		@RequestMapping({"/deleteBlog"})
		public String delete(@RequestParam("ids")String ids,HttpServletResponse response) throws Exception {
		//获取的数据存入数组
		String[] idsStr = ids.split(",");
		//遍历数组
		for(int i = 0;i<idsStr.length;i++) {
			blogService.delete(Integer.parseInt(idsStr[i]));
			}
				
		JSONObject result = new JSONObject();
		// 刷新系统缓存
		blogContentListener.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
		result.put("success", Boolean.valueOf(true));
		ResponseUtil.write(response, result);
		return null;
		}
	
	/**
	 * 根据博客id查询博客的信息
	 * @param id
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping({"/selectById"})
	public String selectById(@RequestParam(value="id",required=false,defaultValue = "1")String id,HttpServletResponse response) throws Exception {
		//设置defaultValue = "1"，不然后台报400
		blog blog = blogService.selectById(Integer.parseInt(id));
		JSONObject jsonObject = JSONObject.fromObject(blog);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
