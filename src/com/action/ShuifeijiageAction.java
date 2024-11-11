package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.util.Pagination;

import com.entity.Shuifeijiage;
import com.dao.ShuifeijiageDAO;

public class ShuifeijiageAction extends BaseAction implements ModelDriven<Shuifeijiage> {
	@Autowired
	private ShuifeijiageDAO shuifeijiageDAO;

	// 模型驱动使用的对象，通过登录执行的方法将用户名和密码封装在Shuifeijiage对象里.
	private Shuifeijiage shuifeijiage = new Shuifeijiage();

	public Shuifeijiage getModel() {
		return shuifeijiage;
	}

	public String toadd() {
		return "toadd";
	}

	public String add() {
		shuifeijiageDAO.save(shuifeijiage);
		this.setMessage("添加成功");
		this.setPath("shuifeijiage!listpage.action");
		return "succeed";
	}

	//
	public String toedit() {
		shuifeijiage = shuifeijiageDAO.findById(shuifeijiage.getId());
		getRequestMap().put("Shuifeijiage", shuifeijiage);
		return "toedit";
	}

	// 修改的执行方法
	public String edit() {
		shuifeijiageDAO.merge(shuifeijiage);
		this.setMessage("修改成功");
		this.setPath("shuifeijiage!listpage.action");
		return "succeed";
	}

	public String listall() {
		List shuifeijiageList = shuifeijiageDAO.findByExample(shuifeijiage);
		Map request = getRequestMap();
		request.put("shuifeijiageList", shuifeijiageList);
		return "list";
	}

	public String listpage() {
		List shuifeijiageList = shuifeijiageDAO.findByExample(shuifeijiage);
		Map request = getRequestMap();
		request.put("shuifeijiageList", shuifeijiageList);
		return "list";
	}
	
	/**
	* 删除
	*/
	public String del() {
		shuifeijiageDAO.delete(shuifeijiage);
		this.setMessage("删除成功");
		this.setPath("shuifeijiage!listpage.action");		
		return "succeed";
	}

	public ShuifeijiageDAO getShuifeijiageDAO() {
		return shuifeijiageDAO;
	}

	public void setShuifeijiageDAO(ShuifeijiageDAO shuifeijiageDAO) {
		this.shuifeijiageDAO = shuifeijiageDAO;
	}

	public Shuifeijiage getShuifeijiage() {
		return this.shuifeijiage;
	}

	public void setShuifeijiage(Shuifeijiage shuifeijiage) {
		this.shuifeijiage = shuifeijiage;
	}

}