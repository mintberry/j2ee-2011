package model;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * CourseFile entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see model.CourseFile
 * @author MyEclipse Persistence Tools
 */

public class CourseFileDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(CourseFileDAO.class);
	// property constants
	public static final String COURSE_ID = "courseId";
	public static final String _FID = "FId";

	public void save(CourseFile transientInstance) {
		log.debug("saving CourseFile instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CourseFile persistentInstance) {
		log.debug("deleting CourseFile instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CourseFile findById(java.lang.Integer id) {
		log.debug("getting CourseFile instance with id: " + id);
		try {
			CourseFile instance = (CourseFile) getSession().get(
					"model.CourseFile", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CourseFile instance) {
		log.debug("finding CourseFile instance by example");
		try {
			List results = getSession().createCriteria("model.CourseFile").add(
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
		log.debug("finding CourseFile instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CourseFile as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCourseId(Object courseId) {
		return findByProperty(COURSE_ID, courseId);
	}

	public List findByFId(Object FId) {
		return findByProperty(_FID, FId);
	}

	public List findAll() {
		log.debug("finding all CourseFile instances");
		try {
			String queryString = "from CourseFile";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CourseFile merge(CourseFile detachedInstance) {
		log.debug("merging CourseFile instance");
		try {
			CourseFile result = (CourseFile) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CourseFile instance) {
		log.debug("attaching dirty CourseFile instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CourseFile instance) {
		log.debug("attaching clean CourseFile instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}