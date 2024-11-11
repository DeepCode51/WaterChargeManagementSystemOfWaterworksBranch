package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.dao.JiesuantypeDAO;
import com.dao.ShoufeiDAO;
import com.dao.ShuibiaoDAO;
import com.dao.ShuifeijiageDAO;
import com.dao.UserDAO;
import com.entity.Jiesuantype;
import com.entity.Shoufei;
import com.entity.Shuibiao;
import com.entity.Shuifeijiage;
import com.entity.User;
import com.opensymphony.xwork2.ModelDriven;

import com.util.Pagination;

public class ShoufeiAction extends BaseAction implements ModelDriven<Shoufei> {
	@Autowired
	private ShoufeiDAO shoufeiDAO;
	@Autowired
	private ShuibiaoDAO shuibiaoDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private JiesuantypeDAO jiesuantypeDAO;

	@Autowired
	private ShuifeijiageDAO shuifeijiageDAO;

	public ShuifeijiageDAO getShuifeijiageDAO() {
		return shuifeijiageDAO;
	}

	public void setShuifeijiageDAO(ShuifeijiageDAO shuifeijiageDAO) {
		this.shuifeijiageDAO = shuifeijiageDAO;
	}

	public ShuibiaoDAO getShuibiaoDAO() {
		return shuibiaoDAO;
	}

	public void setShuibiaoDAO(ShuibiaoDAO shuibiaoDAO) {
		this.shuibiaoDAO = shuibiaoDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public JiesuantypeDAO getJiesuantypeDAO() {
		return jiesuantypeDAO;
	}

	public void setJiesuantypeDAO(JiesuantypeDAO jiesuantypeDAO) {
		this.jiesuantypeDAO = jiesuantypeDAO;
	}

	// 模型驱动使用的对象，通过登录执行的方法将用户名和密码封装在Shoufei对象里.
	private Shoufei shoufei = new Shoufei();

	public Shoufei getModel() {
		return shoufei;
	}

	public String toadd() {
		List jiesuantypeList = jiesuantypeDAO.findByExample(new Jiesuantype());
		getRequestMap().put("jiesuantypeList", jiesuantypeList);

		List userList = userDAO.findByExample(new User());
		getRequestMap().put("userList", userList);

		List shuibiaoList = shuibiaoDAO.findByExample(new Shuibiao());
		getRequestMap().put("shuibiaoList", shuibiaoList);

		List shuifeijiageList = shuifeijiageDAO.findByExample(new Shuifeijiage());
		getRequestMap().put("shuifeijiageList", shuifeijiageList);
		return "toadd";
	}

	public String add() {
		
		//计算金额
		Integer allmoney = shoufei.getShuijia() * shoufei.getShuifeivalue();
		shoufei.setShuifeimoney(allmoney);
		shoufeiDAO.save(shoufei);
		this.setMessage("超表成功");
		this.setPath("shoufei!toadd.action");
		return "succeed";
	}

	//
	public String toedit() {
		shoufei = shoufeiDAO.findById(shoufei.getId());
		getRequestMap().put("Shoufei", shoufei);
		
		List jiesuantypeList = jiesuantypeDAO.findByExample(new Jiesuantype());
		getRequestMap().put("jiesuantypeList", jiesuantypeList);

		List userList = userDAO.findByExample(new User());
		getRequestMap().put("userList", userList);

		List shuibiaoList = shuibiaoDAO.findByExample(new Shuibiao());
		getRequestMap().put("shuibiaoList", shuibiaoList);

		List shuifeijiageList = shuifeijiageDAO.findByExample(new Shuifeijiage());
		getRequestMap().put("shuifeijiageList", shuifeijiageList);
		
		
		return "toedit";
	}
	
	
	public String toshow() {
		shoufei = shoufeiDAO.findById(shoufei.getId());
		getRequestMap().put("Shoufei", shoufei);

		return "toshow";
	}
	

	// 修改的执行方法
	public String edit() {
		shoufeiDAO.merge(shoufei);
		this.setMessage("修改成功");
		this.setPath("shoufei!listpage.action");
		return "succeed";
	}

	public String listall() {
		List shoufeiList = shoufeiDAO.findByExample(shoufei);
		Map request = getRequestMap();
		request.put("shoufeiList", shoufeiList);
		return "list";
	}

	public String listpage() {
		List shoufeiList = shoufeiDAO.findByExample(shoufei);
		Map request = getRequestMap();
		request.put("shoufeiList", shoufeiList);
		return "list";
	}

	/**
	 * 删除
	 */
	public String del() {
		shoufeiDAO.delete(shoufei);
		this.setMessage("删除成功");
		this.setPath("shoufei!listpage.action");
		return "succeed";
	}

	public ShoufeiDAO getShoufeiDAO() {
		return shoufeiDAO;
	}

	public void setShoufeiDAO(ShoufeiDAO shoufeiDAO) {
		this.shoufeiDAO = shoufeiDAO;
	}

	public Shoufei getShoufei() {
		return this.shoufei;
	}

	public void setShoufei(Shoufei shoufei) {
		this.shoufei = shoufei;
	}

}