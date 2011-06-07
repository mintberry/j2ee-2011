package model;

/**
 * CourseFile entity. @author MyEclipse Persistence Tools
 */

public class CourseFile implements java.io.Serializable {

	// Fields

	private Integer id;
	private String courseId;
	private Integer FId;

	// Constructors

	/** default constructor */
	public CourseFile() {
	}

	/** full constructor */
	public CourseFile(String courseId, Integer FId) {
		this.courseId = courseId;
		this.FId = FId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCourseId() {
		return this.courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public Integer getFId() {
		return this.FId;
	}

	public void setFId(Integer FId) {
		this.FId = FId;
	}

}