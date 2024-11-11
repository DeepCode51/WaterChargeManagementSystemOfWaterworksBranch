package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.entity.Admin;

public class AdminDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(AdminDAO.class);

	public int findCount() {
		String hql = "select count(*)from Admin";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 分页查找
	 */
	public List<Admin> findByPage(int begin, int pageSize) {
		DetachedCriteria critertia = DetachedCriteria.forClass(Admin.class);
		List<Admin> list = (List<Admin>) this.getHibernateTemplate().findByCriteria(
				critertia, begin, pageSize);
		return list;
	}

	public void save(Admin instance) {
		this.getHibernateTemplate().save(instance);
	}

	public void delete(Admin instance) {
		this.getHibernateTemplate().delete(instance);
	}

	public Admin findById(Integer id) {
		return (Admin) getHibernateTemplate().get("com.entity.Admin", id);
	}

	public List findByExample(Admin instance) {
		return getHibernateTemplate().findByExample(instance);
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Admin as model where model." + propertyName
				+ "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findAll() {
		return getHibernateTemplate().find("from Admin");
	}

	public Admin merge(Admin instance) {
		return (Admin) getHibernateTemplate().merge(instance);
	}

	public void saveOrUpdate(Admin instance) {
		this.getHibernateTemplate().saveOrUpdate(instance);
	}

}