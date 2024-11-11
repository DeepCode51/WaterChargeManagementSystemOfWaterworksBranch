package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.entity.Shuibiao;

public class ShuibiaoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ShuibiaoDAO.class);

	public int findCount() {
		String hql = "select count(*)from Shuibiao";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 分页查找
	 */
	public List<Shuibiao> findByPage(int begin, int pageSize) {
		DetachedCriteria critertia = DetachedCriteria.forClass(Shuibiao.class);
		List<Shuibiao> list = (List<Shuibiao>) this.getHibernateTemplate().findByCriteria(
				critertia, begin, pageSize);
		return list;
	}
	
	
	
		/**
	 * 分页查找
	 */
	public List<Shuibiao> findByPage(String queryString, int begin, int pageSize) {
		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((begin - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Shuibiao> list = (List<Shuibiao>) query.list();
		session.close();

		return list;
	}
	

	public void save(Shuibiao instance) {
		this.getHibernateTemplate().save(instance);
	}

	public void delete(Shuibiao instance) {
		this.getHibernateTemplate().delete(instance);
	}

	public Shuibiao findById(Integer id) {
		return (Shuibiao) getHibernateTemplate().get("com.entity.Shuibiao", id);
	}

	public List findByExample(Shuibiao instance) {
		return getHibernateTemplate().findByExample(instance);
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Shuibiao as model where model." + propertyName
				+ "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findAll() {
		return getHibernateTemplate().find("from Shuibiao");
	}

	public Shuibiao merge(Shuibiao instance) {
		return (Shuibiao) getHibernateTemplate().merge(instance);
	}

	public void saveOrUpdate(Shuibiao instance) {
		this.getHibernateTemplate().saveOrUpdate(instance);
	}

}