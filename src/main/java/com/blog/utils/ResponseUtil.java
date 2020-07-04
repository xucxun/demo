package com.blog.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/*写入response的工具类,将后台处理完的结果写回前端页面*/

public class ResponseUtil {
	public static void write(HttpServletResponse response,Object o)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(o.toString());
		out.flush();
		out.close();
	}

}
