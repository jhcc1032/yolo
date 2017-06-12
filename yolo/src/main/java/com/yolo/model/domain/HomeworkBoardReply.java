package com.yolo.model.domain;

public class HomeworkBoardReply {
	int rno;
	String contents;
	String writer;
	String regdate;
	int no;
	public HomeworkBoardReply() {
		super();
	}
	public HomeworkBoardReply(int rno, String contents, String writer,
			String regdate, int no) {
		super();
		this.rno = rno;
		this.contents = contents;
		this.writer = writer;
		this.regdate = regdate;
		this.no = no;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	
}
