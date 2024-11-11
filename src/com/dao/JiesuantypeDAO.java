package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.entity.Jiesuantype;

public class JiesuantypeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(JiesuantypeDAO.class);

	public int findCount() {
		String hql = "select count(*)from Jiesuantype";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 分页查找
	 */
	public List<Jiesuantype> findByPage(int begin, int pageSize) {
		DetachedCriteria critertia = DetachedCriteria.forClass(Jiesuantype.class);
		List<Jiesuantype> list = (List<Jiesuantype>) this.getHibernateTemplate().findByCriteria(
				critertia, begin, pageSize);
		return list;
	}
	
	
	
		/**
	 * 分页查找
	 */
	public List<Jiesuantype> findByPage(String queryString, int begin, int pageSize) {
		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((begin - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Jiesuantype> list = (List<Jiesuantype>) query.list();
		session.close();

		return list;
	}
	

	public void save(Jiesuantype instance) {
		this.getHibernateTemplate().save(instance);
	}

	public void delete(Jiesuantype instance) {
		this.getHibernateTemplate().delete(instance);
	}

	public Jiesuantype findById(Integer id) {
		return (Jiesuantype) getHibernateTemplate().get("com.entity.Jiesuantype", id);
	}

	public List findByExample(Jiesuantype instance) {
		return getHibernateTemplate().findByExample(instance);
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Jiesuantype as model where model." + propertyName
				+ "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findAll() {
		return getHibernateTemplate().find("from Jiesuantype");
	}

	public Jiesuantype merge(Jiesuantype instance) {
		return (Jiesuantype) getHibernateTemplate().merge(instance);
	}

	public void saveOrUpdate(Jiesuantype instance) {
		this.getHibernateTemplate().saveOrUpdate(instance);
	}

}