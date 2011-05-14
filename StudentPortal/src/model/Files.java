package model;

import java.util.Date;

/**
 * Files entity. @author MyEclipse Persistence Tools
 */

public class Files implements java.io.Serializable {

	// Fields

	private String FId;
	private String name;
	private Integer filesize;
	private String location;
	private Date createDate;
	private Date updateDate;

	// Constructors

	/** default constructor */
	public Files() {
	}

	/** minimal constructor */
	public Files(String FId, String name) {
		this.FId = FId;
		this.name = name;
	}

	/** full constructor */
	public Files(String FId, String name, Integer filesize, String location,
			Date createDate, Date updateDate) {
		this.FId = FId;
		this.name = name;
		this.filesize = filesize;
		this.location = location;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	// Property accessors

	public String getFId() {
		return this.FId;
	}

	public void setFId(String FId) {
		this.FId = FId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getFilesize() {
		return this.filesize;
	}

	public void setFilesize(Integer filesize) {
		this.filesize = filesize;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

}