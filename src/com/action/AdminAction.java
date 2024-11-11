package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.util.Pagination;

import com.entity.Admin;
import com.entity.User;
import com.dao.AdminDAO;
import org.springframework.util.ReflectionUtils;

public class AdminAction extends BaseAction implements ModelDriven<Admin> {
	@Autowired
	private AdminDAO adminDAO;

	// 模型驱动使用的对象，通过登录执行的方法将用户名和密码封装在Admin对象里.
	private Admin admin = new Admin();

	public Admin getModel() {
		return admin;
	}

	public String toadd() {
		return "toadd";
	}
	public String userlogin() {
		if(admin != null){
			String userNm = ServletActionContext.getRequest().getParameter("userName");
			String userPwd = ServletActionContext.getRequest().getParameter("userPw");
			ReflectionUtils re;
			Admin userTemp = new Admin();
			userTemp.setUsername(userNm);
			userTemp.setUserpwd(userPwd);
			userTemp.setIdentity("抄表员");
			List userList =  adminDAO.findByExample(admin);
			if(null != userList && userList.size() > 0){
				Admin user = (Admin) userList.get(0);
				ServletActionContext.getRequest().getSession().setAttribute("userType", 1);
				ServletActionContext.getRequest().getSession().setAttribute("user", user);
				return "userloginsucc";
			}
		}
		return "userloginfail";
	}
	public String add() {
		adminDAO.save(admin);
		this.setMessage("添加成功");
		this.setPath("admin!listpage.action");
		return "succeed";
	}

	//
	public String toedit() {
		admin = adminDAO.findById(admin.getId());
		getRequestMap().put("Admin", admin);
		return "toedit";
	}

	// 修改的执行方法
	public String edit() {
		adminDAO.merge(admin);
		this.setMessage("修改成功");
		this.setPath("admin!listpage.action");
		return "succeed";
	}

	public String listall() {
		List adminList = adminDAO.findByExample(admin);
		Map request = getRequestMap();
		request.put("adminList", adminList);
		return "list";
	}

	public String listpage() {
		List adminList = adminDAO.findByExample(admin);
		Map request = getRequestMap();
		request.put("adminList", adminList);
		return "list";
	}
	
	/**
	* 删除
	*/
	public String del() {
		if(admin!=null&&admin.getUsername()!=null&&"admin".endsWith(admin.getUsername())){
			this.setMessage("超级管理员不能删除");
			this.setPath("admin!listpage.action");		
			return "succeed";
		}
		adminDAO.delete(admin);
		this.setMessage("删除成功");
		this.setPath("admin!listpage.action");		
		return "succeed";
	}

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	public Admin getAdmin() {
		return this.admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

}