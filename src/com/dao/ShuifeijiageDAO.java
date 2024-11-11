package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.entity.Shuifeijiage;

public class ShuifeijiageDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ShuifeijiageDAO.class);

	public int findCount() {
		String hql = "select count(*)from Shuifeijiage";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 分页查找
	 */
	public List<Shuifeijiage> findByPage(int begin, int pageSize) {
		DetachedCriteria critertia = DetachedCriteria.forClass(Shuifeijiage.class);
		List<Shuifeijiage> list = (List<Shuifeijiage>) this.getHibernateTemplate().findByCriteria(
				critertia, begin, pageSize);
		return list;
	}
	
	
	
		/**
	 * 分页查找
	 */
	public List<Shuifeijiage> findByPage(String queryString, int begin, int pageSize) {
		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((begin - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Shuifeijiage> list = (List<Shuifeijiage>) query.list();
		session.close();

		return list;
	}
	

	public void save(Shuifeijiage instance) {
		this.getHibernateTemplate().save(instance);
	}

	public void delete(Shuifeijiage instance) {
		this.getHibernateTemplate().delete(instance);
	}

	public Shuifeijiage findById(Integer id) {
		return (Shuifeijiage) getHibernateTemplate().get("com.entity.Shuifeijiage", id);
	}

	public List findByExample(Shuifeijiage instance) {
		return getHibernateTemplate().findByExample(instance);
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Shuifeijiage as model where model." + propertyName
				+ "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findAll() {
		return getHibernateTemplate().find("from Shuifeijiage");
	}

	public Shuifeijiage merge(Shuifeijiage instance) {
		return (Shuifeijiage) getHibernateTemplate().merge(instance);
	}

	public void saveOrUpdate(Shuifeijiage instance) {
		this.getHibernateTemplate().saveOrUpdate(instance);
	}

}