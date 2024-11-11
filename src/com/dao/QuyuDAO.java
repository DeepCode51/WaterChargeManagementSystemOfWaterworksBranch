package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.entity.Quyu;

public class QuyuDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(QuyuDAO.class);

	public int findCount() {
		String hql = "select count(*)from Quyu";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 分页查找
	 */
	public List<Quyu> findByPage(int begin, int pageSize) {
		DetachedCriteria critertia = DetachedCriteria.forClass(Quyu.class);
		List<Quyu> list = (List<Quyu>) this.getHibernateTemplate().findByCriteria(
				critertia, begin, pageSize);
		return list;
	}
	
	
	
		/**
	 * 分页查找
	 */
	public List<Quyu> findByPage(String queryString, int begin, int pageSize) {
		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((begin - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Quyu> list = (List<Quyu>) query.list();
		session.close();

		return list;
	}
	

	public void save(Quyu instance) {
		this.getHibernateTemplate().save(instance);
	}

	public void delete(Quyu instance) {
		this.getHibernateTemplate().delete(instance);
	}

	public Quyu findById(Integer id) {
		return (Quyu) getHibernateTemplate().get("com.entity.Quyu", id);
	}

	public List findByExample(Quyu instance) {
		return getHibernateTemplate().findByExample(instance);
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Quyu as model where model." + propertyName
				+ "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findAll() {
		return getHibernateTemplate().find("from Quyu");
	}

	public Quyu merge(Quyu instance) {
		return (Quyu) getHibernateTemplate().merge(instance);
	}

	public void saveOrUpdate(Quyu instance) {
		this.getHibernateTemplate().saveOrUpdate(instance);
	}

}