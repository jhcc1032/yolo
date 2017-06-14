package com.yolo.model.domain;

import java.io.Serializable;
public class QnaBoardReply implements Serializable {
	private int rno;
	private String contents;
	private String writer;
	private String regdate;
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	private int bno;
	public QnaBoardReply(){}
	
	public QnaBoardReply(int rno, String contents, String writer,
			String regdate, int bno) {
		super();
		this.rno = rno;
		this.contents = contents;
		this.writer = writer;
		this.regdate = regdate;
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
}








