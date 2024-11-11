package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.entity.Gonggao;

public class GonggaoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(GonggaoDAO.class);

	public int findCount() {
		String hql = "select count(*)from Gonggao";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 分页查找
	 */
	public List<Gonggao> findByPage(int begin, int pageSize) {
		DetachedCriteria critertia = DetachedCriteria.forClass(Gonggao.class);
		List<Gonggao> list = (List<Gonggao>) this.getHibernateTemplate().findByCriteria(
				critertia, begin, pageSize);
		return list;
	}
	
	
	
		/**
	 * 分页查找
	 */
	public List<Gonggao> findByPage(String queryString, int begin, int pageSize) {
		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((begin - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Gonggao> list = (List<Gonggao>) query.list();
		session.close();

		return list;
	}
	

	public void save(Gonggao instance) {
		this.getHibernateTemplate().save(instance);
	}

	public void delete(Gonggao instance) {
		this.getHibernateTemplate().delete(instance);
	}

	public Gonggao findById(Integer id) {
		return (Gonggao) getHibernateTemplate().get("com.entity.Gonggao", id);
	}

	public List findByExample(Gonggao instance) {
		return getHibernateTemplate().findByExample(instance);
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Gonggao as model where model." + propertyName
				+ "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findAll() {
		return getHibernateTemplate().find("from Gonggao");
	}

	public Gonggao merge(Gonggao instance) {
		return (Gonggao) getHibernateTemplate().merge(instance);
	}

	public void saveOrUpdate(Gonggao instance) {
		this.getHibernateTemplate().saveOrUpdate(instance);
	}

}