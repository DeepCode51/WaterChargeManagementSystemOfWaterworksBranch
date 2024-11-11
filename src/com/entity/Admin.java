package com.entity;

/**
 * 管理员
 */
public class Admin {


    private Integer id;  // 
    private String username;  // 用户名
    private String userpwd;  // 密码
    private String identity;  // 身份
	

	public Admin() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}
	
		
}