package com.blog.controller;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.blog.service.bloggerService;
import com.blog.service.impl.blogContentListener;
import com.blog.utils.DateUtil;
import com.blog.utils.ResponseUtil;

import net.sf.json.JSONObject;

import com.blog.entity.blog;
import com.blog.entity.blogger;

@Controller
@RequestMapping("/admin/blogger")
public class bloggerController {
	
	@Autowired
	private blogContentListener blogContentListener;
	 @Autowired
	 private bloggerService bloggerService;
	
	@RequestMapping("/login")
	public ModelAndView login(String userName,String password,ModelAndView mv,HttpSession session){
        
		blogger blogger=bloggerService.getByUserNameAndPassword(userName, password);
        
        if(blogger!=null){
            //登录成功，将user对象设置到HttpSession作用范围域中
           session.setAttribute("Blogger", blogger);
            //转发到main请求
           mv.setViewName("/admin/main");
        	 //mv.addObject("blogger",blogger);
           //  mv.setViewName("success");
            //return "redirect:/admin/main.jsp";
        
        }else {
            //登录失败，设置失败信息，并调转到登录页面          
          mv.addObject("erroInfo", "用户名或密码错误！");
          mv.setViewName("login");
        	
        	//return "login";    
        }
		return mv;
	}
	//修改博主个人信息
	@RequestMapping({"/saveInfo"})
	public String saveInfo(@RequestParam("imageFile")MultipartFile imageFile,blogger blogger,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		if(!imageFile.isEmpty()) {
			//对上传的文件(个人头像)进行处理:文件命名,转为File,存放在服务器所在路径
			String filePath = request.getServletContext().getRealPath("/");
			String imagePath = DateUtil.getCurrentDateStr()+"."+imageFile.getOriginalFilename().split("\\.")[1];
			imageFile.transferTo(new File(filePath+"static/images/"+imagePath));
			blogger.setImagePath(imagePath);
		} 
		int n = bloggerService.update(blogger);
		
		StringBuffer result = new StringBuffer();
		// 刷新系统缓存
		blogContentListener.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
		if(n>0) {
			result.append("<script lauguage='javascript'>alert('修改成功');window.location='/blog/admin/editInfo.jsp'</script>");
			//return  "redirect:/admin/editInfo.jsp";//重定向前alert无效服务端和客户端
			
		}else {
			result.append("<script lauguage='javascript'>alert('修改失败');</script>");
		}
		ResponseUtil.write(response, result);
		return null;
		
	}
	
	// 获取博主的json格式
	@RequestMapping({"/find"})
	public String find(HttpServletResponse response) throws Exception {
		blogger blogger=bloggerService.find();
		JSONObject jsonObject = JSONObject.fromObject(blogger);
		// 刷新系统缓存
		blogContentListener.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	//修改密码
	@RequestMapping({"/editPwd"})
	public String modifyPassword(@RequestParam(value="id",required=false,defaultValue = "1")String id,@RequestParam("newPassword")String newPassword,HttpServletResponse response) throws Exception {
		blogger blogger = new blogger();
		blogger.setId(Integer.parseInt(id));
		blogger.setPassword(newPassword);
		int resultTotal = bloggerService.update(blogger);
		JSONObject result = new JSONObject();
		// 刷新系统缓存
		blogContentListener.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
		if(resultTotal>0) {
			result.put("success", Boolean.TRUE);
		}else {
			result.put("success", Boolean.FALSE);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	//退出系统
	@RequestMapping({"/logout"})
	   public String logout(HttpSession session) throws Exception {
	       //session.removeAttribute("Blogger");
	       session.invalidate();
	     return "redirect:/login.jsp";
	   }
	
	@RequestMapping({"/aboutBlogger"})
	public ModelAndView aboutBlogger(){
		ModelAndView mv = new ModelAndView();
		mv.addObject("blogger",bloggerService.find());
		mv.addObject("ListPage","fontpage/info.jsp");
		mv.addObject("pageTitle","关于博主_个人博客系统");
		mv.setViewName("index");
		return mv;
		
	}
	
}
