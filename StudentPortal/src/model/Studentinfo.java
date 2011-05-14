package model;

import java.util.Date;

/**
 * Studentinfo entity. @author MyEclipse Persistence Tools
 */

public class Studentinfo implements java.io.Serializable {

	// Fields

	private String SId;
	private String password;
	private String name;
	private String sex;
	private Date birthday;
	private String nation;
	private String pinCode;
	private String email;
	private String address;
	private String phoneNumber;

	// Constructors

	/** default constructor */
	public Studentinfo() {
	}

	/** minimal constructor */
	public Studentinfo(String SId, String password, String name, String sex,
			Date birthday, String pinCode, String email) {
		this.SId = SId;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.pinCode = pinCode;
		this.email = email;
	}

	/** full constructor */
	public Studentinfo(String SId, String password, String name, String sex,
			Date birthday, String nation, String pinCode, String email,
			String address, String phoneNumber) {
		this.SId = SId;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.nation = nation;
		this.pinCode = pinCode;
		this.email = email;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}

	// Property accessors

	public String getSId() {
		return this.SId;
	}

	public void setSId(String SId) {
		this.SId = SId;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
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