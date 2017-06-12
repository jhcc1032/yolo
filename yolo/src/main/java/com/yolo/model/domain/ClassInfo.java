package com.yolo.model.domain;

import java.io.Serializable;
import java.util.List;

public class ClassInfo implements Serializable{
	private int ccode;		// 과목코드
	private String ctitle;		// 과목
	private int chour;			// 수업시간
	private int cscore;			// 학점(ex. 1주 or 2주 과정)
	
	
	public ClassInfo(){}
	public ClassInfo(int ccode, String ctitle, int chour, int cscore) {
		this.ccode = ccode;
		this.ctitle = ctitle;
		this.chour = chour;
		this.cscore = cscore;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public int getChour() {
		return chour;
	}
	public void setChour(int chour) {
		this.chour = chour;
	}
	public int getCscore() {
		return cscore;
	}
	public void setCscore(int cscore) {
		this.cscore = cscore;
	}
	
	
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ClassInfo [ccode=").append(ccode).append(", ctitle=")
				.append(ctitle).append(", chour=").append(chour)
				.append(", cscore=").append(cscore).append("]");
		return builder.toString();
	}
	
	
}
