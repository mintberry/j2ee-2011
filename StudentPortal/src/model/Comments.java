package model;

import java.util.Date;

/**
 * Comments entity. @author MyEclipse Persistence Tools
 */

public class Comments implements java.io.Serializable {

	// Fields

	private String commentId;
	private String content;
	private Date createDate;
	private Date updateDate;

	// Constructors

	/** default constructor */
	public Comments() {
	}

	/** minimal constructor */
	public Comments(String commentId) {
		this.commentId = commentId;
	}

	/** full constructor */
	public Comments(String commentId, String content, Date createDate,
			Date updateDate) {
		this.commentId = commentId;
		this.content = content;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	// Property accessors

	public String getCommentId() {
		return this.commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
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