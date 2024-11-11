package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.entity.User;

public class UserDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(UserDAO.class);

	public int findCount() {
		String hql = "select count(*)from User";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 分页查找
	 */
	public List<User> findByPage(int begin, int pageSize) {
		DetachedCriteria critertia = DetachedCriteria.forClass(User.class);
		List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(
				critertia, begin, pageSize);
		return list;
	}
	
	
	
		/**
	 * 分页查找
	 */
	public List<User> findByPage(String queryString, int begin, int pageSize) {
		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((begin - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<User> list = (List<User>) query.list();
		session.close();

		return list;
	}
	

	public void save(User instance) {
		this.getHibernateTemplate().save(instance);
	}

	public void delete(User instance) {
		this.getHibernateTemplate().delete(instance);
	}

	public User findById(Integer id) {
		return (User) getHibernateTemplate().get("com.entity.User", id);
	}

	public List findByExample(User instance) {
		return getHibernateTemplate().findByExample(instance);
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from User as model where model." + propertyName
				+ "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findAll() {
		return getHibernateTemplate().find("from User");
	}

	public User merge(User instance) {
		return (User) getHibernateTemplate().merge(instance);
	}

	public void saveOrUpdate(User instance) {
		this.getHibernateTemplate().saveOrUpdate(instance);
	}

}