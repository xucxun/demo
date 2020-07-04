package com.blog.utils;


	// 翻页工具类
public class pageUtil {
	
	// <li><a href='/index.html?page=1&'>首页</a></li>
	//<li class='disabled'><a href='#'>上一页</a>
	//</li><li class='active'><a href='/index.html?page=1&'>1</a></li>
	//<li class='disabled'><a href='#'>下一页</a></li>
	//<li><a href='/index.html?page=1&'>尾页</a></li>
	
	// 翻页方法
	public static String genPageHtml(String targetUrl,long totalPages,int currentPage,int pageSize,String param) {
		//总共页数totalPages
		if(totalPages==0) {
			return "未查询到博客!";
		}
		long totalPage = 1;
		if (totalPages%pageSize==0) {
			totalPage = totalPages/pageSize;
		}else {
			totalPage = totalPages/pageSize+1;
		}
		
		StringBuffer pageHtml = new StringBuffer();
		pageHtml.append("<li><a href='"+targetUrl+"?page=1&"+param+"'>首页</a></li>");
		//上一页
		if(currentPage>1) {			//当前页不是第一页，显示上一页并且能点击
			pageHtml.append("<li><a href='"+targetUrl+"?page=" + (currentPage - 1) + "&" + param + "'>上一页</a></li>");
		}else {						//当前页是第一页，显示上一页但不能点击击
			pageHtml.append("<li class='disabled'> <a href='#'>上一页</a></li>");
		}
		
		//显示页数
		for(int i=1;i<=totalPage;i++) {
			if(i==currentPage) {
				pageHtml.append("<li class='active'> <a href='"+targetUrl+"?page="+i+"&"+param+"'>"+i+"</a></li>");
			}else {
				pageHtml.append("<li> <a href='"+targetUrl+"?page="+i+"&"+param+"'>"+i+"</a></li>");
			}
		}
		//下一页
		if(currentPage<totalPage) {
			pageHtml.append("<li><a href='"+targetUrl+"?page=" + (currentPage + 1) + "&" + param + "'>下一页</a></li>");
		}else {
			pageHtml.append("<li class='disabled'> <a href='#'>下一页</a></li>");
		}
		//尾页
		pageHtml.append("<li> <a href='"+targetUrl+"?page="+totalPage+"&"+param+"'>尾页</a></li>");
	
		return pageHtml.toString();
	}
}
