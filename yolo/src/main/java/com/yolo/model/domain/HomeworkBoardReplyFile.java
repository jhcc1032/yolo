package com.yolo.model.domain;

import java.io.Serializable;
public class HomeworkBoardReplyFile implements Serializable {
	private int rupno;
	private String rfileName;
	private String sfileName;
	private int rno;
	public HomeworkBoardReplyFile(){}
	public HomeworkBoardReplyFile(int rupno, String rfileName, String sfileName, int rno) {
		super();
		this.rupno = rupno;
		this.rfileName = rfileName;
		this.sfileName = sfileName;
		this.rno = rno;
	}
	public HomeworkBoardReplyFile(String rfileName, String sfileName) {
		super();
		this.rfileName = rfileName;
		this.sfileName = sfileName;
	}
	@Override
	public String toString() {
		return  new StringBuilder().append("HomeworkBoardReplyFile [rupno=")
				.append(rupno).append(", rfileName=")
				.append(rfileName).append(", fileName=")
				.append(sfileName).append(", rno=")
				.append(rno).append("]").toString();
	}
	public int getRupno() {
		return rupno;
	}
	public void setRupno(int rupno) {
		this.rupno = rupno;
	}

	public String getRfileName() {
		return rfileName;
	}
	public void setRfileName(String rfileName) {
		this.rfileName = rfileName;
	}
	public String getSfileName() {
		return sfileName;
	}
	public void setSfileName(String sfileName) {
		this.sfileName = sfileName;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	
}








