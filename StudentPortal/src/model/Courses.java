package model;

/**
 * Courses entity. @author MyEclipse Persistence Tools
 */

public class Courses implements java.io.Serializable {

	// Fields

	private String courseId;
	private String name;
	private Integer credit;
	private Integer schedule0;
	private Integer schedule1;
	private Integer schedule2;
	private Integer schedule3;
	private String TId;
	private String TName;
	private Integer maxstudent;
	private String place;

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
	public Courses(String courseId, String name, Integer credit,
			Integer schedule0, Integer schedule1, Integer schedule2,
			Integer schedule3, String TId, String TName, Integer maxstudent,
			String place) {
		this.courseId = courseId;
		this.name = name;
		this.credit = credit;
		this.schedule0 = schedule0;
		this.schedule1 = schedule1;
		this.schedule2 = schedule2;
		this.schedule3 = schedule3;
		this.TId = TId;
		this.TName = TName;
		this.maxstudent = maxstudent;
		this.place = place;
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

	public Integer getSchedule0() {
		return this.schedule0;
	}

	public void setSchedule0(Integer schedule0) {
		this.schedule0 = schedule0;
	}

	public Integer getSchedule1() {
		return this.schedule1;
	}

	public void setSchedule1(Integer schedule1) {
		this.schedule1 = schedule1;
	}

	public Integer getSchedule2() {
		return this.schedule2;
	}

	public void setSchedule2(Integer schedule2) {
		this.schedule2 = schedule2;
	}

	public Integer getSchedule3() {
		return this.schedule3;
	}

	public void setSchedule3(Integer schedule3) {
		this.schedule3 = schedule3;
	}

	public String getTId() {
		return this.TId;
	}

	public void setTId(String TId) {
		this.TId = TId;
	}

	public String getTName() {
		return this.TName;
	}

	public void setTName(String TName) {
		this.TName = TName;
	}

	public Integer getMaxstudent() {
		return this.maxstudent;
	}

	public void setMaxstudent(Integer maxstudent) {
		this.maxstudent = maxstudent;
	}

	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

}