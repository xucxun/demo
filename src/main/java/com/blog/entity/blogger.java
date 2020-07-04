package com.blog.entity;

/*封装博主javaBean*/
public class blogger {
	/**博主id*/
	private Integer id; 
	/**博主登录名*/
	private String userName; 
	/**博主密码*/
	private String password;
	/**博主信息*/
	private String info;
	/**博主昵称*/
	private String nickName;
	/**博主签名*/
	private String sign;
	/**博主头像地址*/
	private String imagePath; 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
}
