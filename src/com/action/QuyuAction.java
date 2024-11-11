package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.util.Pagination;

import com.entity.Quyu;
import com.dao.QuyuDAO;

public class QuyuAction extends BaseAction implements ModelDriven<Quyu> {
	@Autowired
	private QuyuDAO quyuDAO;

	// 模型驱动使用的对象，通过登录执行的方法将用户名和密码封装在Quyu对象里.
	private Quyu quyu = new Quyu();

	public Quyu getModel() {
		return quyu;
	}

	public String toadd() {
		return "toadd";
	}

	public String add() {
		quyuDAO.save(quyu);
		this.setMessage("添加成功");
		this.setPath("quyu!listpage.action");
		return "succeed";
	}

	//
	public String toedit() {
		quyu = quyuDAO.findById(quyu.getId());
		getRequestMap().put("Quyu", quyu);
		return "toedit";
	}

	// 修改的执行方法
	public String edit() {
		quyuDAO.merge(quyu);
		this.setMessage("修改成功");
		this.setPath("quyu!listpage.action");
		return "succeed";
	}

	public String listall() {
		List quyuList = quyuDAO.findByExample(quyu);
		Map request = getRequestMap();
		request.put("quyuList", quyuList);
		return "list";
	}

	public String listpage() {
		List quyuList = quyuDAO.findByExample(quyu);
		Map request = getRequestMap();
		request.put("quyuList", quyuList);
		return "list";
	}
	
	/**
	* 删除
	*/
	public String del() {
		quyuDAO.delete(quyu);
		this.setMessage("删除成功");
		this.setPath("quyu!listpage.action");		
		return "succeed";
	}

	public QuyuDAO getQuyuDAO() {
		return quyuDAO;
	}

	public void setQuyuDAO(QuyuDAO quyuDAO) {
		this.quyuDAO = quyuDAO;
	}

	public Quyu getQuyu() {
		return this.quyu;
	}

	public void setQuyu(Quyu quyu) {
		this.quyu = quyu;
	}

}