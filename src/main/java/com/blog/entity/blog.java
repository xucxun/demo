package com.blog.entity;

import java.io.Serializable;
import java.util.Date;

public class blog implements Serializable{
	/*博客Bean*/
	
	private static final long serialVersionUID = 1L;/*定义程序序列化ID*/
	/*博客id*/
	private Integer id;
	/*博客标题*/
	private String title;
	/*博客摘要*/
	private String summary;
	/*博客发布日期*/
	private Date releaseDate;
	/*查看次数*/
	private Integer viewNum;
	/*评论次数*/
	private Integer replyNum;
	/*博客内容*/
	private String content;
	/*外联所属博客类型*/
	private blogType blogType;
	/*纯文本格式的内容*/
	private String contentNoTag;
	/*博客发布日期*/
	private String releaseDateStr;
	/*博客数量*/
	private Integer blogCount;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Integer getViewNum() {
		return viewNum;
	}
	public void setViewNum(Integer viewNum) {
		this.viewNum = viewNum;
	}
	public Integer getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(Integer replyNum) {
		this.replyNum = replyNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public blogType getBlogType() {
		return blogType;
	}
	public void setBlogType(blogType blogType) {
		this.blogType = blogType;
	}
	public String getContentNoTag() {
		return contentNoTag;
	}
	public void setContentNoTag(String contentNoTag) {
		this.contentNoTag = contentNoTag;
	}
	public String getReleaseDateStr() {
		return releaseDateStr;
	}
	public void setReleaseDateStr(String releaseDateStr) {
		this.releaseDateStr = releaseDateStr;
	}
	public Integer getBlogCount() {
		return blogCount;
	}
	public void setBlogCount(Integer blogCount) {
		this.blogCount = blogCount;
	}
	
	
}
