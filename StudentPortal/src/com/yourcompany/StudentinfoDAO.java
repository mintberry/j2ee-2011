package com.yourcompany;

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Studentinfo entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.yourcompany.Studentinfo
 * @author MyEclipse Persistence Tools
 */

public class StudentinfoDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(StudentinfoDAO.class);
	// property constants
	public static final String PASSWORD = "password";
	public static final String NAME = "name";
	public static final String SEX = "sex";
	public static final String NATION = "nation";
	public static final String PIN_CODE = "pinCode";
	public static final String EMAIL = "email";
	public static final String ADDRESS = "address";
	public static final String PHONE_NUMBER = "phoneNumber";

	public void save(Studentinfo transientInstance) {
		log.debug("saving Studentinfo instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Studentinfo persistentInstance) {
		log.debug("deleting Studentinfo instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Studentinfo findById(java.lang.String id) {
		log.debug("getting Studentinfo instance with id: " + id);
		try {
			Studentinfo instance = (Studentinfo) getSession().get(
					com.yourcompany.Studentinfo.class, id);                 //
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Studentinfo instance) {
		log.debug("finding Studentinfo instance by example");
		try {
			List results = getSession().createCriteria(
					"com.yourcompany.Studentinfo")
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
		log.debug("finding Studentinfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Studentinfo as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
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
		log.debug("finding all Studentinfo instances");
		try {
			String queryString = "from Studentinfo";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Studentinfo merge(Studentinfo detachedInstance) {
		log.debug("merging Studentinfo instance");
		try {
			Studentinfo result = (Studentinfo) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Studentinfo instance) {
		log.debug("attaching dirty Studentinfo instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Studentinfo instance) {
		log.debug("attaching clean Studentinfo instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}