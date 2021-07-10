package com.seed.study.vo;

public class MainVo {

	private int userNo;
	private String userName;
	private int userAge;
	private String userPhone;
	private String userEmail;

	public MainVo() {
		super();
	}

	public MainVo(int userNo, String userName, int userAge, String userPhone, String userEmail) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userAge = userAge;
		this.userPhone = userPhone;
		this.userEmail = userEmail;

	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

}
