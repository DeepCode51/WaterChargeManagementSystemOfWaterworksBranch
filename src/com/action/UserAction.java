package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.dao.QuyuDAO;
import com.dao.UserDAO;
import com.entity.Quyu;
import com.entity.User;
import com.opensymphony.xwork2.ModelDriven;

import com.util.Pagination;

public class UserAction extends BaseAction implements ModelDriven<User> {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private QuyuDAO quyuDAO;
	
	
	public QuyuDAO getQuyuDAO() {
		return quyuDAO;
	}

	public void setQuyuDAO(QuyuDAO quyuDAO) {
		this.quyuDAO = quyuDAO;
	}

	// 模型驱动使用的对象，通过登录执行的方法将用户名和密码封装在User对象里.
	private User user = new User();

	public User getModel() {
		return user;
	}

	public String toadd() {
		List quyuList = quyuDAO.findByExample(new Quyu());
		Map request = getRequestMap();
		request.put("quyuList", quyuList);
		return "toadd";
	}
	
	public String add() {
		userDAO.save(user);
		this.setMessage("添加成功");
		this.setPath("user!listpage.action");
		return "succeed";
	}

	//
	public String toedit() {
		user = userDAO.findById(user.getId());
		getRequestMap().put("User", user);
		
		List quyuList = quyuDAO.findByExample(new Quyu());
		Map request = getRequestMap();
		request.put("quyuList", quyuList);
		return "toedit";
	}

	// 修改的执行方法
	public String edit() {
		userDAO.merge(user);
		this.setMessage("修改成功");
		this.setPath("user!listpage.action");
		return "succeed";
	}

	public String listall() {
		List userList = userDAO.findByExample(user);
		Map request = getRequestMap();
		request.put("userList", userList);
		return "list";
	}

	public String listpage() {
		List userList = userDAO.findByExample(user);
		Map request = getRequestMap();
		request.put("userList", userList);
		return "list";
	}
	
	/**
	* 删除
	*/
	public String del() {
		userDAO.delete(user);
		this.setMessage("删除成功");
		this.setPath("user!listpage.action");		
		return "succeed";
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}