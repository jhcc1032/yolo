package com.yolo.model.domain;

public class SubjectInfo {

	 private String ctitle; 
	 private int createcode;
	 private int cscore;
	 
	 
	public int getCscore() {
		return cscore;
	}
	public void setCscore(int cscore) {
		this.cscore = cscore;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public int getCreatecode() {
		return createcode;
	}
	public void setCreatecode(int createcode) {
		this.createcode = createcode;
	}
	public SubjectInfo(String ctitle, int createcode, int cscore) {
		super();
		this.ctitle = ctitle;
		this.createcode = createcode;
		this.cscore = cscore;
	}
	 
	 public SubjectInfo(){}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SubjectInfo [ctitle=").append(ctitle)
				.append(", createcode=").append(createcode).append(", cscore=")
				.append(cscore).append("]");
		return builder.toString();
	}
	
	 
	 
	 
	 
}
