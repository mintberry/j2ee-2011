package model;

/**
 * StudentCourseFile entity. @author MyEclipse Persistence Tools
 */

public class StudentCourseFile implements
		java.io.Serializable {

	// Fields

	private Integer id;
	private String SId;
	private String courseId;
	private Integer FId;

	// Constructors

	/** default constructor */
	public StudentCourseFile() {
	}

	/** full constructor */
	public StudentCourseFile(String SId, String courseId, Integer FId) {
		this.SId = SId;
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

	public Integer getFId() {
		return this.FId;
	}

	public void setFId(Integer FId) {
		this.FId = FId;
	}

}