package model;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * Courses entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see model.Courses
 * @author MyEclipse Persistence Tools
 */

public class CoursesDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(CoursesDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String CREDIT = "credit";
	public static final String SCHEDULE0 = "schedule0";
	public static final String SCHEDULE1 = "schedule1";
	public static final String SCHEDULE2 = "schedule2";
	public static final String SCHEDULE3 = "schedule3";
	public static final String _TID = "TId";
	public static final String _TNAME = "TName";
	public static final String MAXSTUDENT = "maxstudent";
	public static final String PLACE = "place";

	public void save(Courses transientInstance) {
		log.debug("saving Courses instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Courses persistentInstance) {
		log.debug("deleting Courses instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Courses findById(java.lang.String id) {
		log.debug("getting Courses instance with id: " + id);
		try {
			Courses instance = (Courses) getSession().get("model.Courses", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Courses instance) {
		log.debug("finding Courses instance by example");
		try {
			List results = getSession().createCriteria("model.Courses").add(
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
		log.debug("finding Courses instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Courses as model where model."
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

	public List findByCredit(Object credit) {
		return findByProperty(CREDIT, credit);
	}

	public List findBySchedule0(Object schedule0) {
		return findByProperty(SCHEDULE0, schedule0);
	}

	public List findBySchedule1(Object schedule1) {
		return findByProperty(SCHEDULE1, schedule1);
	}

	public List findBySchedule2(Object schedule2) {
		return findByProperty(SCHEDULE2, schedule2);
	}

	public List findBySchedule3(Object schedule3) {
		return findByProperty(SCHEDULE3, schedule3);
	}

	public List findByTId(Object TId) {
		return findByProperty(_TID, TId);
	}

	public List findByTName(Object TName) {
		return findByProperty(_TNAME, TName);
	}

	public List findByMaxstudent(Object maxstudent) {
		return findByProperty(MAXSTUDENT, maxstudent);
	}

	public List findByPlace(Object place) {
		return findByProperty(PLACE, place);
	}

	public List findAll() {
		log.debug("finding all Courses instances");
		try {
			String queryString = "from Courses";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Courses merge(Courses detachedInstance) {
		log.debug("merging Courses instance");
		try {
			Courses result = (Courses) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Courses instance) {
		log.debug("attaching dirty Courses instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Courses instance) {
		log.debug("attaching clean Courses instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}