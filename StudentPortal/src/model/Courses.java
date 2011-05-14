package model;

/**
 * Courses entity. @author MyEclipse Persistence Tools
 */

public class Courses implements java.io.Serializable {

	// Fields

	private String courseId;
	private String name;
	private Integer credit;

	// Constructors

	/** default constructor */
	public Courses() {
	}

	/** minimal constructor */
	public Courses(String courseId, String name) {
		this.courseId = courseId;
		this.name = name;
	}

	/** full constructor */
	public Courses(String courseId, String name, Integer credit) {
		this.courseId = courseId;
		this.name = name;
		this.credit = credit;
	}

	// Property accessors

	public String getCourseId() {
		return this.courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCredit() {
		return this.credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

}