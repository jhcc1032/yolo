package com.yolo.model.domain;

public class OpenClassInfo {
	private int createcode;
	private String createdate;
	private int ccode;
	public OpenClassInfo(){}
	public OpenClassInfo(int createcode, String createdate, int ccode) {
		this.createcode = createcode;
		this.createdate = createdate;
		this.ccode = ccode;
	}
	
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public int getCreatecode() {
		return createcode;
	}
	public void setCreatecode(int createcode) {
		this.createcode = createcode;
	}
	
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	
	@Override
	public String toString() {
		return "OpenClassInfo [createcode=" + createcode + ", createdate="
				+ createdate + ", ccode=" + ccode + "]";
	}
	
}
