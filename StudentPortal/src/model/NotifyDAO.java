package model;

import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * Notify entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see model.Notify
 * @author MyEclipse Persistence Tools
 */

public class NotifyDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(NotifyDAO.class);
	// property constants
	public static final String AUTHOR = "author";
	public static final String CONTENT = "content";
	public static final String ACCESSORY = "accessory";
	public static final String TITLE = "title";

	public void save(Notify transientInstance) {
		log.debug("saving Notify instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Notify persistentInstance) {
		log.debug("deleting Notify instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Notify findById(java.lang.Integer id) {
		log.debug("getting Notify instance with id: " + id);
		try {
			Notify instance = (Notify) getSession().get("model.Notify", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Notify instance) {
		log.debug("finding Notify instance by example");
		try {
			List results = getSession().createCriteria("model.Notify").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Notify instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Notify as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAuthor(Object author) {
		return findByProperty(AUTHOR, author);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByAccessory(Object accessory) {
		return findByProperty(ACCESSORY, accessory);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findAll() {
		log.debug("finding all Notify instances");
		try {
			String queryString = "from Notify";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Notify merge(Notify detachedInstance) {
		log.debug("merging Notify instance");
		try {
			Notify result = (Notify) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Notify instance) {
		log.debug("attaching dirty Notify instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Notify instance) {
		log.debug("attaching clean Notify instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}