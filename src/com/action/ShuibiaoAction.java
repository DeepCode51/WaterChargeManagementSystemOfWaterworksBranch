package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.dao.JiesuantypeDAO;
import com.dao.ShuibiaoDAO;
import com.dao.UserDAO;
import com.entity.Jiesuantype;
import com.entity.Shuibiao;
import com.entity.User;
import com.opensymphony.xwork2.ModelDriven;

import com.util.Pagination;

public class ShuibiaoAction extends BaseAction implements ModelDriven<Shuibiao> {
	@Autowired
	private ShuibiaoDAO shuibiaoDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private JiesuantypeDAO jiesuantypeDAO;
	
	
	public JiesuantypeDAO getJiesuantypeDAO() {
		return jiesuantypeDAO;
	}

	public void setJiesuantypeDAO(JiesuantypeDAO jiesuantypeDAO) {
		this.jiesuantypeDAO = jiesuantypeDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	// 模型驱动使用的对象，通过登录执行的方法将用户名和密码封装在Shuibiao对象里.
	private Shuibiao shuibiao = new Shuibiao();

	public Shuibiao getModel() {
		return shuibiao;
	}

	public String toadd() {
		List jiesuantypeList = jiesuantypeDAO.findByExample(new Jiesuantype());
		Map request = getRequestMap();
		request.put("jiesuantypeList", jiesuantypeList);
		
		List userList = userDAO.findByExample(new User());
		getRequestMap().put("userList", userList);
		
		return "toadd";
	}

	public String add() {
		shuibiaoDAO.save(shuibiao);
		this.setMessage("添加成功");
		this.setPath("shuibiao!listpage.action");
		return "succeed";
	}

	//
	public String toedit() {
		shuibiao = shuibiaoDAO.findById(shuibiao.getId());
		getRequestMap().put("Shuibiao", shuibiao);
		
		List jiesuantypeList = jiesuantypeDAO.findByExample(new Jiesuantype());
		Map request = getRequestMap();
		request.put("jiesuantypeList", jiesuantypeList);
		
		List userList = userDAO.findByExample(new User());
		getRequestMap().put("userList", userList);		
		
		return "toedit";
	}

	// 修改的执行方法
	public String edit() {
		shuibiaoDAO.merge(shuibiao);
		this.setMessage("修改成功");
		this.setPath("shuibiao!listpage.action");
		return "succeed";
	}

	public String listall() {
		List shuibiaoList = shuibiaoDAO.findByExample(shuibiao);
		Map request = getRequestMap();
		request.put("shuibiaoList", shuibiaoList);
		return "list";
	}

	public String listpage() {
		List shuibiaoList = shuibiaoDAO.findByExample(shuibiao);
		Map request = getRequestMap();
		request.put("shuibiaoList", shuibiaoList);
		return "list";
	}
	
	/**
	* 删除
	*/
	public String del() {
		shuibiaoDAO.delete(shuibiao);
		this.setMessage("删除成功");
		this.setPath("shuibiao!listpage.action");		
		return "succeed";
	}

	public ShuibiaoDAO getShuibiaoDAO() {
		return shuibiaoDAO;
	}

	public void setShuibiaoDAO(ShuibiaoDAO shuibiaoDAO) {
		this.shuibiaoDAO = shuibiaoDAO;
	}

	public Shuibiao getShuibiao() {
		return this.shuibiao;
	}

	public void setShuibiao(Shuibiao shuibiao) {
		this.shuibiao = shuibiao;
	}

}