package model;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * Teacherinfo entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see model.Teacherinfo
 * @author MyEclipse Persistence Tools
 */

public class TeacherinfoDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(TeacherinfoDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String SEX = "sex";
	public static final String NATION = "nation";
	public static final String PIN_CODE = "pinCode";
	public static final String TITLE = "title";
	public static final String EMAIL = "email";
	public static final String ADDRESS = "address";
	public static final String PHONE_NUMBER = "phoneNumber";

	public void save(Teacherinfo transientInstance) {
		log.debug("saving Teacherinfo instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Teacherinfo persistentInstance) {
		log.debug("deleting Teacherinfo instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Teacherinfo findById(java.lang.String id) {
		log.debug("getting Teacherinfo instance with id: " + id);
		try {
			Teacherinfo instance = (Teacherinfo) getSession().get(
					"model.Teacherinfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Teacherinfo instance) {
		log.debug("finding Teacherinfo instance by example");
		try {
			List results = getSession().createCriteria("model.Teacherinfo")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Teacherinfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Teacherinfo as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List findByNation(Object nation) {
		return findByProperty(NATION, nation);
	}

	public List findByPinCode(Object pinCode) {
		return findByProperty(PIN_CODE, pinCode);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List findByPhoneNumber(Object phoneNumber) {
		return findByProperty(PHONE_NUMBER, phoneNumber);
	}

	public List findAll() {
		log.debug("finding all Teacherinfo instances");
		try {
			String queryString = "from Teacherinfo";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Teacherinfo merge(Teacherinfo detachedInstance) {
		log.debug("merging Teacherinfo instance");
		try {
			Teacherinfo result = (Teacherinfo) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Teacherinfo instance) {
		log.debug("attaching dirty Teacherinfo instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Teacherinfo instance) {
		log.debug("attaching clean Teacherinfo instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}