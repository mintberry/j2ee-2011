package model;

import java.util.Date;

/**
 * Files entity. @author MyEclipse Persistence Tools
 */

public class Files implements java.io.Serializable {

	// Fields

	private Integer FId;
	private String name;
	private Integer filesize;
	private String location;
	private String description;
	private Date updateDate;

	// Constructors

	/** default constructor */
	public Files() {
	}

	/** minimal constructor */
	public Files(String name) {
		this.name = name;
	}

	/** full constructor */
	public Files(String name, Integer filesize, String location,
			String description, Date updateDate) {
		this.name = name;
		this.filesize = filesize;
		this.location = location;
		this.description = description;
		this.updateDate = updateDate;
	}

	// Property accessors

	public Integer getFId() {
		return this.FId;
	}

	public void setFId(Integer FId) {
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

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

}