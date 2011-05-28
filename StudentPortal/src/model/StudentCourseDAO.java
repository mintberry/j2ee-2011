package model;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * StudentCourse entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see model.StudentCourse
 * @author MyEclipse Persistence Tools
 */

public class StudentCourseDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(StudentCourseDAO.class);
	// property constants
	public static final String _SID = "SId";
	public static final String COURSE_ID = "courseId";

	public void save(StudentCourse transientInstance) {
		log.debug("saving StudentCourse instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StudentCourse persistentInstance) {
		log.debug("deleting StudentCourse instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StudentCourse findById(java.lang.Integer id) {
		log.debug("getting StudentCourse instance with id: " + id);
		try {
			StudentCourse instance = (StudentCourse) getSession().get(
					"model.StudentCourse", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StudentCourse instance) {
		log.debug("finding StudentCourse instance by example");
		try {
			List results = getSession().createCriteria("model.StudentCourse")
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
		log.debug("finding StudentCourse instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from StudentCourse as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySId(Object SId) {
		return findByProperty(_SID, SId);
	}

	public List findByCourseId(Object courseId) {
		return findByProperty(COURSE_ID, courseId);
	}

	public List findAll() {
		log.debug("finding all StudentCourse instances");
		try {
			String queryString = "from StudentCourse";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StudentCourse merge(StudentCourse detachedInstance) {
		log.debug("merging StudentCourse instance");
		try {
			StudentCourse result = (StudentCourse) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StudentCourse instance) {
		log.debug("attaching dirty StudentCourse instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StudentCourse instance) {
		log.debug("attaching clean StudentCourse instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}