package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.util.Pagination;

import com.entity.Jiesuantype;
import com.dao.JiesuantypeDAO;

public class JiesuantypeAction extends BaseAction implements ModelDriven<Jiesuantype> {
	@Autowired
	private JiesuantypeDAO jiesuantypeDAO;

	// 模型驱动使用的对象，通过登录执行的方法将用户名和密码封装在Jiesuantype对象里.
	private Jiesuantype jiesuantype = new Jiesuantype();

	public Jiesuantype getModel() {
		return jiesuantype;
	}

	public String toadd() {
		return "toadd";
	}

	public String add() {
		jiesuantypeDAO.save(jiesuantype);
		this.setMessage("添加成功");
		this.setPath("jiesuantype!listpage.action");
		return "succeed";
	}

	//
	public String toedit() {
		jiesuantype = jiesuantypeDAO.findById(jiesuantype.getId());
		getRequestMap().put("Jiesuantype", jiesuantype);
		return "toedit";
	}

	// 修改的执行方法
	public String edit() {
		jiesuantypeDAO.merge(jiesuantype);
		this.setMessage("修改成功");
		this.setPath("jiesuantype!listpage.action");
		return "succeed";
	}

	public String listall() {
		List jiesuantypeList = jiesuantypeDAO.findByExample(jiesuantype);
		Map request = getRequestMap();
		request.put("jiesuantypeList", jiesuantypeList);
		return "list";
	}

	public String listpage() {
		List jiesuantypeList = jiesuantypeDAO.findByExample(jiesuantype);
		Map request = getRequestMap();
		request.put("jiesuantypeList", jiesuantypeList);
		return "list";
	}
	
	/**
	* 删除
	*/
	public String del() {
		jiesuantypeDAO.delete(jiesuantype);
		this.setMessage("删除成功");
		this.setPath("jiesuantype!listpage.action");		
		return "succeed";
	}

	public JiesuantypeDAO getJiesuantypeDAO() {
		return jiesuantypeDAO;
	}

	public void setJiesuantypeDAO(JiesuantypeDAO jiesuantypeDAO) {
		this.jiesuantypeDAO = jiesuantypeDAO;
	}

	public Jiesuantype getJiesuantype() {
		return this.jiesuantype;
	}

	public void setJiesuantype(Jiesuantype jiesuantype) {
		this.jiesuantype = jiesuantype;
	}

}