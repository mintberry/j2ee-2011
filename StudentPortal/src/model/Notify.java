package model;

import java.sql.Timestamp;

/**
 * Notify entity. @author MyEclipse Persistence Tools
 */

public class Notify implements java.io.Serializable {

	// Fields

	private Integer nid;
	private Timestamp datetime;
	private String author;
	private String content;
	private String accessory;
	private String title;

	// Constructors

	/** default constructor */
	public Notify() {
	}

	/** minimal constructor */
	public Notify(Timestamp datetime, String author, String content,
			String title) {
		this.datetime = datetime;
		this.author = author;
		this.content = content;
		this.title = title;
	}

	/** full constructor */
	public Notify(Timestamp datetime, String author, String content,
			String accessory, String title) {
		this.datetime = datetime;
		this.author = author;
		this.content = content;
		this.accessory = accessory;
		this.title = title;
	}

	// Property accessors

	public Integer getNid() {
		return this.nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	public Timestamp getDatetime() {
		return this.datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAccessory() {
		return this.accessory;
	}

	public void setAccessory(String accessory) {
		this.accessory = accessory;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}