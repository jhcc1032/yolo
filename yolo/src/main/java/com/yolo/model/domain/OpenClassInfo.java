package com.yolo.model.domain;

import java.util.List;

public class OpenClassInfo {
	private int createcode;
	private String createdate;
	private int ccode;
	private String cid;
	
	public OpenClassInfo(){}
	public OpenClassInfo(int createcode, String createdate, int ccode, String cid) {
		this.createcode = createcode;
		this.createdate = createdate;
		this.ccode = ccode;
		this.cid = cid;
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
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OpenClassInfo [createcode=").append(createcode)
				.append(", createdate=").append(createdate).append(", ccode=")
				.append(ccode).append(", cid=").append(cid)
				.append("]");
		return builder.toString();
	}
	
	
	
	
}
