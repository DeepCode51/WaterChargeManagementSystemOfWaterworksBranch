package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.entity.Shoufei;

public class ShoufeiDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ShoufeiDAO.class);

	public int findCount() {
		String hql = "select count(*)from Shoufei";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 分页查找
	 */
	public List<Shoufei> findByPage(int begin, int pageSize) {
		DetachedCriteria critertia = DetachedCriteria.forClass(Shoufei.class);
		List<Shoufei> list = (List<Shoufei>) this.getHibernateTemplate().findByCriteria(
				critertia, begin, pageSize);
		return list;
	}
	
	
	
		/**
	 * 分页查找
	 */
	public List<Shoufei> findByPage(String queryString, int begin, int pageSize) {
		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((begin - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Shoufei> list = (List<Shoufei>) query.list();
		session.close();

		return list;
	}
	

	public void save(Shoufei instance) {
		this.getHibernateTemplate().save(instance);
	}

	public void delete(Shoufei instance) {
		this.getHibernateTemplate().delete(instance);
	}

	public Shoufei findById(Integer id) {
		return (Shoufei) getHibernateTemplate().get("com.entity.Shoufei", id);
	}

	public List findByExample(Shoufei instance) {
		return getHibernateTemplate().findByExample(instance);
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Shoufei as model where model." + propertyName
				+ "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findAll() {
		return getHibernateTemplate().find("from Shoufei");
	}

	public Shoufei merge(Shoufei instance) {
		return (Shoufei) getHibernateTemplate().merge(instance);
	}

	public void saveOrUpdate(Shoufei instance) {
		this.getHibernateTemplate().saveOrUpdate(instance);
	}

}