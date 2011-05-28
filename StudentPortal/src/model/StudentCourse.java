package model;

/**
 * StudentCourse entity. @author MyEclipse Persistence Tools
 */

public class StudentCourse implements java.io.Serializable {

	// Fields

	private Integer id;
	private String SId;
	private String courseId;

	// Constructors

	/** default constructor */
	public StudentCourse() {
	}

	/** full constructor */
	public StudentCourse(String SId, String courseId) {
		this.SId = SId;
		this.courseId = courseId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSId() {
		return this.SId;
	}

	public void setSId(String SId) {
		this.SId = SId;
	}

	public String getCourseId() {
		return this.courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

}