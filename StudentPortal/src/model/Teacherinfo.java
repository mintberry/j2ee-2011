package model;

import java.util.Date;

/**
 * Teacherinfo entity. @author MyEclipse Persistence Tools
 */

public class Teacherinfo implements java.io.Serializable {

	// Fields

	private String TId;
	private String name;
	private String sex;
	private Date birthday;
	private String nation;
	private String pinCode;
	private String title;
	private String email;
	private String address;
	private String phoneNumber;

	// Constructors

	/** default constructor */
	public Teacherinfo() {
	}

	/** minimal constructor */
	public Teacherinfo(String TId, String name, String sex, Date birthday,
			String pinCode, String title, String email) {
		this.TId = TId;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.pinCode = pinCode;
		this.title = title;
		this.email = email;
	}

	/** full constructor */
	public Teacherinfo(String TId, String name, String sex, Date birthday,
			String nation, String pinCode, String title, String email,
			String address, String phoneNumber) {
		this.TId = TId;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.nation = nation;
		this.pinCode = pinCode;
		this.title = title;
		this.email = email;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}

	// Property accessors

	public String getTId() {
		return this.TId;
	}

	public void setTId(String TId) {
		this.TId = TId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getPinCode() {
		return this.pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

}