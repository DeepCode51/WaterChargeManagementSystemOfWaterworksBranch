package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.util.Pagination;

import com.entity.Gonggao;
import com.dao.GonggaoDAO;

public class GonggaoAction extends BaseAction implements ModelDriven<Gonggao> {
	@Autowired
	private GonggaoDAO gonggaoDAO;

	// 模型驱动使用的对象，通过登录执行的方法将用户名和密码封装在Gonggao对象里.
	private Gonggao gonggao = new Gonggao();

	public Gonggao getModel() {
		return gonggao;
	}

	public String toadd() {
		return "toadd";
	}

	public String add() {
		gonggaoDAO.save(gonggao);
		this.setMessage("添加成功");
		this.setPath("gonggao!listpage.action");
		return "succeed";
	}

	//
	public String toedit() {
		gonggao = gonggaoDAO.findById(gonggao.getId());
		getRequestMap().put("Gonggao", gonggao);
		return "toedit";
	}

	// 修改的执行方法
	public String edit() {
		gonggaoDAO.merge(gonggao);
		this.setMessage("修改成功");
		this.setPath("gonggao!listpage.action");
		return "succeed";
	}

	public String listall() {
		List gonggaoList = gonggaoDAO.findByExample(gonggao);
		Map request = getRequestMap();
		request.put("gonggaoList", gonggaoList);
		return "list";
	}

	public String listpage() {
		List gonggaoList = gonggaoDAO.findByExample(gonggao);
		Map request = getRequestMap();
		request.put("gonggaoList", gonggaoList);
		return "list";
	}
	
	/**
	* 删除
	*/
	public String del() {
		gonggaoDAO.delete(gonggao);
		this.setMessage("删除成功");
		this.setPath("gonggao!listpage.action");		
		return "succeed";
	}

	public GonggaoDAO getGonggaoDAO() {
		return gonggaoDAO;
	}

	public void setGonggaoDAO(GonggaoDAO gonggaoDAO) {
		this.gonggaoDAO = gonggaoDAO;
	}

	public Gonggao getGonggao() {
		return this.gonggao;
	}

	public void setGonggao(Gonggao gonggao) {
		this.gonggao = gonggao;
	}

}