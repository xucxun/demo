package com.blog.controller;

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
import com.blog.entity.blogType;
import com.blog.service.blogService;
import com.blog.service.blogTypeService;
import com.blog.service.impl.blogContentListener;

import com.blog.utils.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/*博客类别管理>博客类型信息管理*/
@Controller
@RequestMapping({"/admin/blogType"})
public class blogTypeController {
    
	@Autowired
	private blogContentListener blogContentListener;
	@Resource
	private blogTypeService blogTypeService;
	@Resource
	private blogService blogService;

	// 查询所有博客类型的列表 
	@RequestMapping({"/list"})
	public String list(@RequestParam(value="page",required=false,defaultValue = "1")String page,
		@RequestParam(value="rows",required=false,defaultValue = "5")String rows,
		HttpServletResponse response) throws Exception{	
		//easyUI默认传当前页码,固定参数为page,设置为1
		//easyUI默认传每页数据量,固定参数为rows，设置为5
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
    	/*查询所有的博客类别的列表*/
    	List<blogType> blogTypeList = blogTypeService.list(map);
    	/*查询总共有多少个博客类别*/
    	Long total = blogTypeService.getTotal(map);
    	/*用Json将数据写入response*/
    	JSONObject result = new JSONObject();
    	JSONArray jsonArray = JSONArray.fromObject(blogTypeList);
    	result.put("rows", jsonArray);
    	result.put("total", total);
    	ResponseUtil.write(response, result);
    	return null;
    }
	
	// 保存博客类别信息
	@RequestMapping({"/saveType"})
	public String saveType(blogType blogType,HttpServletResponse response) throws Exception {
		int n=0;
	    if(blogType.getId()==null) {
	    	// 没有记录，添加
		   n = blogTypeService.add(blogType).intValue();
	    }else {
			//有记录，修改
			n = blogTypeService.update(blogType).intValue();
		}
		JSONObject result = new JSONObject();
		// 刷新系统缓存
		blogContentListener.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext()); 
		if(n>0) {
			result.put("success", Boolean.valueOf(true));
		}else {
			result.put("success", Boolean.valueOf(false));
		}
		ResponseUtil.write(response, result);
		return null;
}	// 删除博客类别信息
	@RequestMapping({"/deleteType"})
	public String deleteType(@RequestParam("ids")String ids,HttpServletResponse response) throws Exception{
		String[] ToRemoveId = ids.split(",");
		JSONObject result = new JSONObject();
		for(int i =0;i<ToRemoveId.length;i++) {
			int blogNum = blogService.getBlogByTypeId(Integer.valueOf(ToRemoveId[i]));
			if(blogNum>0){
				result.put("exist", "该博客类别下有博客，无法删除!");
			}else{
				blogTypeService.delete(Integer.valueOf(ToRemoveId[i]));
			}
		}// 刷新系统缓存
		blogContentListener.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext()); 
		result.put("success", Boolean.valueOf(true));
		ResponseUtil.write(response, result);
		return null;		
	}
	
}
