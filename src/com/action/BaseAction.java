package com.action;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {

	protected HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	protected Cookie[] getCookies() {
		return ServletActionContext.getRequest().getCookies();
	}

	protected HttpSession getSession() {
		return ServletActionContext.getRequest().getSession();
	}
	
	protected Map getRequestMap() {
		return (Map)ServletActionContext.getContext().get("request");
	}	
	
	protected void addAttribute(String name, String value) {
		this.getRequest().setAttribute("param_" + name, value);
	}
	
	// 标题
	protected String title;

	// 当前第几页
	public int currPage = 1;

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getCurrPage() {
		return currPage;
	}

	private String message;
	private String path;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
}
