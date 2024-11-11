package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.AdminDAO;
import com.dao.UserDAO;
import com.entity.Admin;
import com.entity.User;

public class loginService {
	private AdminDAO adminDAO;
	private UserDAO userDAO;

	public String login(String userName, String userPw, int userType) {
		System.out.println("userType" + userType);
		try {
			Thread.sleep(700);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String result = "no";

		if (userType == 0)//
		{
			String sql = "from Admin where identity = '管理员' and username=? and userpwd=?";
			Object[] con = { userName, userPw };
			List adminList = adminDAO.getHibernateTemplate().find(sql, con);
			if (adminList.size() == 0) {
				result = "no";
			} else {
				WebContext ctx = WebContextFactory.get();
				HttpSession session = ctx.getSession();
				Admin admin = (Admin) adminList.get(0);
				session.setAttribute("userType", 0);
				session.setAttribute("admin", admin);
				result = "yes";
			}
		}
		if (userType == 1) {
			String sql = "from User where loginname=? and pwd=?";
			Object[] con = { userName, userPw };
			List userList = userDAO.getHibernateTemplate().find(sql, con);
			if (userList.size() == 0) {
				result = "no";
			} else {
				WebContext ctx = WebContextFactory.get();
				HttpSession session = ctx.getSession();
				User user = (User) userList.get(0);
				session.setAttribute("userType", 1);
				session.setAttribute("user", user);
				result = "yes";
			}
		}
		return result;
	}

	public String adminPwEdit(String userPwNew) {
		System.out.println("DDDD");
		try {
			Thread.sleep(700);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get();
		HttpSession session = ctx.getSession();

		Admin admin = (Admin) session.getAttribute("admin");
		admin.setUserpwd(userPwNew);

		adminDAO.getHibernateTemplate().update(admin);
		session.setAttribute("admin", admin);

		return "yes";
	}

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

}
