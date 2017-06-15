package com.yolo.model.domain;

import java.io.Serializable;

public class Member implements Serializable {

	private int empno;
	private int mno;
	private String id;
	private String password;
	private String auth;
	private String name;
	private String mgroup;
	private String email;
	private String enteryear;
	private String withdraw;
	
	public Member() {
	}

	public Member(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public Member(int empno, int mno, String id, String password, String auth,
			String name, String mgroup, String email, String enteryear,
			String withdraw) {
		super();
		this.empno = empno;
		this.mno = mno;
		this.id = id;
		this.password = password;
		this.auth = auth;
		this.name = name;
		this.mgroup = mgroup;
		this.email = email;
		this.enteryear = enteryear;
		this.withdraw = withdraw;
	}
	
	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMgroup() {
		return mgroup;
	}

	public void setMgroup(String mgroup) {
		this.mgroup = mgroup;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getenteryear() {
		return enteryear;
	}

	public void setenteryear(String enteryear) {
		this.enteryear = enteryear;
	}

	public String getWithdraw() {
		return withdraw;
	}

	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}

	@Override
	public String toString() {
		return "Member [empno=" + empno + ", mno=" + mno + ", id=" + id
				+ ", password=" + password + ", auth=" + auth + ", name="
				+ name + ", mgroup=" + mgroup + ", email=" + email
				+ ", enteryear=" + enteryear + ", withdraw=" + withdraw + "]";
	}
}
