package com.yolo.model.domain;

import java.io.Serializable;
public class NoticeBoardFile implements Serializable {
	private int no;
	private String rfileName;
	private String fileName;
	private int bno;
	public NoticeBoardFile(){}
	public NoticeBoardFile(int no, String rfileName, String fileName, int bno) {
		super();
		this.no = no;
		this.rfileName = rfileName;
		this.fileName = fileName;
		this.bno = bno;
	}
	@Override
	public String toString() {
		return  new StringBuilder().append("BoardFile [no=")
				.append(no).append(", rfileName=")
				.append(rfileName).append(", fileName=")
				.append(fileName).append(", bno=")
				.append(bno).append("]").toString();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRfileName() {
		return rfileName;
	}
	public void setRfileName(String rfileName) {
		this.rfileName = rfileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
}








