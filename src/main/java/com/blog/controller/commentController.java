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
import org.springframework.web.context.ContextLoader;

import com.blog.entity.PageBean;
import com.blog.entity.blog;
import com.blog.entity.comment;
import com.blog.service.commentService;
import com.blog.utils.DateJsonValueProcessor;
import com.blog.utils.ResponseUtil;
import com.blog.utils.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

//评论管理
@Controller
@RequestMapping({"/admin/comment"})
public class commentController {
	
	@Resource
	private commentService commentService;
	
	/**
	 * 查看评论列表
	 * @param page
	 * @param rows
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping({"/list"})
	public String list(@RequestParam(value="page",required=false,defaultValue = "1")String page,
			@RequestParam(value="rows",required=false,defaultValue = "5")String rows,
			HttpServletResponse response) throws Exception{
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		//查询评论列表
		List<comment> commentList = commentService.list(map);
		//查询评论总数
		Long total = commentService.getTotal(map);
		//用Json将数据写入response
		JSONObject result = new JSONObject();
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(commentList, config);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
		
	}
	
	/**
	 * 删除评论
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping({"/deleteComment"})
	public String delete(@RequestParam("ids")String ids,HttpServletResponse response) throws Exception {
		
		String[] ToRemoveId = ids.split(",");
		for(int i =0;i<ToRemoveId.length;i++) {
			commentService.delete(Integer.parseInt(ToRemoveId[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success", Boolean.TRUE);
		ResponseUtil.write(response, result);
		return null;
	}
}
