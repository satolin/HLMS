package com.domain;

public class User {
	private int user_id;
	private String uname;
	private String passwd;
	private String age;
	private String phone;
	private String power;
	private int count;
	
	private House houseinfo;

	public int getUser_id() {
		return user_id;
	}

	public String getUname() {
		return uname;
	}
	
	public String getPasswd() {
		return passwd;
	}

	public String getAge() {
		return age;
	}
	
	public House getHouseinfo() {
		return houseinfo;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public void setUname(String uname) {
		this.uname = uname;
	}

	public void setPassed(String passwd) {
		this.passwd = passwd;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public void setHouseinfo(House houseinfo) {
		this.houseinfo = houseinfo;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
