package com.blog.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.blog.entity.blog;
import com.blog.entity.comment;
import com.blog.service.blogService;
import com.blog.service.commentService;
import com.blog.utils.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
public class blogArticleController {
	
	@Resource
	private blogService blogService;
	
	@Resource
	private commentService commentService;
	
	//点击首页博客标题进入博客内容页面
	@RequestMapping({"/article/{id}"})
		public ModelAndView details(@PathVariable("id")Integer id,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		//按id查询博客内容
		blog blog = blogService.selectById(id);
		mv.addObject("blog",blog);
		//阅读人数加1
		blog.setViewNum(blog.getViewNum()+1);
		blogService.update(blog);
		mv.addObject("ListPage","fontpage/article.jsp");
		mv.addObject("pageTitle",blog.getTitle()+"_个人博客系统");
		//加载上一篇下一篇html
		mv.addObject("pageHtml",getLastAndNextBlog(blogService.getLastBlog(id),blogService.getNextBlog(id),request.getServletContext().getContextPath()));
		
		//显示评论信息
		Map<String,Object> map = new HashMap<>();
		map.put("blogId", blog.getId());
		mv.addObject("commentList",commentService.list(map));
		mv.setViewName("index");
		return mv;
	}
	
	//显示上一篇和下一篇博客
	private String getLastAndNextBlog(blog lastBlog,blog nextBlog,String Context) {
		StringBuffer pageHtml = new StringBuffer();
		//判断上一篇博客是否存在
		if (lastBlog==null||lastBlog.getId()==null) {
			
			pageHtml.append("<p>上一篇：没有更多了</p>");
		}else {
			
			pageHtml.append("<p>上一篇：<a href='"+Context+"/article/"+lastBlog.getId()+".html'>"
					+lastBlog.getTitle()+"</a></p>");
		}
		//判断下一篇博客
		if(nextBlog==null||nextBlog.getId()==null) {
			pageHtml.append("<p>下一篇：没有更多了</p>");
		}else {
			pageHtml.append("<p>下一篇：<a href='"+Context+"/article/"+nextBlog.getId()+".html'>"
					+nextBlog.getTitle()+"</a></p>");
		}
		return pageHtml.toString();
		
	}
	
	//提交评论
	@RequestMapping("/comment/saveComment")
	public String saveComment(comment comment,@RequestParam("verCode")String verCode,
			HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws Exception{
		String imageRand = (String) session.getAttribute("imageRand");
		JSONObject result = new JSONObject();
		int n = 0;
		//输入的验证码和生成的验证码比较
		if(!verCode.equals(imageRand)) {
			result.put("success", Boolean.FALSE);
			result.put("erroInfo", "验证码填写错误！");
		}else {
			if(comment.getId()==null) {
			  n = commentService.add(comment);
			  blog blog = blogService.selectById(comment.getBlog().getId());
			  blog.setReplyNum(blog.getReplyNum()+1);
			  blogService.update(blog);
			}
		}
		if(n>0) {
			result.put("success",Boolean.TRUE);
		}else {
			result.put("success",Boolean.FALSE);
		}
		
		ResponseUtil.write(response, result);
		return null;		
		
	}
	
}
