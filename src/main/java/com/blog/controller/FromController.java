package com.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

public class FromController {
	//动态页面跳转控制器
	//用户密码错误提示
	@Controller
	public class FormController {
	    @RequestMapping(value="/{formName}")
	    public String login(@PathVariable String formName){
	        return formName;
	    }

	}
}
