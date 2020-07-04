package com.blog.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.blog.entity.PageBean;
import com.blog.entity.blog;
import com.blog.entity.comment;
import com.blog.entity.message;
import com.blog.service.messageService;
import com.blog.utils.DateJsonValueProcessor;
import com.blog.utils.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
public class messageController {
	@Resource
	private messageService messageService;
	
	//查看留言列表
	@RequestMapping({"/admin/message/list"})
	public String list(@RequestParam(value="page",required=false,defaultValue = "1")String page,
			@RequestParam(value="rows",required=false,defaultValue = "5")String rows,
			HttpServletResponse response) throws Exception{
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		//查询留言列表
		List<message> messageList = messageService.list(map);
		//查询留言总数
		Long total = messageService.getTotal(map);
		//用Json将数据写入response
		JSONObject result = new JSONObject();
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(messageList, config);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;	
	}
	//删除留言
	@RequestMapping({"/admin/message/deleteMessage"})
	public String delete(@RequestParam("ids")String ids,HttpServletResponse response) throws Exception {
		
		String[] ToRemoveId = ids.split(",");
		for(int i =0;i<ToRemoveId.length;i++) {
			messageService.delete(Integer.parseInt(ToRemoveId[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success", Boolean.TRUE);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping({"/message"})
	public ModelAndView message(){
		ModelAndView mv = new ModelAndView();
		//显示留言
		Map<String,Object> map = new HashMap<>();		
		mv.addObject("messageList",messageService.list(map));
		mv.addObject("ListPage","fontpage/message.jsp");
		mv.addObject("pageTitle","留言板_个人博客系统");
		mv.setViewName("index");
		return mv;	 
	}
	
	//提交留言
		@RequestMapping("/saveMessage")
		public String saveComment(message message,
				HttpServletRequest request,
				HttpServletResponse response,HttpSession session) throws Exception{
			JSONObject result = new JSONObject();
			int n = 0;
			n=	messageService.add(message);					
			if(n>0) {
				result.put("success",Boolean.TRUE);
			}else {
				result.put("success",Boolean.FALSE);
			}
			
			ResponseUtil.write(response, result);
			return null;		
			
		}
}
